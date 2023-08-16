import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:skyflow_platform_interface/src/models/records.dart';
import 'package:skyflow_platform_interface/src/models/token.dart';

import 'method_channel_skyflow.dart';

abstract class SkyflowPlatform extends PlatformInterface {
  SkyflowPlatform() : super(token: _token);

  static final Object _token = Object();

  static final SkyflowPlatform _instance =
      const MethodChannelSkyflowFactory().create();

  /// The default instance of [StripePlatform] to use.
  ///
  /// Defaults to [MethodChannelStripe].
  static SkyflowPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [SkyflowPlatform] when they register themselves.
  static set instance(SkyflowPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    instance = instance;
  }

  bool get updateSettingsLazily => true;

  Future<void> initialise({
    required String vaultId,
    required String vaultUrl,
    required String tokenProviderURL,
    required String env,
    Map<String, dynamic> headers = const {},
  });

  Future<List> insert<T extends SkyflowRecord>({
    required SkyflowRecords<T> records,
    Map<String, dynamic> options = const {},
  });

  Future<List<SkyflowTokenValue>> detokenize({
    required SkyflowTokens tokens,
    Map<String, dynamic> options = const {},
  });
}
