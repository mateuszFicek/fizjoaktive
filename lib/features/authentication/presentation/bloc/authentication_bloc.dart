import 'package:fizjoaktive/features/authentication/domain/usecases/perform_login_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

@singleton
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final PerformLoginAction performLoginAction;
  AuthenticationBloc(this.performLoginAction) : super(AuthenticationInitial()) {
    on<PerformLogin>(_onPerformLogin);
  }

  void _onPerformLogin(
      PerformLogin event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationProcessing());

    final loginActionResult = await performLoginAction(
        LoginParams(email: event.email, password: event.password));
    loginActionResult.fold(
      (l) => emit(AuthenticationFailure(l.errorMessage)),
      (r) => emit(AuthenticationSuccess()),
    );
  }
}
