part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationFailure extends AuthenticationState {
  final String message;
  AuthenticationFailure(this.message);
}

final class AuthenticationSuccess extends AuthenticationState {}

final class AuthenticationProcessing extends AuthenticationState {}
