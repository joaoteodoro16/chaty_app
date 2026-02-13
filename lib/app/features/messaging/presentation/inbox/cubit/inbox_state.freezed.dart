// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inbox_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InboxState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InboxState()';
}


}

/// @nodoc
class $InboxStateCopyWith<$Res>  {
$InboxStateCopyWith(InboxState _, $Res Function(InboxState) __);
}


/// Adds pattern-matching-related methods to [InboxState].
extension InboxStatePatterns on InboxState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _InitialState value)?  initial,TResult Function( _LoadingState value)?  loading,TResult Function( _DeleteMessagingState value)?  deleteMessaging,TResult Function( _LogoutState value)?  logout,TResult Function( _LoadedState value)?  loaded,TResult Function( _ErrorState value)?  erro,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InitialState() when initial != null:
return initial(_that);case _LoadingState() when loading != null:
return loading(_that);case _DeleteMessagingState() when deleteMessaging != null:
return deleteMessaging(_that);case _LogoutState() when logout != null:
return logout(_that);case _LoadedState() when loaded != null:
return loaded(_that);case _ErrorState() when erro != null:
return erro(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _InitialState value)  initial,required TResult Function( _LoadingState value)  loading,required TResult Function( _DeleteMessagingState value)  deleteMessaging,required TResult Function( _LogoutState value)  logout,required TResult Function( _LoadedState value)  loaded,required TResult Function( _ErrorState value)  erro,}){
final _that = this;
switch (_that) {
case _InitialState():
return initial(_that);case _LoadingState():
return loading(_that);case _DeleteMessagingState():
return deleteMessaging(_that);case _LogoutState():
return logout(_that);case _LoadedState():
return loaded(_that);case _ErrorState():
return erro(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _InitialState value)?  initial,TResult? Function( _LoadingState value)?  loading,TResult? Function( _DeleteMessagingState value)?  deleteMessaging,TResult? Function( _LogoutState value)?  logout,TResult? Function( _LoadedState value)?  loaded,TResult? Function( _ErrorState value)?  erro,}){
final _that = this;
switch (_that) {
case _InitialState() when initial != null:
return initial(_that);case _LoadingState() when loading != null:
return loading(_that);case _DeleteMessagingState() when deleteMessaging != null:
return deleteMessaging(_that);case _LogoutState() when logout != null:
return logout(_that);case _LoadedState() when loaded != null:
return loaded(_that);case _ErrorState() when erro != null:
return erro(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  deleteMessaging,TResult Function()?  logout,TResult Function( List<UserConversation> conversations)?  loaded,TResult Function( String message)?  erro,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InitialState() when initial != null:
return initial();case _LoadingState() when loading != null:
return loading();case _DeleteMessagingState() when deleteMessaging != null:
return deleteMessaging();case _LogoutState() when logout != null:
return logout();case _LoadedState() when loaded != null:
return loaded(_that.conversations);case _ErrorState() when erro != null:
return erro(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  deleteMessaging,required TResult Function()  logout,required TResult Function( List<UserConversation> conversations)  loaded,required TResult Function( String message)  erro,}) {final _that = this;
switch (_that) {
case _InitialState():
return initial();case _LoadingState():
return loading();case _DeleteMessagingState():
return deleteMessaging();case _LogoutState():
return logout();case _LoadedState():
return loaded(_that.conversations);case _ErrorState():
return erro(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  deleteMessaging,TResult? Function()?  logout,TResult? Function( List<UserConversation> conversations)?  loaded,TResult? Function( String message)?  erro,}) {final _that = this;
switch (_that) {
case _InitialState() when initial != null:
return initial();case _LoadingState() when loading != null:
return loading();case _DeleteMessagingState() when deleteMessaging != null:
return deleteMessaging();case _LogoutState() when logout != null:
return logout();case _LoadedState() when loaded != null:
return loaded(_that.conversations);case _ErrorState() when erro != null:
return erro(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _InitialState implements InboxState {
   _InitialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InboxState.initial()';
}


}




/// @nodoc


class _LoadingState implements InboxState {
   _LoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InboxState.loading()';
}


}




/// @nodoc


class _DeleteMessagingState implements InboxState {
   _DeleteMessagingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteMessagingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InboxState.deleteMessaging()';
}


}




/// @nodoc


class _LogoutState implements InboxState {
   _LogoutState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogoutState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InboxState.logout()';
}


}




/// @nodoc


class _LoadedState implements InboxState {
   _LoadedState({required final  List<UserConversation> conversations}): _conversations = conversations;
  

 final  List<UserConversation> _conversations;
 List<UserConversation> get conversations {
  if (_conversations is EqualUnmodifiableListView) return _conversations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_conversations);
}


/// Create a copy of InboxState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedStateCopyWith<_LoadedState> get copyWith => __$LoadedStateCopyWithImpl<_LoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadedState&&const DeepCollectionEquality().equals(other._conversations, _conversations));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_conversations));

@override
String toString() {
  return 'InboxState.loaded(conversations: $conversations)';
}


}

/// @nodoc
abstract mixin class _$LoadedStateCopyWith<$Res> implements $InboxStateCopyWith<$Res> {
  factory _$LoadedStateCopyWith(_LoadedState value, $Res Function(_LoadedState) _then) = __$LoadedStateCopyWithImpl;
@useResult
$Res call({
 List<UserConversation> conversations
});




}
/// @nodoc
class __$LoadedStateCopyWithImpl<$Res>
    implements _$LoadedStateCopyWith<$Res> {
  __$LoadedStateCopyWithImpl(this._self, this._then);

  final _LoadedState _self;
  final $Res Function(_LoadedState) _then;

/// Create a copy of InboxState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversations = null,}) {
  return _then(_LoadedState(
conversations: null == conversations ? _self._conversations : conversations // ignore: cast_nullable_to_non_nullable
as List<UserConversation>,
  ));
}


}

/// @nodoc


class _ErrorState implements InboxState {
   _ErrorState({required this.message});
  

 final  String message;

/// Create a copy of InboxState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorStateCopyWith<_ErrorState> get copyWith => __$ErrorStateCopyWithImpl<_ErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'InboxState.erro(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorStateCopyWith<$Res> implements $InboxStateCopyWith<$Res> {
  factory _$ErrorStateCopyWith(_ErrorState value, $Res Function(_ErrorState) _then) = __$ErrorStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorStateCopyWithImpl<$Res>
    implements _$ErrorStateCopyWith<$Res> {
  __$ErrorStateCopyWithImpl(this._self, this._then);

  final _ErrorState _self;
  final $Res Function(_ErrorState) _then;

/// Create a copy of InboxState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ErrorState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
