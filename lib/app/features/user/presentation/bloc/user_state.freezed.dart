// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserState()';
}


}

/// @nodoc
class $UserStateCopyWith<$Res>  {
$UserStateCopyWith(UserState _, $Res Function(UserState) __);
}


/// Adds pattern-matching-related methods to [UserState].
extension UserStatePatterns on UserState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _InitialState value)?  initial,TResult Function( _LoadingState value)?  loading,TResult Function( _LoadedUserState value)?  loadedUser,TResult Function( _SaveState value)?  save,TResult Function( _ErroState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InitialState() when initial != null:
return initial(_that);case _LoadingState() when loading != null:
return loading(_that);case _LoadedUserState() when loadedUser != null:
return loadedUser(_that);case _SaveState() when save != null:
return save(_that);case _ErroState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _InitialState value)  initial,required TResult Function( _LoadingState value)  loading,required TResult Function( _LoadedUserState value)  loadedUser,required TResult Function( _SaveState value)  save,required TResult Function( _ErroState value)  error,}){
final _that = this;
switch (_that) {
case _InitialState():
return initial(_that);case _LoadingState():
return loading(_that);case _LoadedUserState():
return loadedUser(_that);case _SaveState():
return save(_that);case _ErroState():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _InitialState value)?  initial,TResult? Function( _LoadingState value)?  loading,TResult? Function( _LoadedUserState value)?  loadedUser,TResult? Function( _SaveState value)?  save,TResult? Function( _ErroState value)?  error,}){
final _that = this;
switch (_that) {
case _InitialState() when initial != null:
return initial(_that);case _LoadingState() when loading != null:
return loading(_that);case _LoadedUserState() when loadedUser != null:
return loadedUser(_that);case _SaveState() when save != null:
return save(_that);case _ErroState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( UserAccount user)?  loadedUser,TResult Function()?  save,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InitialState() when initial != null:
return initial();case _LoadingState() when loading != null:
return loading();case _LoadedUserState() when loadedUser != null:
return loadedUser(_that.user);case _SaveState() when save != null:
return save();case _ErroState() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( UserAccount user)  loadedUser,required TResult Function()  save,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _InitialState():
return initial();case _LoadingState():
return loading();case _LoadedUserState():
return loadedUser(_that.user);case _SaveState():
return save();case _ErroState():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( UserAccount user)?  loadedUser,TResult? Function()?  save,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _InitialState() when initial != null:
return initial();case _LoadingState() when loading != null:
return loading();case _LoadedUserState() when loadedUser != null:
return loadedUser(_that.user);case _SaveState() when save != null:
return save();case _ErroState() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _InitialState implements UserState {
   _InitialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserState.initial()';
}


}




/// @nodoc


class _LoadingState implements UserState {
   _LoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserState.loading()';
}


}




/// @nodoc


class _LoadedUserState implements UserState {
   _LoadedUserState({required this.user});
  

 final  UserAccount user;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedUserStateCopyWith<_LoadedUserState> get copyWith => __$LoadedUserStateCopyWithImpl<_LoadedUserState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadedUserState&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserState.loadedUser(user: $user)';
}


}

/// @nodoc
abstract mixin class _$LoadedUserStateCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory _$LoadedUserStateCopyWith(_LoadedUserState value, $Res Function(_LoadedUserState) _then) = __$LoadedUserStateCopyWithImpl;
@useResult
$Res call({
 UserAccount user
});




}
/// @nodoc
class __$LoadedUserStateCopyWithImpl<$Res>
    implements _$LoadedUserStateCopyWith<$Res> {
  __$LoadedUserStateCopyWithImpl(this._self, this._then);

  final _LoadedUserState _self;
  final $Res Function(_LoadedUserState) _then;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_LoadedUserState(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserAccount,
  ));
}


}

/// @nodoc


class _SaveState implements UserState {
   _SaveState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserState.save()';
}


}




/// @nodoc


class _ErroState implements UserState {
   _ErroState({required this.message});
  

 final  String message;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErroStateCopyWith<_ErroState> get copyWith => __$ErroStateCopyWithImpl<_ErroState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErroState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'UserState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErroStateCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory _$ErroStateCopyWith(_ErroState value, $Res Function(_ErroState) _then) = __$ErroStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErroStateCopyWithImpl<$Res>
    implements _$ErroStateCopyWith<$Res> {
  __$ErroStateCopyWithImpl(this._self, this._then);

  final _ErroState _self;
  final $Res Function(_ErroState) _then;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ErroState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
