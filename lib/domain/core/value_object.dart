import 'package:dartz/dartz.dart';
import 'package:ddd_todo_app/domain/auth/value_objects.dart';
import 'package:ddd_todo_app/domain/core/failures.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;
  // final Either<Left, Right> failure;
  // final Either<Left, Right> failure;

  @override
  bool operator ==(covariant Object other) {
    if (identical(this, other)) return true;

    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}
