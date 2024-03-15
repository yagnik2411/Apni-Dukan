part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

sealed class ProfileActionState extends ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileProfilePageToLoginOptionPageNavigateState
    extends ProfileActionState {}

final class ProfileProfilePageToAddressPageNavigateState extends ProfileState {}

final class ProfileSignOutState extends ProfileActionState {
  final String message;

  ProfileSignOutState(this.message);
}

final class ProfileAddressPageToProfilePageNavigateState extends ProfileActionState {}