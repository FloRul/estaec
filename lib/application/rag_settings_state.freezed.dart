// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rag_settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RagSettingsState _$RagSettingsStateFromJson(Map<String, dynamic> json) {
  return _RagSettingsState.fromJson(json);
}

/// @nodoc
mixin _$RagSettingsState {
  String? get collectionName => throw _privateConstructorUsedError;
  List<String> get availableCollections => throw _privateConstructorUsedError;
  String? get sessionId => throw _privateConstructorUsedError;
  SourceType? get sourceType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RagSettingsStateCopyWith<RagSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RagSettingsStateCopyWith<$Res> {
  factory $RagSettingsStateCopyWith(
          RagSettingsState value, $Res Function(RagSettingsState) then) =
      _$RagSettingsStateCopyWithImpl<$Res, RagSettingsState>;
  @useResult
  $Res call(
      {String? collectionName,
      List<String> availableCollections,
      String? sessionId,
      SourceType? sourceType});
}

/// @nodoc
class _$RagSettingsStateCopyWithImpl<$Res, $Val extends RagSettingsState>
    implements $RagSettingsStateCopyWith<$Res> {
  _$RagSettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionName = freezed,
    Object? availableCollections = null,
    Object? sessionId = freezed,
    Object? sourceType = freezed,
  }) {
    return _then(_value.copyWith(
      collectionName: freezed == collectionName
          ? _value.collectionName
          : collectionName // ignore: cast_nullable_to_non_nullable
              as String?,
      availableCollections: null == availableCollections
          ? _value.availableCollections
          : availableCollections // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceType: freezed == sourceType
          ? _value.sourceType
          : sourceType // ignore: cast_nullable_to_non_nullable
              as SourceType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RagSettingsStateImplCopyWith<$Res>
    implements $RagSettingsStateCopyWith<$Res> {
  factory _$$RagSettingsStateImplCopyWith(_$RagSettingsStateImpl value,
          $Res Function(_$RagSettingsStateImpl) then) =
      __$$RagSettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? collectionName,
      List<String> availableCollections,
      String? sessionId,
      SourceType? sourceType});
}

/// @nodoc
class __$$RagSettingsStateImplCopyWithImpl<$Res>
    extends _$RagSettingsStateCopyWithImpl<$Res, _$RagSettingsStateImpl>
    implements _$$RagSettingsStateImplCopyWith<$Res> {
  __$$RagSettingsStateImplCopyWithImpl(_$RagSettingsStateImpl _value,
      $Res Function(_$RagSettingsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionName = freezed,
    Object? availableCollections = null,
    Object? sessionId = freezed,
    Object? sourceType = freezed,
  }) {
    return _then(_$RagSettingsStateImpl(
      collectionName: freezed == collectionName
          ? _value.collectionName
          : collectionName // ignore: cast_nullable_to_non_nullable
              as String?,
      availableCollections: null == availableCollections
          ? _value._availableCollections
          : availableCollections // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceType: freezed == sourceType
          ? _value.sourceType
          : sourceType // ignore: cast_nullable_to_non_nullable
              as SourceType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RagSettingsStateImpl implements _RagSettingsState {
  const _$RagSettingsStateImpl(
      {this.collectionName,
      required final List<String> availableCollections,
      this.sessionId,
      this.sourceType})
      : _availableCollections = availableCollections;

  factory _$RagSettingsStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$RagSettingsStateImplFromJson(json);

  @override
  final String? collectionName;
  final List<String> _availableCollections;
  @override
  List<String> get availableCollections {
    if (_availableCollections is EqualUnmodifiableListView)
      return _availableCollections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableCollections);
  }

  @override
  final String? sessionId;
  @override
  final SourceType? sourceType;

  @override
  String toString() {
    return 'RagSettingsState(collectionName: $collectionName, availableCollections: $availableCollections, sessionId: $sessionId, sourceType: $sourceType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RagSettingsStateImpl &&
            (identical(other.collectionName, collectionName) ||
                other.collectionName == collectionName) &&
            const DeepCollectionEquality()
                .equals(other._availableCollections, _availableCollections) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.sourceType, sourceType) ||
                other.sourceType == sourceType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      collectionName,
      const DeepCollectionEquality().hash(_availableCollections),
      sessionId,
      sourceType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RagSettingsStateImplCopyWith<_$RagSettingsStateImpl> get copyWith =>
      __$$RagSettingsStateImplCopyWithImpl<_$RagSettingsStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RagSettingsStateImplToJson(
      this,
    );
  }
}

abstract class _RagSettingsState implements RagSettingsState {
  const factory _RagSettingsState(
      {final String? collectionName,
      required final List<String> availableCollections,
      final String? sessionId,
      final SourceType? sourceType}) = _$RagSettingsStateImpl;

  factory _RagSettingsState.fromJson(Map<String, dynamic> json) =
      _$RagSettingsStateImpl.fromJson;

  @override
  String? get collectionName;
  @override
  List<String> get availableCollections;
  @override
  String? get sessionId;
  @override
  SourceType? get sourceType;
  @override
  @JsonKey(ignore: true)
  _$$RagSettingsStateImplCopyWith<_$RagSettingsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
