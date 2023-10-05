// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthenticationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext contextss, String phoneNumber)
        signIn,
    required TResult Function(
            BuildContext context, String userOTP, String verificationId)
        verifyOTP,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext contextss, String phoneNumber)? signIn,
    TResult? Function(
            BuildContext context, String userOTP, String verificationId)?
        verifyOTP,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext contextss, String phoneNumber)? signIn,
    TResult Function(
            BuildContext context, String userOTP, String verificationId)?
        verifyOTP,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignIn value) signIn,
    required TResult Function(VerifyOTP value) verifyOTP,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignIn value)? signIn,
    TResult? Function(VerifyOTP value)? verifyOTP,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignIn value)? signIn,
    TResult Function(VerifyOTP value)? verifyOTP,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationEventCopyWith<$Res> {
  factory $AuthenticationEventCopyWith(
          AuthenticationEvent value, $Res Function(AuthenticationEvent) then) =
      _$AuthenticationEventCopyWithImpl<$Res, AuthenticationEvent>;
}

/// @nodoc
class _$AuthenticationEventCopyWithImpl<$Res, $Val extends AuthenticationEvent>
    implements $AuthenticationEventCopyWith<$Res> {
  _$AuthenticationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SignInImplCopyWith<$Res> {
  factory _$$SignInImplCopyWith(
          _$SignInImpl value, $Res Function(_$SignInImpl) then) =
      __$$SignInImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext contextss, String phoneNumber});
}

/// @nodoc
class __$$SignInImplCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$SignInImpl>
    implements _$$SignInImplCopyWith<$Res> {
  __$$SignInImplCopyWithImpl(
      _$SignInImpl _value, $Res Function(_$SignInImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contextss = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$SignInImpl(
      contextss: null == contextss
          ? _value.contextss
          : contextss // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignInImpl implements SignIn {
  const _$SignInImpl({required this.contextss, required this.phoneNumber});

  @override
  final BuildContext contextss;
  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'AuthenticationEvent.signIn(contextss: $contextss, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInImpl &&
            (identical(other.contextss, contextss) ||
                other.contextss == contextss) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, contextss, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInImplCopyWith<_$SignInImpl> get copyWith =>
      __$$SignInImplCopyWithImpl<_$SignInImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext contextss, String phoneNumber)
        signIn,
    required TResult Function(
            BuildContext context, String userOTP, String verificationId)
        verifyOTP,
  }) {
    return signIn(contextss, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext contextss, String phoneNumber)? signIn,
    TResult? Function(
            BuildContext context, String userOTP, String verificationId)?
        verifyOTP,
  }) {
    return signIn?.call(contextss, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext contextss, String phoneNumber)? signIn,
    TResult Function(
            BuildContext context, String userOTP, String verificationId)?
        verifyOTP,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn(contextss, phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignIn value) signIn,
    required TResult Function(VerifyOTP value) verifyOTP,
  }) {
    return signIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignIn value)? signIn,
    TResult? Function(VerifyOTP value)? verifyOTP,
  }) {
    return signIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignIn value)? signIn,
    TResult Function(VerifyOTP value)? verifyOTP,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn(this);
    }
    return orElse();
  }
}

abstract class SignIn implements AuthenticationEvent {
  const factory SignIn(
      {required final BuildContext contextss,
      required final String phoneNumber}) = _$SignInImpl;

  BuildContext get contextss;
  String get phoneNumber;
  @JsonKey(ignore: true)
  _$$SignInImplCopyWith<_$SignInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyOTPImplCopyWith<$Res> {
  factory _$$VerifyOTPImplCopyWith(
          _$VerifyOTPImpl value, $Res Function(_$VerifyOTPImpl) then) =
      __$$VerifyOTPImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context, String userOTP, String verificationId});
}

/// @nodoc
class __$$VerifyOTPImplCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$VerifyOTPImpl>
    implements _$$VerifyOTPImplCopyWith<$Res> {
  __$$VerifyOTPImplCopyWithImpl(
      _$VerifyOTPImpl _value, $Res Function(_$VerifyOTPImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? userOTP = null,
    Object? verificationId = null,
  }) {
    return _then(_$VerifyOTPImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      userOTP: null == userOTP
          ? _value.userOTP
          : userOTP // ignore: cast_nullable_to_non_nullable
              as String,
      verificationId: null == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$VerifyOTPImpl implements VerifyOTP {
  const _$VerifyOTPImpl(
      {required this.context,
      required this.userOTP,
      required this.verificationId});

  @override
  final BuildContext context;
  @override
  final String userOTP;
  @override
  final String verificationId;

  @override
  String toString() {
    return 'AuthenticationEvent.verifyOTP(context: $context, userOTP: $userOTP, verificationId: $verificationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOTPImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.userOTP, userOTP) || other.userOTP == userOTP) &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, context, userOTP, verificationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOTPImplCopyWith<_$VerifyOTPImpl> get copyWith =>
      __$$VerifyOTPImplCopyWithImpl<_$VerifyOTPImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuildContext contextss, String phoneNumber)
        signIn,
    required TResult Function(
            BuildContext context, String userOTP, String verificationId)
        verifyOTP,
  }) {
    return verifyOTP(context, userOTP, verificationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BuildContext contextss, String phoneNumber)? signIn,
    TResult? Function(
            BuildContext context, String userOTP, String verificationId)?
        verifyOTP,
  }) {
    return verifyOTP?.call(context, userOTP, verificationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuildContext contextss, String phoneNumber)? signIn,
    TResult Function(
            BuildContext context, String userOTP, String verificationId)?
        verifyOTP,
    required TResult orElse(),
  }) {
    if (verifyOTP != null) {
      return verifyOTP(context, userOTP, verificationId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignIn value) signIn,
    required TResult Function(VerifyOTP value) verifyOTP,
  }) {
    return verifyOTP(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignIn value)? signIn,
    TResult? Function(VerifyOTP value)? verifyOTP,
  }) {
    return verifyOTP?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignIn value)? signIn,
    TResult Function(VerifyOTP value)? verifyOTP,
    required TResult orElse(),
  }) {
    if (verifyOTP != null) {
      return verifyOTP(this);
    }
    return orElse();
  }
}

abstract class VerifyOTP implements AuthenticationEvent {
  const factory VerifyOTP(
      {required final BuildContext context,
      required final String userOTP,
      required final String verificationId}) = _$VerifyOTPImpl;

  BuildContext get context;
  String get userOTP;
  String get verificationId;
  @JsonKey(ignore: true)
  _$$VerifyOTPImplCopyWith<_$VerifyOTPImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthenticationState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthenticationStateCopyWith<AuthenticationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res, AuthenticationState>;
  @useResult
  $Res call({bool isLoading, bool isError});
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res, $Val extends AuthenticationState>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isError});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
  }) {
    return _then(_$InitialImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({required this.isLoading, required this.isError});

  @override
  final bool isLoading;
  @override
  final bool isError;

  @override
  String toString() {
    return 'AuthenticationState(isLoading: $isLoading, isError: $isError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements AuthenticationState {
  const factory _Initial(
      {required final bool isLoading,
      required final bool isError}) = _$InitialImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
