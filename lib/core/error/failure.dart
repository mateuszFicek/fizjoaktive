import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorMessage;

  const Failure({this.errorMessage = ""});
  @override
  List<Object> get props => [errorMessage];
}

// General failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class FirebaseAuthFailure extends Failure {
  final String message;
  const FirebaseAuthFailure(this.message) : super(errorMessage: message);
}
