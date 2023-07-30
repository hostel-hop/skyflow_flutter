// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'errors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SkyflowError<T> _$SkyflowErrorFromJson<T>(Map<String, dynamic> json) {
  return _SkyflowErrorGeneric<T>.fromJson(json);
}

/// @nodoc
mixin _$SkyflowError<T> {
  String get message => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  T get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SkyflowErrorCopyWith<T, SkyflowError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkyflowErrorCopyWith<T, $Res> {
  factory $SkyflowErrorCopyWith(
          SkyflowError<T> value, $Res Function(SkyflowError<T>) then) =
      _$SkyflowErrorCopyWithImpl<T, $Res, SkyflowError<T>>;
  @useResult
  $Res call(
      {String message,
      @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) T code});
}

/// @nodoc
class _$SkyflowErrorCopyWithImpl<T, $Res, $Val extends SkyflowError<T>>
    implements $SkyflowErrorCopyWith<T, $Res> {
  _$SkyflowErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SkyflowErrorGenericCopyWith<T, $Res>
    implements $SkyflowErrorCopyWith<T, $Res> {
  factory _$$_SkyflowErrorGenericCopyWith(_$_SkyflowErrorGeneric<T> value,
          $Res Function(_$_SkyflowErrorGeneric<T>) then) =
      __$$_SkyflowErrorGenericCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {String message,
      @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) T code});
}

/// @nodoc
class __$$_SkyflowErrorGenericCopyWithImpl<T, $Res>
    extends _$SkyflowErrorCopyWithImpl<T, $Res, _$_SkyflowErrorGeneric<T>>
    implements _$$_SkyflowErrorGenericCopyWith<T, $Res> {
  __$$_SkyflowErrorGenericCopyWithImpl(_$_SkyflowErrorGeneric<T> _value,
      $Res Function(_$_SkyflowErrorGeneric<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
  }) {
    return _then(_$_SkyflowErrorGeneric<T>(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_SkyflowErrorGeneric<T> implements _SkyflowErrorGeneric<T> {
  const _$_SkyflowErrorGeneric(
      {required this.message,
      @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
      required this.code});

  factory _$_SkyflowErrorGeneric.fromJson(Map<String, dynamic> json) =>
      _$$_SkyflowErrorGenericFromJson(json);

  @override
  final String message;
  @override
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  final T code;

  @override
  String toString() {
    return 'SkyflowError<$T>(message: $message, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SkyflowErrorGeneric<T> &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.code, code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(code));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SkyflowErrorGenericCopyWith<T, _$_SkyflowErrorGeneric<T>> get copyWith =>
      __$$_SkyflowErrorGenericCopyWithImpl<T, _$_SkyflowErrorGeneric<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SkyflowErrorGenericToJson<T>(
      this,
    );
  }
}

abstract class _SkyflowErrorGeneric<T> implements SkyflowError<T> {
  const factory _SkyflowErrorGeneric(
      {required final String message,
      @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
      required final T code}) = _$_SkyflowErrorGeneric<T>;

  factory _SkyflowErrorGeneric.fromJson(Map<String, dynamic> json) =
      _$_SkyflowErrorGeneric<T>.fromJson;

  @override
  String get message;
  @override
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  T get code;
  @override
  @JsonKey(ignore: true)
  _$$_SkyflowErrorGenericCopyWith<T, _$_SkyflowErrorGeneric<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

SkyflowException _$SkyflowExceptionFromJson(Map<String, dynamic> json) {
  return _SkyflowException.fromJson(json);
}

/// @nodoc
mixin _$SkyflowException {
  /// error details
  LocalizedErrorMessage get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SkyflowExceptionCopyWith<SkyflowException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkyflowExceptionCopyWith<$Res> {
  factory $SkyflowExceptionCopyWith(
          SkyflowException value, $Res Function(SkyflowException) then) =
      _$SkyflowExceptionCopyWithImpl<$Res, SkyflowException>;
  @useResult
  $Res call({LocalizedErrorMessage error});

  $LocalizedErrorMessageCopyWith<$Res> get error;
}

/// @nodoc
class _$SkyflowExceptionCopyWithImpl<$Res, $Val extends SkyflowException>
    implements $SkyflowExceptionCopyWith<$Res> {
  _$SkyflowExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as LocalizedErrorMessage,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocalizedErrorMessageCopyWith<$Res> get error {
    return $LocalizedErrorMessageCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SkyflowExceptionCopyWith<$Res>
    implements $SkyflowExceptionCopyWith<$Res> {
  factory _$$_SkyflowExceptionCopyWith(
          _$_SkyflowException value, $Res Function(_$_SkyflowException) then) =
      __$$_SkyflowExceptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LocalizedErrorMessage error});

  @override
  $LocalizedErrorMessageCopyWith<$Res> get error;
}

/// @nodoc
class __$$_SkyflowExceptionCopyWithImpl<$Res>
    extends _$SkyflowExceptionCopyWithImpl<$Res, _$_SkyflowException>
    implements _$$_SkyflowExceptionCopyWith<$Res> {
  __$$_SkyflowExceptionCopyWithImpl(
      _$_SkyflowException _value, $Res Function(_$_SkyflowException) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_SkyflowException(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as LocalizedErrorMessage,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SkyflowException implements _SkyflowException {
  const _$_SkyflowException({required this.error});

  factory _$_SkyflowException.fromJson(Map<String, dynamic> json) =>
      _$$_SkyflowExceptionFromJson(json);

  /// error details
  @override
  final LocalizedErrorMessage error;

  @override
  String toString() {
    return 'SkyflowException(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SkyflowException &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SkyflowExceptionCopyWith<_$_SkyflowException> get copyWith =>
      __$$_SkyflowExceptionCopyWithImpl<_$_SkyflowException>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SkyflowExceptionToJson(
      this,
    );
  }
}

abstract class _SkyflowException implements SkyflowException {
  const factory _SkyflowException(
      {required final LocalizedErrorMessage error}) = _$_SkyflowException;

  factory _SkyflowException.fromJson(Map<String, dynamic> json) =
      _$_SkyflowException.fromJson;

  @override

  /// error details
  LocalizedErrorMessage get error;
  @override
  @JsonKey(ignore: true)
  _$$_SkyflowExceptionCopyWith<_$_SkyflowException> get copyWith =>
      throw _privateConstructorUsedError;
}

LocalizedErrorMessage _$LocalizedErrorMessageFromJson(
    Map<String, dynamic> json) {
  return _LocalizedErrorMessage.fromJson(json);
}

/// @nodoc
mixin _$LocalizedErrorMessage {
  /// The error code for example Cancelled
  FailureCode get code => throw _privateConstructorUsedError;

  /// Localized error message if any
  String? get localizedMessage => throw _privateConstructorUsedError;

  /// Generic untranslated error message.
  String? get message => throw _privateConstructorUsedError;

  ///Skyflow error code
  String? get skyflowErrorCode => throw _privateConstructorUsedError;

  /// Code in case payment is declined
  String? get declineCode => throw _privateConstructorUsedError;

  /// Error type
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalizedErrorMessageCopyWith<LocalizedErrorMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizedErrorMessageCopyWith<$Res> {
  factory $LocalizedErrorMessageCopyWith(LocalizedErrorMessage value,
          $Res Function(LocalizedErrorMessage) then) =
      _$LocalizedErrorMessageCopyWithImpl<$Res, LocalizedErrorMessage>;
  @useResult
  $Res call(
      {FailureCode code,
      String? localizedMessage,
      String? message,
      String? skyflowErrorCode,
      String? declineCode,
      String? type});
}

/// @nodoc
class _$LocalizedErrorMessageCopyWithImpl<$Res,
        $Val extends LocalizedErrorMessage>
    implements $LocalizedErrorMessageCopyWith<$Res> {
  _$LocalizedErrorMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? localizedMessage = freezed,
    Object? message = freezed,
    Object? skyflowErrorCode = freezed,
    Object? declineCode = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as FailureCode,
      localizedMessage: freezed == localizedMessage
          ? _value.localizedMessage
          : localizedMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      skyflowErrorCode: freezed == skyflowErrorCode
          ? _value.skyflowErrorCode
          : skyflowErrorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      declineCode: freezed == declineCode
          ? _value.declineCode
          : declineCode // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocalizedErrorMessageCopyWith<$Res>
    implements $LocalizedErrorMessageCopyWith<$Res> {
  factory _$$_LocalizedErrorMessageCopyWith(_$_LocalizedErrorMessage value,
          $Res Function(_$_LocalizedErrorMessage) then) =
      __$$_LocalizedErrorMessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FailureCode code,
      String? localizedMessage,
      String? message,
      String? skyflowErrorCode,
      String? declineCode,
      String? type});
}

/// @nodoc
class __$$_LocalizedErrorMessageCopyWithImpl<$Res>
    extends _$LocalizedErrorMessageCopyWithImpl<$Res, _$_LocalizedErrorMessage>
    implements _$$_LocalizedErrorMessageCopyWith<$Res> {
  __$$_LocalizedErrorMessageCopyWithImpl(_$_LocalizedErrorMessage _value,
      $Res Function(_$_LocalizedErrorMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? localizedMessage = freezed,
    Object? message = freezed,
    Object? skyflowErrorCode = freezed,
    Object? declineCode = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_LocalizedErrorMessage(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as FailureCode,
      localizedMessage: freezed == localizedMessage
          ? _value.localizedMessage
          : localizedMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      skyflowErrorCode: freezed == skyflowErrorCode
          ? _value.skyflowErrorCode
          : skyflowErrorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      declineCode: freezed == declineCode
          ? _value.declineCode
          : declineCode // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_LocalizedErrorMessage implements _LocalizedErrorMessage {
  const _$_LocalizedErrorMessage(
      {required this.code,
      this.localizedMessage,
      this.message,
      this.skyflowErrorCode,
      this.declineCode,
      this.type});

  factory _$_LocalizedErrorMessage.fromJson(Map<String, dynamic> json) =>
      _$$_LocalizedErrorMessageFromJson(json);

  /// The error code for example Cancelled
  @override
  final FailureCode code;

  /// Localized error message if any
  @override
  final String? localizedMessage;

  /// Generic untranslated error message.
  @override
  final String? message;

  ///Skyflow error code
  @override
  final String? skyflowErrorCode;

  /// Code in case payment is declined
  @override
  final String? declineCode;

  /// Error type
  @override
  final String? type;

  @override
  String toString() {
    return 'LocalizedErrorMessage(code: $code, localizedMessage: $localizedMessage, message: $message, skyflowErrorCode: $skyflowErrorCode, declineCode: $declineCode, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalizedErrorMessage &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.localizedMessage, localizedMessage) ||
                other.localizedMessage == localizedMessage) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.skyflowErrorCode, skyflowErrorCode) ||
                other.skyflowErrorCode == skyflowErrorCode) &&
            (identical(other.declineCode, declineCode) ||
                other.declineCode == declineCode) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, localizedMessage, message,
      skyflowErrorCode, declineCode, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocalizedErrorMessageCopyWith<_$_LocalizedErrorMessage> get copyWith =>
      __$$_LocalizedErrorMessageCopyWithImpl<_$_LocalizedErrorMessage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocalizedErrorMessageToJson(
      this,
    );
  }
}

abstract class _LocalizedErrorMessage implements LocalizedErrorMessage {
  const factory _LocalizedErrorMessage(
      {required final FailureCode code,
      final String? localizedMessage,
      final String? message,
      final String? skyflowErrorCode,
      final String? declineCode,
      final String? type}) = _$_LocalizedErrorMessage;

  factory _LocalizedErrorMessage.fromJson(Map<String, dynamic> json) =
      _$_LocalizedErrorMessage.fromJson;

  @override

  /// The error code for example Cancelled
  FailureCode get code;
  @override

  /// Localized error message if any
  String? get localizedMessage;
  @override

  /// Generic untranslated error message.
  String? get message;
  @override

  ///Skyflow error code
  String? get skyflowErrorCode;
  @override

  /// Code in case payment is declined
  String? get declineCode;
  @override

  /// Error type
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$_LocalizedErrorMessageCopyWith<_$_LocalizedErrorMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
