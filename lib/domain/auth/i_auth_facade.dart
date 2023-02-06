// Facade is design patter used to connect two or more classes
import 'package:dartz/dartz.dart';
import 'package:ddd_todo_app/domain/auth/auth_failure.dart';
import 'package:ddd_todo_app/domain/auth/value_objects.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({required EmailAddress emailAddress,required Passwords passwords}) async {


  }
  Future<Either<AuthFailure, Unit>> signWithEmailAndPassword({required EmailAddress emailAddress,required Passwords passwords}) async {


  }
  Future<Either<AuthFailure, Unit>> signWithGoogle() async {


  }
}
