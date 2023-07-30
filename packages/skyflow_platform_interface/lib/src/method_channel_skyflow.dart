import 'dart:io';

import 'package:flutter/services.dart';
import 'package:skyflow_platform_interface/src/skyflow_platform_interface.dart';

/// An implementation of [SkyflowPlatform] that uses method channels.
class MethodChannelSkyflow extends SkyflowPlatform {
  MethodChannelSkyflow({
    required MethodChannel methodChannel,
    required bool platformIsIos,
    required bool platformIsAndroid,
  }) : _methodChannel = methodChannel {
    _init();
  }

  final MethodChannel _methodChannel;

  @override
  Future<void> initialise({
    required String vaultId,
    required String vaultUrl,
    required String tokenProviderURL,
    required String env,
    required String authToken,
  }) async {
    await _methodChannel.invokeMethod('initialize', {
      'vaultId': vaultId,
      'vaultUrl': vaultUrl,
      'tokenProviderURL': tokenProviderURL,
      'env': env,
      'authToken': authToken,
    });
  }

  void _init() {}
}

class MethodChannelSkyflowFactory {
  const MethodChannelSkyflowFactory();

  SkyflowPlatform create() => MethodChannelSkyflow(
        methodChannel: const MethodChannel(
          'flutter.skyflow',
          JSONMethodCodec(),
        ),
        platformIsIos: Platform.isIOS,
        platformIsAndroid: Platform.isAndroid,
      );
}
