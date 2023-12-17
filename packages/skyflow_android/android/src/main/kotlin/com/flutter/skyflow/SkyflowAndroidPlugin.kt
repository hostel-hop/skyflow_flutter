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
                val arguments = call.arguments as Map<String,Any>
                val tokenProviderURL = arguments["tokenProviderURL"] as String
                val headers = arguments["headers"] as Map<String, String>
                val vaultID = arguments["vaultID"] as String
                val vaultURL = arguments["vaultURL"]  as String
                val env = arguments["env"] as String

                return initializeSkyflowClient(
                    tokenProviderURL,
                    headers,
                    vaultID,
                    vaultURL,
                    env,
                    result
                )
            }
            else -> result.notImplemented()
        }
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding){

    }


    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onDetachedFromActivityForConfigChanges() {
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    }

    override fun onDetachedFromActivity() {
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


}

class FlutterTokenProvider: Skyflow.TokenProvider {
    private var tokenEndpoint: String
    private var headers: Map<String, String>

    constructor(tokenEndpoint: String, headers: Map<String, String>) {
        this.tokenEndpoint = tokenEndpoint
        this.headers = headers
    }

    override fun getBearerToken(callback: Callback) {
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

                        val tokenData = accessTokenObject["data"] as Map<String, String>
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