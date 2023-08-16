import 'dart:io';

import 'package:flutter/services.dart';
import 'package:skyflow_platform_interface/src/models/errors.dart';
import 'package:skyflow_platform_interface/src/models/records.dart';
import 'package:skyflow_platform_interface/src/models/token.dart';
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
    Map<String, dynamic> headers = const {},
  }) async {
    return await _methodChannel.invokeMethod('initialize', {
      'vaultID': vaultId,
      'vaultURL': vaultUrl,
      'tokenProviderURL': tokenProviderURL,
      'env': env,
      'headers': headers,
    });
  }

  @override
  Future<List> insert<T extends SkyflowRecord>({
    required SkyflowRecords<T> records,
    Map<String, dynamic> options = const {},
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

    return result['records'];
  }

  @override
  Future<List<SkyflowTokenValue>> detokenize({
    required SkyflowTokens tokens,
    Map<String, dynamic> options = const {},
  }) async {
    final result =
        await _methodChannel.invokeMethod<Map<String, dynamic>>('detokenize', {
      'records': tokens.toJson(),
      'options': options,
    });

    if (result == null) {
      throw const SkyflowError(
        message: 'Error detokenizing records',
        code: 'detokenize_error',
      );
    }

    return (result['records'] as List)
        .map((e) => SkyflowTokenValue.fromJson(e as Map<String, dynamic>))
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
