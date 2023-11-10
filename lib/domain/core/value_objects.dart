import 'package:dartz/dartz.dart';
import 'package:note_app/domain/core/failures.dart';

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

  @override
  int get hashCode => value.hashCode;
  @override
  String toString() => 'Value($value)';
}
