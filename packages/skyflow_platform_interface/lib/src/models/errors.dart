import 'package:freezed_annotation/freezed_annotation.dart';

part 'errors.freezed.dart';
part 'errors.g.dart';

@freezed

/// Wrapper class that represents an error with theSkyflow platform.
class SkyflowError<T> with _$SkyflowError<T>, Exception {
  @JsonSerializable(explicitToJson: true)
  const factory SkyflowError({
    required String message,
    @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) required T code,
  }) = _SkyflowErrorGeneric;

  factory SkyflowError.fromJson(Map<String, dynamic> json) =>
      _$SkyflowErrorFromJson<T>(json);
}

// ignore: avoid_as
T _dataFromJson<T>(Map<String, dynamic> input) => input['code'] as T;

Map<String, dynamic> _dataToJson<T>(T input) => {'code': input};

@freezed

/// Exception retrieved from theSkyflow platform.
class SkyflowException with _$SkyflowException, Exception {
  const factory SkyflowException({
    /// error details
    required LocalizedErrorMessage error,
  }) = _SkyflowException;

  factory SkyflowException.fromJson(Map<String, dynamic> json) =>
      _$SkyflowExceptionFromJson(json);
}

@freezed

/// Provides details about the error
class LocalizedErrorMessage with _$LocalizedErrorMessage {
  @JsonSerializable(explicitToJson: true)
  const factory LocalizedErrorMessage({
    /// The error code for example Cancelled
    required FailureCode code,

    /// Localized error message if any
    String? localizedMessage,

    /// Generic untranslated error message.
    String? message,

    ///Skyflow error code
    String? skyflowErrorCode,

    /// Code in case payment is declined
    String? declineCode,

    /// Error type
    String? type,
  }) = _LocalizedErrorMessage;

  factory LocalizedErrorMessage.fromJson(Map<String, dynamic> json) =>
      _$LocalizedErrorMessageFromJson(json);
}

enum FailureCode { failed, canceled, timeout }

class SkyflowConfigException implements Exception {
  const SkyflowConfigException(this.message);

  final String message;

  @override
  int get hashCode {
    int result = 17;
    result = 37 * result + message.hashCode;
    return result;
  }

  @override
  bool operator ==(Object other) {
    return other is SkyflowConfigException && other.message == message;
  }
}
