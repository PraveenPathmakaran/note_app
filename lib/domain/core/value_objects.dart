// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:note_app/domain/core/failures.dart';
import 'package:uuid/uuid.dart';

import 'errors.dart';

abstract class ValueObjects<T> {
  const ValueObjects();
  Either<ValueFailure<T>, T> get value;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ValueObjects<T> && other.value == value;
  }

  bool isValid() => value.isRight();
  T getOrCrash() => value.fold((f) => throw UnexpectedValueError(f), id);

  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(
      (f) => left(f),
      (r) => right(unit),
    );
  }

  @override
  int get hashCode => value.hashCode;
  @override
  String toString() => 'Value($value)';
}

class UniqueId extends ValueObjects<String> {
  @override
  Either<ValueFailure<String>, String> value;

  factory UniqueId() {
    return UniqueId._(
      right(const Uuid().v1()),
    );
  }

  factory UniqueId.fromUniqueString(String uniqueId) {
    return UniqueId._(right(uniqueId));
  }
  UniqueId._(
    this.value,
  );
}
