import 'dart:io';

import 'package:flutter/services.dart';
import 'package:skyflow_platform_interface/src/models/records.dart';
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
    return await _methodChannel.invokeMethod('initialize', {
      'vaultID': vaultId,
      'vaultURL': vaultUrl,
      'tokenProviderURL': tokenProviderURL,
      'env': env,
      'authToken': authToken,
    });
  }

  @override
  Future<void> insert({
    required SkyflowRecords records,
    Map<String, dynamic> options = const {},
  }) async {
    return await _methodChannel.invokeMethod('insert', {
      'records': records.toJson(),
      'options': options,
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
