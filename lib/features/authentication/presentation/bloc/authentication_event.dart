part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

final class PerformLogin extends AuthenticationEvent {
  final String email;
  final String password;

  PerformLogin(this.email, this.password);
}
