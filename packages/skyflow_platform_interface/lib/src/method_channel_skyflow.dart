import 'dart:io';

import 'package:flutter/services.dart';
import 'package:skyflow_platform_interface/src/models/errors.dart';
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
  Future<List<T>> insert<T extends SkyflowRecord>({
    required SkyflowRecords<T> records,
    Map<String, dynamic> options = const {},
    required T Function(Map<String, dynamic>) recordFromJson,
  }) async {
    final result =
        await _methodChannel.invokeMethod<Map<String, dynamic>>('insert', {
      'records': records.toJson(),
      'options': options,
    });

    if (result == null) {
      throw const SkyflowError(
        message: 'Error inserting records',
        code: 'insert_error',
      );
    }

    return (result['records'] as List<Map<String, dynamic>>)
        .map((e) => recordFromJson(e))
        .toList();
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
