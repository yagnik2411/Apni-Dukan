part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

sealed class LoginActionState extends LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSuccessLoadedState extends LoginState {}

final class LoginOptionPageToLoginPageNavigateState extends LoginState {}

final class LoginOptionPageToRegisterPageNavigateState extends LoginState {}

final class LoginSignUpState extends LoginActionState {
  final String message;

  LoginSignUpState({required this.message});
}

final class LoginRegisterPageToHomePageNavigateState extends LoginActionState {}
