part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginInitialEvent extends LoginEvent {}

class LoginOptionPageLoginButtonClickedEvent extends LoginEvent {}

class LoginOptionPageRegisterButtonClickedEvent extends LoginEvent {
  
}

class LoginLoginPageLoginButtonClickedEvent extends LoginEvent {
  final String emailAddress;
  final String password;

  LoginLoginPageLoginButtonClickedEvent({required this.emailAddress, required this.password});
}
class LoginRegisterPageRegisterButtonClickedEvent extends LoginEvent {
  final String emailAddress;
  final String password;

  LoginRegisterPageRegisterButtonClickedEvent({required this.emailAddress, required this.password});
}
