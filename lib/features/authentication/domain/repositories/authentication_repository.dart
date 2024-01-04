import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/failure.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, UserCredential>> performLogin(
      String email, String password);
}
