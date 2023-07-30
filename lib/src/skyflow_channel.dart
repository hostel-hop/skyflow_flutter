import 'package:flutter/services.dart';

class SkyflowChannel {
  final MethodChannel _channel = const MethodChannel('flutter.skyflow"');

  Future<void> initialize({
    required String vaultId,
    required String vaultUrl,
    required String tokenProviderURL,
    required String env,
    required String authToken,
  }) async {
    await _channel.invokeMethod('initialize', {
      'vaultId': vaultId,
      'vaultUrl': vaultUrl,
      'tokenProviderURL': tokenProviderURL,
      'env': env,
      'authToken': authToken,
    });
  }
}
