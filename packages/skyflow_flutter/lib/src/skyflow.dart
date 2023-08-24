import 'dart:async';

import 'package:skyflow_platform_interface/skyflow_platform_interface.dart';

/// [Skyflow] is the facade of the library and exposes the operations that can be
/// executed on the Skyflow platform.
///
class Skyflow {
  // Disables the platform override in order to use a manually registered
  // ignore: comment_references
  // [SharePlatform] for testing purposes.
  // See https://github.com/flutter/flutter/issues/52267 for more details.
  //
  Skyflow._();

  Future<void> initialise({
    required String vaultId,
    required String vaultUrl,
    required String tokenProviderURL,
    required String env,
    Map<String, dynamic> headers = const {},
  }) async {
    await _platform.initialise(
      vaultId: vaultId,
      vaultUrl: vaultUrl,
      tokenProviderURL: tokenProviderURL,
      env: env,
      headers: headers,
    );
  }

  Future<List> insert<T extends SkyflowRecord>({
    required SkyflowRecords<T> records,
    Map<String, dynamic> options = const {},
  }) async {
    return await _platform.insert(
      records: records,
      options: options,
    );
  }

  Future<Map<String, dynamic>> detokenize({
    required SkyflowTokens tokens,
    Map<String, dynamic> options = const {},
  }) async {
    return await _platform.detokenize(
      tokens: tokens,
      options: options,
    );
  }

  static final Skyflow instance = Skyflow._();

  static SkyflowPlatform? __platform;

  // This is to manually endorse the Linux plugin until automatic registration
  // of dart plugins is implemented.
  // See https://github.com/flutter/flutter/issues/52267 for more details.
  static SkyflowPlatform get _platform {
    __platform ??= SkyflowPlatform.instance;
    return __platform!;
  }
}
