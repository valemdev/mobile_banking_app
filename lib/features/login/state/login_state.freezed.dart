// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoginState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoginState()';
  }
}

/// @nodoc
class $LoginStateCopyWith<$Res> {
  $LoginStateCopyWith(LoginState _, $Res Function(LoginState) __);
}

/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns on LoginState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitialState value)? initial,
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginSuccessState value)? success,
    TResult Function(LoginErrorState value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoginInitialState() when initial != null:
        return initial(_that);
      case LoginLoadingState() when loading != null:
        return loading(_that);
      case LoginSuccessState() when success != null:
        return success(_that);
      case LoginErrorState() when error != null:
        return error(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitialState value) initial,
    required TResult Function(LoginLoadingState value) loading,
    required TResult Function(LoginSuccessState value) success,
    required TResult Function(LoginErrorState value) error,
  }) {
    final _that = this;
    switch (_that) {
      case LoginInitialState():
        return initial(_that);
      case LoginLoadingState():
        return loading(_that);
      case LoginSuccessState():
        return success(_that);
      case LoginErrorState():
        return error(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginInitialState value)? initial,
    TResult? Function(LoginLoadingState value)? loading,
    TResult? Function(LoginSuccessState value)? success,
    TResult? Function(LoginErrorState value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case LoginInitialState() when initial != null:
        return initial(_that);
      case LoginLoadingState() when loading != null:
        return loading(_that);
      case LoginSuccessState() when success != null:
        return success(_that);
      case LoginErrorState() when error != null:
        return error(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String userName)? success,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LoginInitialState() when initial != null:
        return initial();
      case LoginLoadingState() when loading != null:
        return loading();
      case LoginSuccessState() when success != null:
        return success(_that.userName);
      case LoginErrorState() when error != null:
        return error(_that.errorMessage);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String userName) success,
    required TResult Function(String errorMessage) error,
  }) {
    final _that = this;
    switch (_that) {
      case LoginInitialState():
        return initial();
      case LoginLoadingState():
        return loading();
      case LoginSuccessState():
        return success(_that.userName);
      case LoginErrorState():
        return error(_that.errorMessage);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String userName)? success,
    TResult? Function(String errorMessage)? error,
  }) {
    final _that = this;
    switch (_that) {
      case LoginInitialState() when initial != null:
        return initial();
      case LoginLoadingState() when loading != null:
        return loading();
      case LoginSuccessState() when success != null:
        return success(_that.userName);
      case LoginErrorState() when error != null:
        return error(_that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class LoginInitialState extends LoginState {
  const LoginInitialState() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoginInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoginState.initial()';
  }
}

/// @nodoc

class LoginLoadingState extends LoginState {
  const LoginLoadingState() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoginLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoginState.loading()';
  }
}

/// @nodoc

class LoginSuccessState extends LoginState {
  const LoginSuccessState({required this.userName}) : super._();

  final String userName;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginSuccessStateCopyWith<LoginSuccessState> get copyWith =>
      _$LoginSuccessStateCopyWithImpl<LoginSuccessState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginSuccessState &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userName);

  @override
  String toString() {
    return 'LoginState.success(userName: $userName)';
  }
}

/// @nodoc
abstract mixin class $LoginSuccessStateCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory $LoginSuccessStateCopyWith(
          LoginSuccessState value, $Res Function(LoginSuccessState) _then) =
      _$LoginSuccessStateCopyWithImpl;
  @useResult
  $Res call({String userName});
}

/// @nodoc
class _$LoginSuccessStateCopyWithImpl<$Res>
    implements $LoginSuccessStateCopyWith<$Res> {
  _$LoginSuccessStateCopyWithImpl(this._self, this._then);

  final LoginSuccessState _self;
  final $Res Function(LoginSuccessState) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userName = null,
  }) {
    return _then(LoginSuccessState(
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class LoginErrorState extends LoginState {
  const LoginErrorState({required this.errorMessage}) : super._();

  final String errorMessage;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginErrorStateCopyWith<LoginErrorState> get copyWith =>
      _$LoginErrorStateCopyWithImpl<LoginErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginErrorState &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @override
  String toString() {
    return 'LoginState.error(errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $LoginErrorStateCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory $LoginErrorStateCopyWith(
          LoginErrorState value, $Res Function(LoginErrorState) _then) =
      _$LoginErrorStateCopyWithImpl;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class _$LoginErrorStateCopyWithImpl<$Res>
    implements $LoginErrorStateCopyWith<$Res> {
  _$LoginErrorStateCopyWithImpl(this._self, this._then);

  final LoginErrorState _self;
  final $Res Function(LoginErrorState) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(LoginErrorState(
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
