// Either is a union type: Its a union of two value either or || Left or Right
import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_streaming.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_address.freezed.dart';

class EmailAdress {
  final Either<ValueFailure<String>, String> value;
  // final Either<Left, Right> failure;
  // final Either<Left, Right> failure;

  // Making illigal state Unrepresentable
  // Most Staright forward way is to validate at inisialisation is factory constructor
  factory EmailAdress(String input) {
    assert(input != null);
    return EmailAdress._(validateEmailAddress(input));
  }

  // Use ._ symbol to make privete constructor
  const EmailAdress._(this.value);
  // Check null safety over here

  @override
  bool operator ==(covariant EmailAdress other) {
    if (identical(this, other)) return true;

    return other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'EmailAdress(value: $value)';
}

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({required String failedValue}) =
      InvalidEmail<T>;
  const factory ValueFailure.shortPassword({required String failedValue}) =
      ShortPassword<T>;
}

void showingTheEMailAddressFailure() {
  final emailAAdd = EmailAdress("abc");
  String emailTExt = emailAAdd.value
      .fold((l) => "Failure happen, more preciesly $l", (r) => r);

      
  String emailText2 = emailAAdd.value.getOrElse(() => "Something happen wrong");
}
