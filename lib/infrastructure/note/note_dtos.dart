import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:note_app/domain/core/value_objects.dart';
import 'package:note_app/domain/notes/note.dart';
import 'package:note_app/domain/notes/todo_item.dart';
import 'package:note_app/domain/notes/value_objects.dart';

part 'note_dtos.freezed.dart';
part 'note_dtos.g.dart';

@freezed
abstract class NoteDto implements _$NoteDto {
  const NoteDto._();
  const factory NoteDto({
    @JsonKey(
      includeFromJson: false,
      includeToJson: false,
    )
    @Default('')
    String id,
    required String body,
    required int color,
    required List<TodoItemDto> todos,
    @ServerTimestampConvertor() required FieldValue serverTimeStamp,
  }) = _NoteDto;

  factory NoteDto.fromDomain(Note note) {
    return NoteDto(
      id: note.id.getOrCrash(),
      body: note.body.getOrCrash(),
      color: note.color.getOrCrash().value,
      todos: note.todos
          .getOrCrash()
          .map((todoItem) => TodoItemDto.fromDomain(todoItem))
          .asList(),
      serverTimeStamp: FieldValue.serverTimestamp(),
    );
  }

  Note toDomain() {
    return Note(
      id: UniqueId.fromUniqueString(id),
      body: NoteBody(body),
      color: NoteColor(Color(color)),
      todos: List3(
        todos.map((dto) => dto.toDomain()).toImmutableList(),
      ),
    );
  }

  factory NoteDto.fromJson(Map<String, dynamic> json) =>
      _$NoteDtoFromJson(json);

  factory NoteDto.fromFireStore(DocumentSnapshot doc) =>
      NoteDto.fromJson(doc.data() as Map<String, dynamic>).copyWith(id: doc.id);
}

@JsonSerializable()
class ServerTimestampConvertor implements JsonConverter<FieldValue, Object> {
  const ServerTimestampConvertor();
  @override
  FieldValue fromJson(Object json) {
    return FieldValue.serverTimestamp();
  }

  @override
  Object toJson(FieldValue object) {
    return object;
  }
}

@freezed
abstract class TodoItemDto implements _$TodoItemDto {
  const TodoItemDto._();
  const factory TodoItemDto({
    required String id,
    required String name,
    required bool done,
  }) = _TodoItemDto;

  factory TodoItemDto.fromDomain(TodoItem todoItem) {
    return TodoItemDto(
      id: todoItem.id.getOrCrash(),
      name: todoItem.name.getOrCrash(),
      done: todoItem.done,
    );
  }

  TodoItem toDomain() {
    return TodoItem(
      id: UniqueId.fromUniqueString(id),
      name: TodoName(name),
      done: done,
    );
  }

  factory TodoItemDto.fromJson(Map<String, dynamic> json) =>
      _$TodoItemDtoFromJson(json);
}
