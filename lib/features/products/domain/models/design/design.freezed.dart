// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'design.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Design _$DesignFromJson(Map<String, dynamic> json) {
  return _Design.fromJson(json);
}

/// @nodoc
mixin _$Design {
  String get id => throw _privateConstructorUsedError;
  Map<Language, String> get names => throw _privateConstructorUsedError;
  List<String> get categoryIds => throw _privateConstructorUsedError;
  Map<Language, String> get description => throw _privateConstructorUsedError;
  Map<Language, Map<String, String>> get details =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DesignCopyWith<Design> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DesignCopyWith<$Res> {
  factory $DesignCopyWith(Design value, $Res Function(Design) then) =
      _$DesignCopyWithImpl<$Res, Design>;
  @useResult
  $Res call(
      {String id,
      Map<Language, String> names,
      List<String> categoryIds,
      Map<Language, String> description,
      Map<Language, Map<String, String>> details});
}

/// @nodoc
class _$DesignCopyWithImpl<$Res, $Val extends Design>
    implements $DesignCopyWith<$Res> {
  _$DesignCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? names = null,
    Object? categoryIds = null,
    Object? description = null,
    Object? details = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      names: null == names
          ? _value.names
          : names // ignore: cast_nullable_to_non_nullable
              as Map<Language, String>,
      categoryIds: null == categoryIds
          ? _value.categoryIds
          : categoryIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as Map<Language, String>,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<Language, Map<String, String>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DesignImplCopyWith<$Res> implements $DesignCopyWith<$Res> {
  factory _$$DesignImplCopyWith(
          _$DesignImpl value, $Res Function(_$DesignImpl) then) =
      __$$DesignImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Map<Language, String> names,
      List<String> categoryIds,
      Map<Language, String> description,
      Map<Language, Map<String, String>> details});
}

/// @nodoc
class __$$DesignImplCopyWithImpl<$Res>
    extends _$DesignCopyWithImpl<$Res, _$DesignImpl>
    implements _$$DesignImplCopyWith<$Res> {
  __$$DesignImplCopyWithImpl(
      _$DesignImpl _value, $Res Function(_$DesignImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? names = null,
    Object? categoryIds = null,
    Object? description = null,
    Object? details = null,
  }) {
    return _then(_$DesignImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      names: null == names
          ? _value._names
          : names // ignore: cast_nullable_to_non_nullable
              as Map<Language, String>,
      categoryIds: null == categoryIds
          ? _value._categoryIds
          : categoryIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: null == description
          ? _value._description
          : description // ignore: cast_nullable_to_non_nullable
              as Map<Language, String>,
      details: null == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<Language, Map<String, String>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DesignImpl implements _Design {
  const _$DesignImpl(
      {required this.id,
      required final Map<Language, String> names,
      required final List<String> categoryIds,
      required final Map<Language, String> description,
      required final Map<Language, Map<String, String>> details})
      : _names = names,
        _categoryIds = categoryIds,
        _description = description,
        _details = details;

  factory _$DesignImpl.fromJson(Map<String, dynamic> json) =>
      _$$DesignImplFromJson(json);

  @override
  final String id;
  final Map<Language, String> _names;
  @override
  Map<Language, String> get names {
    if (_names is EqualUnmodifiableMapView) return _names;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_names);
  }

  final List<String> _categoryIds;
  @override
  List<String> get categoryIds {
    if (_categoryIds is EqualUnmodifiableListView) return _categoryIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryIds);
  }

  final Map<Language, String> _description;
  @override
  Map<Language, String> get description {
    if (_description is EqualUnmodifiableMapView) return _description;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_description);
  }

  final Map<Language, Map<String, String>> _details;
  @override
  Map<Language, Map<String, String>> get details {
    if (_details is EqualUnmodifiableMapView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_details);
  }

  @override
  String toString() {
    return 'Design(id: $id, names: $names, categoryIds: $categoryIds, description: $description, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DesignImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._names, _names) &&
            const DeepCollectionEquality()
                .equals(other._categoryIds, _categoryIds) &&
            const DeepCollectionEquality()
                .equals(other._description, _description) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_names),
      const DeepCollectionEquality().hash(_categoryIds),
      const DeepCollectionEquality().hash(_description),
      const DeepCollectionEquality().hash(_details));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DesignImplCopyWith<_$DesignImpl> get copyWith =>
      __$$DesignImplCopyWithImpl<_$DesignImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DesignImplToJson(
      this,
    );
  }
}

abstract class _Design implements Design {
  const factory _Design(
          {required final String id,
          required final Map<Language, String> names,
          required final List<String> categoryIds,
          required final Map<Language, String> description,
          required final Map<Language, Map<String, String>> details}) =
      _$DesignImpl;

  factory _Design.fromJson(Map<String, dynamic> json) = _$DesignImpl.fromJson;

  @override
  String get id;
  @override
  Map<Language, String> get names;
  @override
  List<String> get categoryIds;
  @override
  Map<Language, String> get description;
  @override
  Map<Language, Map<String, String>> get details;
  @override
  @JsonKey(ignore: true)
  _$$DesignImplCopyWith<_$DesignImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
