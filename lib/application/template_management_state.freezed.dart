// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template_management_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TemplateManagementState _$TemplateManagementStateFromJson(
    Map<String, dynamic> json) {
  return _TemplateManagementState.fromJson(json);
}

/// @nodoc
mixin _$TemplateManagementState {
  List<Template> get templates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TemplateManagementStateCopyWith<TemplateManagementState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateManagementStateCopyWith<$Res> {
  factory $TemplateManagementStateCopyWith(TemplateManagementState value,
          $Res Function(TemplateManagementState) then) =
      _$TemplateManagementStateCopyWithImpl<$Res, TemplateManagementState>;
  @useResult
  $Res call({List<Template> templates});
}

/// @nodoc
class _$TemplateManagementStateCopyWithImpl<$Res,
        $Val extends TemplateManagementState>
    implements $TemplateManagementStateCopyWith<$Res> {
  _$TemplateManagementStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? templates = null,
  }) {
    return _then(_value.copyWith(
      templates: null == templates
          ? _value.templates
          : templates // ignore: cast_nullable_to_non_nullable
              as List<Template>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TemplateManagementStateImplCopyWith<$Res>
    implements $TemplateManagementStateCopyWith<$Res> {
  factory _$$TemplateManagementStateImplCopyWith(
          _$TemplateManagementStateImpl value,
          $Res Function(_$TemplateManagementStateImpl) then) =
      __$$TemplateManagementStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Template> templates});
}

/// @nodoc
class __$$TemplateManagementStateImplCopyWithImpl<$Res>
    extends _$TemplateManagementStateCopyWithImpl<$Res,
        _$TemplateManagementStateImpl>
    implements _$$TemplateManagementStateImplCopyWith<$Res> {
  __$$TemplateManagementStateImplCopyWithImpl(
      _$TemplateManagementStateImpl _value,
      $Res Function(_$TemplateManagementStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? templates = null,
  }) {
    return _then(_$TemplateManagementStateImpl(
      templates: null == templates
          ? _value._templates
          : templates // ignore: cast_nullable_to_non_nullable
              as List<Template>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TemplateManagementStateImpl implements _TemplateManagementState {
  const _$TemplateManagementStateImpl({required final List<Template> templates})
      : _templates = templates;

  factory _$TemplateManagementStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$TemplateManagementStateImplFromJson(json);

  final List<Template> _templates;
  @override
  List<Template> get templates {
    if (_templates is EqualUnmodifiableListView) return _templates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_templates);
  }

  @override
  String toString() {
    return 'TemplateManagementState(templates: $templates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemplateManagementStateImpl &&
            const DeepCollectionEquality()
                .equals(other._templates, _templates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_templates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TemplateManagementStateImplCopyWith<_$TemplateManagementStateImpl>
      get copyWith => __$$TemplateManagementStateImplCopyWithImpl<
          _$TemplateManagementStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TemplateManagementStateImplToJson(
      this,
    );
  }
}

abstract class _TemplateManagementState implements TemplateManagementState {
  const factory _TemplateManagementState(
          {required final List<Template> templates}) =
      _$TemplateManagementStateImpl;

  factory _TemplateManagementState.fromJson(Map<String, dynamic> json) =
      _$TemplateManagementStateImpl.fromJson;

  @override
  List<Template> get templates;
  @override
  @JsonKey(ignore: true)
  _$$TemplateManagementStateImplCopyWith<_$TemplateManagementStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
