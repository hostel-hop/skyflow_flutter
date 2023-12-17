package com.flutter.skyflow

import android.annotation.SuppressLint
import androidx.annotation.NonNull
import Skyflow.*
import io.flutter.embedding.android.FlutterFragmentActivity
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
import com.facebook.react.bridge.ReadableMap


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
        if (initializationError != null || skyflowClient == null) {
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
                val tokenProviderURL = call.requiredArgument<String>("tokenProviderURL")
                val headers = call.requiredArgument<Map<String, String>>("headers")
                val vaultID = call.requiredArgument<String>("vaultID")
                val vaultURL = call.requiredArgument<String>("vaultURL")
                val env = call.requiredArgument<String>("env")

                return initializeSkyflowClient(tokenProviderURL, headers, vaultID, vaultURL, env)
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
            result.error("flutter_skyflow initialization failed", e.message, null)
        }
    }


}

private inline fun <reified T> MethodCall.optionalArgument(key: String): T? {
    val value = argument<T>(key)
    if (value == JSONObject.NULL)
        return null
    if (T::class.java == ReadableMap::class.java) {
        return ReadableMap(argument<JSONObject>(key) ?: JSONObject()) as T
    }
    return value
}

private inline fun <reified T> MethodCall.requiredArgument(key: String): T {
    if (T::class.java == ReadableMap::class.java) {
        return ReadableMap(argument<JSONObject>(key) ?: error("Required parameter $key not set")) as T
    }
    return argument<T>(key) ?: error("Required parameter $key not set")
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