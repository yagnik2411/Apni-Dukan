part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

final class ProfileSuccessLoadedEvent extends ProfileEvent {}

final class ProfileSignOutButtonClickedEvent extends ProfileEvent {}

final class ProfileAddAddressButtonClickedEvent extends ProfileEvent {}

final class ProfileAddressPageAddAddressButtonClickedEvent extends ProfileEvent {}
