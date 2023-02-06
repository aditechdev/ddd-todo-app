// Either is a union type: Its a union of two value either or || Left or Right
// import 'package:dartz/dartz.dart';
// import 'package:ddd_todo_app/domain/core/value_object.dart';
// import 'package:ddd_todo_app/domain/core/value_validators.dart';



import 'package:dartz/dartz.dart';
import 'package:ddd_todo_app/domain/core/failures.dart';
import 'package:ddd_todo_app/domain/core/value_object.dart';
import 'package:ddd_todo_app/domain/core/value_validators.dart';

class EmailAddress extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    assert(input != null);
    return EmailAddress._(validateEmailAddress(input));
  }

  const EmailAddress._(this.value);
}

class Passwords extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory Passwords(String input) {
    assert(input != null);
    return Passwords._(validatePassword(input));
  }

  const Passwords._(this.value);
}

