import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_item.freezed.dart';
part 'todo_item.g.dart';

@freezed
class ToDoItem with _$ToDoItem {
  const factory ToDoItem({
    required String id,
    required String title,
    @Default("") String memo,
    required DateTime createdAt,
  }) = _ToDoItem;

  factory ToDoItem.fromJson(Map<String, dynamic> json) =>
      _$ToDoItemFromJson(json);
}
