import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/datasources/authentication_datasource.dart';
import '../../domain/repositories/authentication_repository.dart';

@Injectable(as: AuthenticationRepository)
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDataSource dataSource;

  AuthenticationRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, UserCredential>> performLogin(
      String email, String password) async {
    try {
      final loginResult = await dataSource.performLogin(email, password);
      return Right(loginResult);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return const Left(FirebaseAuthFailure('Nie odnaleziono użytkownika.'));
      } else if (e.code == 'wrong-password') {
        return const Left(FirebaseAuthFailure('Hasło niepoprawne.'));
      }
      return const Left(FirebaseAuthFailure("Błąd uwierzytelniania."));
    }
  }
}
