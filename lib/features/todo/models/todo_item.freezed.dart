// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ToDoItem _$ToDoItemFromJson(Map<String, dynamic> json) {
  return _ToDoItem.fromJson(json);
}

/// @nodoc
mixin _$ToDoItem {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToDoItemCopyWith<ToDoItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToDoItemCopyWith<$Res> {
  factory $ToDoItemCopyWith(ToDoItem value, $Res Function(ToDoItem) then) =
      _$ToDoItemCopyWithImpl<$Res, ToDoItem>;
  @useResult
  $Res call({String id, String title});
}

/// @nodoc
class _$ToDoItemCopyWithImpl<$Res, $Val extends ToDoItem>
    implements $ToDoItemCopyWith<$Res> {
  _$ToDoItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ToDoItemCopyWith<$Res> implements $ToDoItemCopyWith<$Res> {
  factory _$$_ToDoItemCopyWith(
          _$_ToDoItem value, $Res Function(_$_ToDoItem) then) =
      __$$_ToDoItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title});
}

/// @nodoc
class __$$_ToDoItemCopyWithImpl<$Res>
    extends _$ToDoItemCopyWithImpl<$Res, _$_ToDoItem>
    implements _$$_ToDoItemCopyWith<$Res> {
  __$$_ToDoItemCopyWithImpl(
      _$_ToDoItem _value, $Res Function(_$_ToDoItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$_ToDoItem(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ToDoItem implements _ToDoItem {
  const _$_ToDoItem({required this.id, required this.title});

  factory _$_ToDoItem.fromJson(Map<String, dynamic> json) =>
      _$$_ToDoItemFromJson(json);

  @override
  final String id;
  @override
  final String title;

  @override
  String toString() {
    return 'ToDoItem(id: $id, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ToDoItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ToDoItemCopyWith<_$_ToDoItem> get copyWith =>
      __$$_ToDoItemCopyWithImpl<_$_ToDoItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ToDoItemToJson(
      this,
    );
  }
}

abstract class _ToDoItem implements ToDoItem {
  const factory _ToDoItem(
      {required final String id, required final String title}) = _$_ToDoItem;

  factory _ToDoItem.fromJson(Map<String, dynamic> json) = _$_ToDoItem.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_ToDoItemCopyWith<_$_ToDoItem> get copyWith =>
      throw _privateConstructorUsedError;
}
