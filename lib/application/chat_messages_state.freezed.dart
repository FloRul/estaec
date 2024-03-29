// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_messages_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatMessagesState {
  List<types.Message> get messages => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatMessagesStateCopyWith<ChatMessagesState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessagesStateCopyWith<$Res> {
  factory $ChatMessagesStateCopyWith(ChatMessagesState value, $Res Function(ChatMessagesState) then) =
      _$ChatMessagesStateCopyWithImpl<$Res, ChatMessagesState>;
  @useResult
  $Res call({List<types.Message> messages, bool isLoading, bool hasError});
}

/// @nodoc
class _$ChatMessagesStateCopyWithImpl<$Res, $Val extends ChatMessagesState>
    implements $ChatMessagesStateCopyWith<$Res> {
  _$ChatMessagesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? isLoading = null,
    Object? hasError = null,
  }) {
    return _then(_value.copyWith(
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<types.Message>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatMessagesStateImplCopyWith<$Res> implements $ChatMessagesStateCopyWith<$Res> {
  factory _$$ChatMessagesStateImplCopyWith(_$ChatMessagesStateImpl value, $Res Function(_$ChatMessagesStateImpl) then) =
      __$$ChatMessagesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<types.Message> messages, bool isLoading, bool hasError});
}

/// @nodoc
class __$$ChatMessagesStateImplCopyWithImpl<$Res> extends _$ChatMessagesStateCopyWithImpl<$Res, _$ChatMessagesStateImpl>
    implements _$$ChatMessagesStateImplCopyWith<$Res> {
  __$$ChatMessagesStateImplCopyWithImpl(_$ChatMessagesStateImpl _value, $Res Function(_$ChatMessagesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? isLoading = null,
    Object? hasError = null,
  }) {
    return _then(_$ChatMessagesStateImpl(
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<types.Message>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChatMessagesStateImpl implements _ChatMessagesState {
  const _$ChatMessagesStateImpl(
      {required final List<types.Message> messages, required this.isLoading, required this.hasError})
      : _messages = messages;

  final List<types.Message> _messages;
  @override
  List<types.Message> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  final bool isLoading;
  @override
  final bool hasError;

  @override
  String toString() {
    return 'ChatMessagesState(messages: $messages, isLoading: $isLoading, hasError: $hasError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessagesStateImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.isLoading, isLoading) || other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) || other.hasError == hasError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(_messages), isLoading, hasError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessagesStateImplCopyWith<_$ChatMessagesStateImpl> get copyWith =>
      __$$ChatMessagesStateImplCopyWithImpl<_$ChatMessagesStateImpl>(this, _$identity);
}

abstract class _ChatMessagesState implements ChatMessagesState {
  const factory _ChatMessagesState(
      {required final List<types.Message> messages,
      required final bool isLoading,
      required final bool hasError}) = _$ChatMessagesStateImpl;

  @override
  List<types.Message> get messages;
  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  @JsonKey(ignore: true)
  _$$ChatMessagesStateImplCopyWith<_$ChatMessagesStateImpl> get copyWith => throw _privateConstructorUsedError;
}
