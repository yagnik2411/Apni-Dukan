import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginInitialEvent>(loginInitialEvent);
    on<LoginLoginButtonClickedEvent>(loginLoginButtonClickedEvent);
    on<LoginRegisterButtonClickedEvent>(loginRegisterButtonClickedEvent);
  }

  FutureOr<void> loginInitialEvent(
      LoginInitialEvent event, Emitter<LoginState> emit) {
    emit(LoginSuccessLoadedState());
  }

  FutureOr<void> loginLoginButtonClickedEvent(
      LoginLoginButtonClickedEvent event, Emitter<LoginState> emit) {
    emit(LoginOptionPageToLoginPageNavigateEvent());
  }

  FutureOr<void> loginRegisterButtonClickedEvent(LoginRegisterButtonClickedEvent event, Emitter<LoginState> emit) {
    emit(LoginOptionPageToRegisterPageNavigateEvent());
  }
}
