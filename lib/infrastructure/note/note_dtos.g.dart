// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerTimestampConvertor _$ServerTimestampConvertorFromJson(
        Map<String, dynamic> json) =>
    ServerTimestampConvertor();

Map<String, dynamic> _$ServerTimestampConvertorToJson(
        ServerTimestampConvertor instance) =>
    <String, dynamic>{};

_$NoteDtoImpl _$$NoteDtoImplFromJson(Map<String, dynamic> json) =>
    _$NoteDtoImpl(
      body: json['body'] as String,
      color: json['color'] as int,
      todos: (json['todos'] as List<dynamic>)
          .map((e) => TodoItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      serverTimeStamp: const ServerTimestampConvertor()
          .fromJson(json['serverTimeStamp'] as Object),
    );

Map<String, dynamic> _$$NoteDtoImplToJson(_$NoteDtoImpl instance) =>
    <String, dynamic>{
      'body': instance.body,
      'color': instance.color,
      'todos': instance.todos,
      'serverTimeStamp':
          const ServerTimestampConvertor().toJson(instance.serverTimeStamp),
    };

_$TodoItemDtoImpl _$$TodoItemDtoImplFromJson(Map<String, dynamic> json) =>
    _$TodoItemDtoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      done: json['done'] as bool,
    );

Map<String, dynamic> _$$TodoItemDtoImplToJson(_$TodoItemDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'done': instance.done,
    };
