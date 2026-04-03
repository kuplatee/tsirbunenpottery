// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'piece.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Piece _$PieceFromJson(Map<String, dynamic> json) {
  return _Piece.fromJson(json);
}

/// @nodoc
mixin _$Piece {
  String get id => throw _privateConstructorUsedError;
  String get designId => throw _privateConstructorUsedError;
  List<String> get imageFileNames => throw _privateConstructorUsedError;
  bool get sold => throw _privateConstructorUsedError;
  String? get collectionId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PieceCopyWith<Piece> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PieceCopyWith<$Res> {
  factory $PieceCopyWith(Piece value, $Res Function(Piece) then) =
      _$PieceCopyWithImpl<$Res, Piece>;
  @useResult
  $Res call(
      {String id,
      String designId,
      List<String> imageFileNames,
      bool sold,
      String? collectionId});
}

/// @nodoc
class _$PieceCopyWithImpl<$Res, $Val extends Piece>
    implements $PieceCopyWith<$Res> {
  _$PieceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? designId = null,
    Object? imageFileNames = null,
    Object? sold = null,
    Object? collectionId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      designId: null == designId
          ? _value.designId
          : designId // ignore: cast_nullable_to_non_nullable
              as String,
      imageFileNames: null == imageFileNames
          ? _value.imageFileNames
          : imageFileNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sold: null == sold
          ? _value.sold
          : sold // ignore: cast_nullable_to_non_nullable
              as bool,
      collectionId: freezed == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PieceImplCopyWith<$Res> implements $PieceCopyWith<$Res> {
  factory _$$PieceImplCopyWith(
          _$PieceImpl value, $Res Function(_$PieceImpl) then) =
      __$$PieceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String designId,
      List<String> imageFileNames,
      bool sold,
      String? collectionId});
}

/// @nodoc
class __$$PieceImplCopyWithImpl<$Res>
    extends _$PieceCopyWithImpl<$Res, _$PieceImpl>
    implements _$$PieceImplCopyWith<$Res> {
  __$$PieceImplCopyWithImpl(
      _$PieceImpl _value, $Res Function(_$PieceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? designId = null,
    Object? imageFileNames = null,
    Object? sold = null,
    Object? collectionId = freezed,
  }) {
    return _then(_$PieceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      designId: null == designId
          ? _value.designId
          : designId // ignore: cast_nullable_to_non_nullable
              as String,
      imageFileNames: null == imageFileNames
          ? _value._imageFileNames
          : imageFileNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sold: null == sold
          ? _value.sold
          : sold // ignore: cast_nullable_to_non_nullable
              as bool,
      collectionId: freezed == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PieceImpl implements _Piece {
  const _$PieceImpl(
      {required this.id,
      required this.designId,
      required final List<String> imageFileNames,
      required this.sold,
      this.collectionId})
      : _imageFileNames = imageFileNames;

  factory _$PieceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PieceImplFromJson(json);

  @override
  final String id;
  @override
  final String designId;
  final List<String> _imageFileNames;
  @override
  List<String> get imageFileNames {
    if (_imageFileNames is EqualUnmodifiableListView) return _imageFileNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageFileNames);
  }

  @override
  final bool sold;
  @override
  final String? collectionId;

  @override
  String toString() {
    return 'Piece(id: $id, designId: $designId, imageFileNames: $imageFileNames, sold: $sold, collectionId: $collectionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PieceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.designId, designId) ||
                other.designId == designId) &&
            const DeepCollectionEquality()
                .equals(other._imageFileNames, _imageFileNames) &&
            (identical(other.sold, sold) || other.sold == sold) &&
            (identical(other.collectionId, collectionId) ||
                other.collectionId == collectionId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, designId,
      const DeepCollectionEquality().hash(_imageFileNames), sold, collectionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PieceImplCopyWith<_$PieceImpl> get copyWith =>
      __$$PieceImplCopyWithImpl<_$PieceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PieceImplToJson(
      this,
    );
  }
}

abstract class _Piece implements Piece {
  const factory _Piece(
      {required final String id,
      required final String designId,
      required final List<String> imageFileNames,
      required final bool sold,
      final String? collectionId}) = _$PieceImpl;

  factory _Piece.fromJson(Map<String, dynamic> json) = _$PieceImpl.fromJson;

  @override
  String get id;
  @override
  String get designId;
  @override
  List<String> get imageFileNames;
  @override
  bool get sold;
  @override
  String? get collectionId;
  @override
  @JsonKey(ignore: true)
  _$$PieceImplCopyWith<_$PieceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
