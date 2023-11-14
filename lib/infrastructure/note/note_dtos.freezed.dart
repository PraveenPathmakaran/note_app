// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NoteDto _$NoteDtoFromJson(Map<String, dynamic> json) {
  return _NoteDto.fromJson(json);
}

/// @nodoc
mixin _$NoteDto {
  @JsonKey(includeFromJson: false, includeToJson: false)
  String get id => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  int get color => throw _privateConstructorUsedError;
  List<TodoItemDto> get todos => throw _privateConstructorUsedError;
  @ServerTimestampConvertor()
  FieldValue get serverTimeStamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoteDtoCopyWith<NoteDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteDtoCopyWith<$Res> {
  factory $NoteDtoCopyWith(NoteDto value, $Res Function(NoteDto) then) =
      _$NoteDtoCopyWithImpl<$Res, NoteDto>;
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false, includeToJson: false) String id,
      String body,
      int color,
      List<TodoItemDto> todos,
      @ServerTimestampConvertor() FieldValue serverTimeStamp});
}

/// @nodoc
class _$NoteDtoCopyWithImpl<$Res, $Val extends NoteDto>
    implements $NoteDtoCopyWith<$Res> {
  _$NoteDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? body = null,
    Object? color = null,
    Object? todos = null,
    Object? serverTimeStamp = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      todos: null == todos
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<TodoItemDto>,
      serverTimeStamp: null == serverTimeStamp
          ? _value.serverTimeStamp
          : serverTimeStamp // ignore: cast_nullable_to_non_nullable
              as FieldValue,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoteDtoImplCopyWith<$Res> implements $NoteDtoCopyWith<$Res> {
  factory _$$NoteDtoImplCopyWith(
          _$NoteDtoImpl value, $Res Function(_$NoteDtoImpl) then) =
      __$$NoteDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false, includeToJson: false) String id,
      String body,
      int color,
      List<TodoItemDto> todos,
      @ServerTimestampConvertor() FieldValue serverTimeStamp});
}

/// @nodoc
class __$$NoteDtoImplCopyWithImpl<$Res>
    extends _$NoteDtoCopyWithImpl<$Res, _$NoteDtoImpl>
    implements _$$NoteDtoImplCopyWith<$Res> {
  __$$NoteDtoImplCopyWithImpl(
      _$NoteDtoImpl _value, $Res Function(_$NoteDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? body = null,
    Object? color = null,
    Object? todos = null,
    Object? serverTimeStamp = null,
  }) {
    return _then(_$NoteDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      todos: null == todos
          ? _value._todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<TodoItemDto>,
      serverTimeStamp: null == serverTimeStamp
          ? _value.serverTimeStamp
          : serverTimeStamp // ignore: cast_nullable_to_non_nullable
              as FieldValue,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NoteDtoImpl extends _NoteDto {
  const _$NoteDtoImpl(
      {@JsonKey(includeFromJson: false, includeToJson: false) this.id = '',
      required this.body,
      required this.color,
      required final List<TodoItemDto> todos,
      @ServerTimestampConvertor() required this.serverTimeStamp})
      : _todos = todos,
        super._();

  factory _$NoteDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoteDtoImplFromJson(json);

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String id;
  @override
  final String body;
  @override
  final int color;
  final List<TodoItemDto> _todos;
  @override
  List<TodoItemDto> get todos {
    if (_todos is EqualUnmodifiableListView) return _todos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todos);
  }

  @override
  @ServerTimestampConvertor()
  final FieldValue serverTimeStamp;

  @override
  String toString() {
    return 'NoteDto(id: $id, body: $body, color: $color, todos: $todos, serverTimeStamp: $serverTimeStamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.color, color) || other.color == color) &&
            const DeepCollectionEquality().equals(other._todos, _todos) &&
            (identical(other.serverTimeStamp, serverTimeStamp) ||
                other.serverTimeStamp == serverTimeStamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, body, color,
      const DeepCollectionEquality().hash(_todos), serverTimeStamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteDtoImplCopyWith<_$NoteDtoImpl> get copyWith =>
      __$$NoteDtoImplCopyWithImpl<_$NoteDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoteDtoImplToJson(
      this,
    );
  }
}

abstract class _NoteDto extends NoteDto {
  const factory _NoteDto(
      {@JsonKey(includeFromJson: false, includeToJson: false) final String id,
      required final String body,
      required final int color,
      required final List<TodoItemDto> todos,
      @ServerTimestampConvertor()
      required final FieldValue serverTimeStamp}) = _$NoteDtoImpl;
  const _NoteDto._() : super._();

  factory _NoteDto.fromJson(Map<String, dynamic> json) = _$NoteDtoImpl.fromJson;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String get id;
  @override
  String get body;
  @override
  int get color;
  @override
  List<TodoItemDto> get todos;
  @override
  @ServerTimestampConvertor()
  FieldValue get serverTimeStamp;
  @override
  @JsonKey(ignore: true)
  _$$NoteDtoImplCopyWith<_$NoteDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TodoItemDto _$TodoItemDtoFromJson(Map<String, dynamic> json) {
  return _TodoItemDto.fromJson(json);
}

/// @nodoc
mixin _$TodoItemDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get done => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoItemDtoCopyWith<TodoItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoItemDtoCopyWith<$Res> {
  factory $TodoItemDtoCopyWith(
          TodoItemDto value, $Res Function(TodoItemDto) then) =
      _$TodoItemDtoCopyWithImpl<$Res, TodoItemDto>;
  @useResult
  $Res call({String id, String name, bool done});
}

/// @nodoc
class _$TodoItemDtoCopyWithImpl<$Res, $Val extends TodoItemDto>
    implements $TodoItemDtoCopyWith<$Res> {
  _$TodoItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? done = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoItemDtoImplCopyWith<$Res>
    implements $TodoItemDtoCopyWith<$Res> {
  factory _$$TodoItemDtoImplCopyWith(
          _$TodoItemDtoImpl value, $Res Function(_$TodoItemDtoImpl) then) =
      __$$TodoItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, bool done});
}

/// @nodoc
class __$$TodoItemDtoImplCopyWithImpl<$Res>
    extends _$TodoItemDtoCopyWithImpl<$Res, _$TodoItemDtoImpl>
    implements _$$TodoItemDtoImplCopyWith<$Res> {
  __$$TodoItemDtoImplCopyWithImpl(
      _$TodoItemDtoImpl _value, $Res Function(_$TodoItemDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? done = null,
  }) {
    return _then(_$TodoItemDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodoItemDtoImpl extends _TodoItemDto {
  const _$TodoItemDtoImpl(
      {required this.id, required this.name, required this.done})
      : super._();

  factory _$TodoItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoItemDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final bool done;

  @override
  String toString() {
    return 'TodoItemDto(id: $id, name: $name, done: $done)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoItemDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.done, done) || other.done == done));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, done);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoItemDtoImplCopyWith<_$TodoItemDtoImpl> get copyWith =>
      __$$TodoItemDtoImplCopyWithImpl<_$TodoItemDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoItemDtoImplToJson(
      this,
    );
  }
}

abstract class _TodoItemDto extends TodoItemDto {
  const factory _TodoItemDto(
      {required final String id,
      required final String name,
      required final bool done}) = _$TodoItemDtoImpl;
  const _TodoItemDto._() : super._();

  factory _TodoItemDto.fromJson(Map<String, dynamic> json) =
      _$TodoItemDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  bool get done;
  @override
  @JsonKey(ignore: true)
  _$$TodoItemDtoImplCopyWith<_$TodoItemDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
