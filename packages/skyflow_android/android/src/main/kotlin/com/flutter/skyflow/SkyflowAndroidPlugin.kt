package com.flutter.skyflow

import androidx.annotation.NonNull
import Skyflow.*
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.JSONMethodCodec
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import okhttp3.Headers.Companion.toHeaders
import org.json.JSONObject
import okhttp3.OkHttpClient
import org.json.JSONArray
import java.io.IOException


/** SkyflowAndroidPlugin */
class SkyflowAndroidPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private var initializationError: String? = null

    private var skyflowClient: Client? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter.skyflow", JSONMethodCodec.INSTANCE)
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (initializationError != null) {
            result.error(
                "flutter_skyflow initialization failed",
                """The plugin failed to initialize:
${initializationError ?: "Skyflow SDK did not initialize."}""",
                null
            )
            return
        }
        when (call.method) {
            "initialize" -> {
                val arguments = call.arguments as JSONObject

                val tokenProviderURL = arguments["tokenProviderURL"] as String
                val headers = arguments["headers"] as JSONObject
                val vaultID = arguments["vaultID"] as String
                val vaultURL = arguments["vaultURL"]  as String
                val env = arguments["env"] as String
                val headerMap = headers.toMap() as Map<String,String>;

                return initializeSkyflowClient(
                    tokenProviderURL, headerMap,
                    vaultID,
                    vaultURL,
                    env,
                    result
                )
            }
            "insert" -> {
                val records = call.argument<JSONObject>("records")!!
                val options = call.argument<JSONObject>("options")
                return insert(records, options, result)
                
            }
            "detokenize" -> {
                val records = call.argument<JSONObject>("records")!!
                return detokenize(records, result)
            }
            
            else -> result.notImplemented()
        }
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding){}


    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onDetachedFromActivityForConfigChanges() {}

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {}

    override fun onDetachedFromActivity() {}

    fun insert(
        records: JSONObject,
        options: JSONObject?,
        @NonNull result: Result
    ) {
        try {
            var insertOptions = InsertOptions()

            if(options != null && options.has("tokens") && options.has("upsert")){
                insertOptions = InsertOptions(
                        options["tokens"] as Boolean,
                        options["upsert"] as JSONArray?
                )
            }

            val flutterCallback = FlutterCallback(result)
            
            skyflowClient!!.insert(records, insertOptions,flutterCallback)
            
        } catch (e: Exception) {
            result.error("insert failed", e.message, null)
        }
    }

    fun detokenize(
        records: JSONObject,
        @NonNull result: Result
    ) {
        try {
            val flutterCallback = FlutterCallback(result)

            skyflowClient!!.detokenize(records, flutterCallback)
            
        } catch (e: Exception) {
            result.error("detokenize failed", e.message, null)
        }
    }

    fun initializeSkyflowClient(
        tokenProviderURL: String,
        headers: Map<String, String>,
        vaultID: String,
        vaultURL: String,
        env: String,
        @NonNull result: Result
    ) {
        try {
            var flutterTokenProvider = FlutterTokenProvider(
                tokenProviderURL,
                headers,
            ) 

            var config  = Configuration(
                    vaultID,
                vaultURL,
                flutterTokenProvider,
                Skyflow.Options(
                    Skyflow.LogLevel.ERROR,
                    if (env == "DEV") Skyflow.Env.DEV else Skyflow.Env.PROD
                )
            );
 
            skyflowClient = Skyflow.init(config);

            return result.success(true)
        } catch (e: Exception) {
            initializationError = e.message
            result.error("flutter_skyflow initialization failed", e.message, null)
        }
    }

    fun JSONObject.toMap(): Map<String, *> = keys().asSequence().associateWith {
        when (val value = this[it])
        {
            is JSONArray ->
            {
                val map = (0 until value.length()).associate { Pair(it.toString(), value[it]) }
                JSONObject(map).toMap().values.toList()
            }
            is JSONObject -> value.toMap()
            JSONObject.NULL -> null
            else            -> value
        }
    }
}


class FlutterTokenProvider: Skyflow.TokenProvider {
    private var tokenEndpoint: String
    private var headers: Map<String, String>

    constructor(tokenEndpoint: String, headers: Map<String, String>) {
        this.tokenEndpoint = tokenEndpoint
        this.headers = headers
    }

    override fun getBearerToken(callback: Callback) {
        println(headers)
        val request = okhttp3.Request.Builder()
            .url(tokenEndpoint)
            .headers(headers.toHeaders())
            .build()
        val okHttpClient = OkHttpClient()
        try {
            val thread = Thread {
                run {
                    okHttpClient.newCall(request).execute().use { response ->
                        if (!response.isSuccessful)
                            throw IOException("Unexpected code $response")

                        val responseBody = response.body;

                        val accessTokenObject = JSONObject(responseBody!!.string().toString())

                        println(accessTokenObject)

                        if(!accessTokenObject.has("data")){
                            callback.onFailure("The response from the server did not have the expection values")
                        }

                        val tokenData = accessTokenObject["data"] as JSONObject
                        val accessToken = tokenData["accessToken"]
                        callback.onSuccess("$accessToken")
                    }
                }
            }
            thread.start()
        }catch (exception:Exception){
            callback.onFailure(exception)
        }
    }
}

class FlutterCallback: Skyflow.Callback {
    var resultCallback: Result;
    
    constructor(resultCallback: Result) {
        this.resultCallback = resultCallback
    }

    override fun onSuccess(responseBody: Any) {
        resultCallback.success(responseBody)
    }

    override fun onFailure(exception: Any) {
        resultCallback.error("insert failed", exception.toString(), null)
    }
}