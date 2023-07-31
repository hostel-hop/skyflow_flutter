// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'errors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SkyflowErrorGeneric<T> _$$_SkyflowErrorGenericFromJson<T>(
        Map<String, dynamic> json) =>
    _$_SkyflowErrorGeneric<T>(
      message: json['message'] as String,
      code: _dataFromJson(json['code'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SkyflowErrorGenericToJson<T>(
        _$_SkyflowErrorGeneric<T> instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': _dataToJson(instance.code),
    };

_$_SkyflowException _$$_SkyflowExceptionFromJson(Map<String, dynamic> json) =>
    _$_SkyflowException(
      error:
          LocalizedErrorMessage.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SkyflowExceptionToJson(_$_SkyflowException instance) =>
    <String, dynamic>{
      'error': instance.error,
    };

_$_LocalizedErrorMessage _$$_LocalizedErrorMessageFromJson(
        Map<String, dynamic> json) =>
    _$_LocalizedErrorMessage(
      code: $enumDecode(_$FailureCodeEnumMap, json['code']),
      localizedMessage: json['localizedMessage'] as String?,
      message: json['message'] as String?,
      skyflowErrorCode: json['skyflowErrorCode'] as String?,
      declineCode: json['declineCode'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$_LocalizedErrorMessageToJson(
        _$_LocalizedErrorMessage instance) =>
    <String, dynamic>{
      'code': _$FailureCodeEnumMap[instance.code]!,
      'localizedMessage': instance.localizedMessage,
      'message': instance.message,
      'skyflowErrorCode': instance.skyflowErrorCode,
      'declineCode': instance.declineCode,
      'type': instance.type,
    };

const _$FailureCodeEnumMap = {
  FailureCode.failed: 'failed',
  FailureCode.canceled: 'canceled',
  FailureCode.timeout: 'timeout',
};
