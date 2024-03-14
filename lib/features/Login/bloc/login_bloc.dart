import 'dart:async';

import 'package:apni_dukan/firebase/authication.dart';
import 'package:apni_dukan/firebase/cloud_firestore.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginInitialEvent>(loginInitialEvent);
    on<LoginOptionPageLoginButtonClickedEvent>(
        loginOptionPageLoginButtonClickedEvent);
    on<LoginOptionPageRegisterButtonClickedEvent>(
        loginOptionPageRegisterButtonClickedEvent);
    on<LoginRegisterPageRegisterButtonClickedEvent>(
        loginRegisterPageRegisterButtonClickedEvent);
    on<LoginLoginPageLoginButtonClickedEvent>(
        loginLoginPageLoginButtonClickedEvent);
  }

  FutureOr<void> loginInitialEvent(
      LoginInitialEvent event, Emitter<LoginState> emit) {
    emit(LoginSuccessLoadedState());
  }

  FutureOr<void> loginOptionPageLoginButtonClickedEvent(
      LoginOptionPageLoginButtonClickedEvent event, Emitter<LoginState> emit) {
    emit(LoginOptionPageToLoginPageNavigateState());
  }

  FutureOr<void> loginOptionPageRegisterButtonClickedEvent(
      LoginOptionPageRegisterButtonClickedEvent event,
      Emitter<LoginState> emit) {
    emit(LoginOptionPageToRegisterPageNavigateState());
  }

  FutureOr<void> loginRegisterPageRegisterButtonClickedEvent(
      LoginRegisterPageRegisterButtonClickedEvent event,
      Emitter<LoginState> emit) async {
    String message = await firebaseSignUp(event.emailAddress, event.password);

    emit(LoginSignUpState(message: message));
    if (message == "Sign-up Successful") {
      fireStoreCreateUser();
      emit(LoginRegisterPageToHomePageNavigateState());
    }
  }

  FutureOr<void> loginLoginPageLoginButtonClickedEvent(
      LoginLoginPageLoginButtonClickedEvent event,
      Emitter<LoginState> emit) async {
    String message = await firebaseSignIn(event.emailAddress, event.password);

    emit(LoginSignInState(message: message));
    if (message == "Sign-in Successful") {
      fireStoreReadUser();
      emit(LoginLoginPageToHomePageNavigateState());
    }
  }
}
