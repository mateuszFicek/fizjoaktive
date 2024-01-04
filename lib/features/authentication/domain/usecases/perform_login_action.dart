import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/use_case.dart';
import '../repositories/authentication_repository.dart';

@injectable
class PerformLoginAction implements UseCase<UserCredential, LoginParams> {
  final AuthenticationRepository repository;

  PerformLoginAction(this.repository);

  @override
  Future<Either<Failure, UserCredential>> call(LoginParams params) async {
    return await repository.performLogin(params.email, params.password);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
