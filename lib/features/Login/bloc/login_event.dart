part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginInitialEvent extends LoginEvent {}

class LoginLoginButtonClickedEvent extends LoginEvent {}

class LoginRegisterButtonClickedEvent extends LoginEvent {}
