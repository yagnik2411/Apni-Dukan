import 'dart:async';

import 'package:apni_dukan/firebase/authication.dart';
import 'package:apni_dukan/firebase/cloud_firestore.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileSuccessLoadedEvent>(profileSuccessLoadedEvent);
    on<ProfileSignOutButtonClickedEvent>(profileSignOutButtonClickedEvent);
    on<ProfileAddAddressButtonClickedEvent>(
        profileAddAddressButtonClickedEvent);
    on<ProfileAddressPageAddAddressButtonClickedEvent>(
        profileAddressPageAddAddressButtonClickedEvent);
  }

  FutureOr<void> profileSuccessLoadedEvent(
      ProfileSuccessLoadedEvent event, Emitter<ProfileState> emit) {
    emit(ProfileInitial());
  }

  Future<FutureOr<void>> profileSignOutButtonClickedEvent(
      ProfileSignOutButtonClickedEvent event,
      Emitter<ProfileState> emit) async {
    String message = await firebaseSignOut();
    emit(ProfileSignOutState(message));
    emit(ProfileProfilePageToLoginOptionPageNavigateState());
  }

  FutureOr<void> profileAddAddressButtonClickedEvent(
      ProfileAddAddressButtonClickedEvent event, Emitter<ProfileState> emit) {
    emit(ProfileProfilePageToAddressPageNavigateState());
  }

  FutureOr<void> profileAddressPageAddAddressButtonClickedEvent(
      ProfileAddressPageAddAddressButtonClickedEvent event,
      Emitter<ProfileState> emit) {
    fireStoreCreateAddress();
    emit(ProfileAddressPageToProfilePageNavigateState());
  }
}
