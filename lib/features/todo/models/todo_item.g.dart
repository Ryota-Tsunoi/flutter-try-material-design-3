// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ToDoItem _$$_ToDoItemFromJson(Map<String, dynamic> json) => _$_ToDoItem(
      id: json['id'] as String,
      title: json['title'] as String,
      memo: json['memo'] as String? ?? "",
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_ToDoItemToJson(_$_ToDoItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'memo': instance.memo,
      'createdAt': instance.createdAt.toIso8601String(),
    };
