// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContactState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContactState()';
}


}

/// @nodoc
class $ContactStateCopyWith<$Res>  {
$ContactStateCopyWith(ContactState _, $Res Function(ContactState) __);
}


/// Adds pattern-matching-related methods to [ContactState].
extension ContactStatePatterns on ContactState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _InitialState value)?  initial,TResult Function( _LoadingState value)?  loading,TResult Function( _LoadedState value)?  loaded,TResult Function( _ErrorState value)?  error,TResult Function( _DeletedContactState value)?  deletedContact,TResult Function( _OpenChatState value)?  openChat,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InitialState() when initial != null:
return initial(_that);case _LoadingState() when loading != null:
return loading(_that);case _LoadedState() when loaded != null:
return loaded(_that);case _ErrorState() when error != null:
return error(_that);case _DeletedContactState() when deletedContact != null:
return deletedContact(_that);case _OpenChatState() when openChat != null:
return openChat(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _InitialState value)  initial,required TResult Function( _LoadingState value)  loading,required TResult Function( _LoadedState value)  loaded,required TResult Function( _ErrorState value)  error,required TResult Function( _DeletedContactState value)  deletedContact,required TResult Function( _OpenChatState value)  openChat,}){
final _that = this;
switch (_that) {
case _InitialState():
return initial(_that);case _LoadingState():
return loading(_that);case _LoadedState():
return loaded(_that);case _ErrorState():
return error(_that);case _DeletedContactState():
return deletedContact(_that);case _OpenChatState():
return openChat(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _InitialState value)?  initial,TResult? Function( _LoadingState value)?  loading,TResult? Function( _LoadedState value)?  loaded,TResult? Function( _ErrorState value)?  error,TResult? Function( _DeletedContactState value)?  deletedContact,TResult? Function( _OpenChatState value)?  openChat,}){
final _that = this;
switch (_that) {
case _InitialState() when initial != null:
return initial(_that);case _LoadingState() when loading != null:
return loading(_that);case _LoadedState() when loaded != null:
return loaded(_that);case _ErrorState() when error != null:
return error(_that);case _DeletedContactState() when deletedContact != null:
return deletedContact(_that);case _OpenChatState() when openChat != null:
return openChat(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Contact> contacts)?  loaded,TResult Function( String message)?  error,TResult Function()?  deletedContact,TResult Function( String conversationId,  String otherUserId,  String otherUserName)?  openChat,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InitialState() when initial != null:
return initial();case _LoadingState() when loading != null:
return loading();case _LoadedState() when loaded != null:
return loaded(_that.contacts);case _ErrorState() when error != null:
return error(_that.message);case _DeletedContactState() when deletedContact != null:
return deletedContact();case _OpenChatState() when openChat != null:
return openChat(_that.conversationId,_that.otherUserId,_that.otherUserName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Contact> contacts)  loaded,required TResult Function( String message)  error,required TResult Function()  deletedContact,required TResult Function( String conversationId,  String otherUserId,  String otherUserName)  openChat,}) {final _that = this;
switch (_that) {
case _InitialState():
return initial();case _LoadingState():
return loading();case _LoadedState():
return loaded(_that.contacts);case _ErrorState():
return error(_that.message);case _DeletedContactState():
return deletedContact();case _OpenChatState():
return openChat(_that.conversationId,_that.otherUserId,_that.otherUserName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Contact> contacts)?  loaded,TResult? Function( String message)?  error,TResult? Function()?  deletedContact,TResult? Function( String conversationId,  String otherUserId,  String otherUserName)?  openChat,}) {final _that = this;
switch (_that) {
case _InitialState() when initial != null:
return initial();case _LoadingState() when loading != null:
return loading();case _LoadedState() when loaded != null:
return loaded(_that.contacts);case _ErrorState() when error != null:
return error(_that.message);case _DeletedContactState() when deletedContact != null:
return deletedContact();case _OpenChatState() when openChat != null:
return openChat(_that.conversationId,_that.otherUserId,_that.otherUserName);case _:
  return null;

}
}

}

/// @nodoc


class _InitialState implements ContactState {
   _InitialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContactState.initial()';
}


}




/// @nodoc


class _LoadingState implements ContactState {
   _LoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContactState.loading()';
}


}




/// @nodoc


class _LoadedState implements ContactState {
   _LoadedState({required final  List<Contact> contacts}): _contacts = contacts;
  

 final  List<Contact> _contacts;
 List<Contact> get contacts {
  if (_contacts is EqualUnmodifiableListView) return _contacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contacts);
}


/// Create a copy of ContactState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedStateCopyWith<_LoadedState> get copyWith => __$LoadedStateCopyWithImpl<_LoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadedState&&const DeepCollectionEquality().equals(other._contacts, _contacts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_contacts));

@override
String toString() {
  return 'ContactState.loaded(contacts: $contacts)';
}


}

/// @nodoc
abstract mixin class _$LoadedStateCopyWith<$Res> implements $ContactStateCopyWith<$Res> {
  factory _$LoadedStateCopyWith(_LoadedState value, $Res Function(_LoadedState) _then) = __$LoadedStateCopyWithImpl;
@useResult
$Res call({
 List<Contact> contacts
});




}
/// @nodoc
class __$LoadedStateCopyWithImpl<$Res>
    implements _$LoadedStateCopyWith<$Res> {
  __$LoadedStateCopyWithImpl(this._self, this._then);

  final _LoadedState _self;
  final $Res Function(_LoadedState) _then;

/// Create a copy of ContactState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? contacts = null,}) {
  return _then(_LoadedState(
contacts: null == contacts ? _self._contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<Contact>,
  ));
}


}

/// @nodoc


class _ErrorState implements ContactState {
   _ErrorState({required this.message});
  

 final  String message;

/// Create a copy of ContactState
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
  return 'ContactState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorStateCopyWith<$Res> implements $ContactStateCopyWith<$Res> {
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

/// Create a copy of ContactState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ErrorState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DeletedContactState implements ContactState {
   _DeletedContactState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeletedContactState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContactState.deletedContact()';
}


}




/// @nodoc


class _OpenChatState implements ContactState {
   _OpenChatState({required this.conversationId, required this.otherUserId, required this.otherUserName});
  

 final  String conversationId;
 final  String otherUserId;
 final  String otherUserName;

/// Create a copy of ContactState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpenChatStateCopyWith<_OpenChatState> get copyWith => __$OpenChatStateCopyWithImpl<_OpenChatState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenChatState&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.otherUserId, otherUserId) || other.otherUserId == otherUserId)&&(identical(other.otherUserName, otherUserName) || other.otherUserName == otherUserName));
}


@override
int get hashCode => Object.hash(runtimeType,conversationId,otherUserId,otherUserName);

@override
String toString() {
  return 'ContactState.openChat(conversationId: $conversationId, otherUserId: $otherUserId, otherUserName: $otherUserName)';
}


}

/// @nodoc
abstract mixin class _$OpenChatStateCopyWith<$Res> implements $ContactStateCopyWith<$Res> {
  factory _$OpenChatStateCopyWith(_OpenChatState value, $Res Function(_OpenChatState) _then) = __$OpenChatStateCopyWithImpl;
@useResult
$Res call({
 String conversationId, String otherUserId, String otherUserName
});




}
/// @nodoc
class __$OpenChatStateCopyWithImpl<$Res>
    implements _$OpenChatStateCopyWith<$Res> {
  __$OpenChatStateCopyWithImpl(this._self, this._then);

  final _OpenChatState _self;
  final $Res Function(_OpenChatState) _then;

/// Create a copy of ContactState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversationId = null,Object? otherUserId = null,Object? otherUserName = null,}) {
  return _then(_OpenChatState(
conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,otherUserId: null == otherUserId ? _self.otherUserId : otherUserId // ignore: cast_nullable_to_non_nullable
as String,otherUserName: null == otherUserName ? _self.otherUserName : otherUserName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
