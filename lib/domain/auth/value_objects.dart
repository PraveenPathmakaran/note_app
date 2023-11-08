import 'package:dartz/dartz.dart';
import 'package:note_app/domain/core/failures.dart';
import 'package:note_app/domain/core/value_objects.dart';
import 'package:note_app/domain/core/value_validators.dart';

class EmailAddress extends ValueObjects {
  @override
  final Either<ValueFailure<String>, String> value;

  EmailAddress._({required this.value});

  factory EmailAddress(String input) {
    return EmailAddress._(value: validateEmailAddress(input));
  }
}

class Password extends ValueObjects {
  @override
  final Either<ValueFailure<String>, String> value;

  Password._({required this.value});

  factory Password(String input) {
    return Password._(value: validatePassword(input));
  }
}
