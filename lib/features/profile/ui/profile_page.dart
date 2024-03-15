import 'package:apni_dukan/features/Login/ui/login_options.dart';
import 'package:apni_dukan/features/profile/bloc/profile_bloc.dart';
import 'package:apni_dukan/features/profile/ui/widget/add_address.dart';
import 'package:apni_dukan/features/profile/ui/widget/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfileBloc profileBloc = ProfileBloc();

  @override
  void initState() {
    super.initState();
    profileBloc.add(ProfileSuccessLoadedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      bloc: profileBloc,
      listenWhen: (previous, current) => current is ProfileActionState,
      buildWhen: (previous, current) => current is! ProfileActionState,
      listener: (context, state) {
        switch (state.runtimeType) {
          case ProfileProfilePageToLoginOptionPageNavigateState:
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoginRegisterOptionPage()));
            break;
          case ProfileSignOutState:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text((state as ProfileSignOutState).message),
              ),
            );
            break;
          case ProfileAddressPageToProfilePageNavigateState:
           Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>  ProfilePage()));
            break;
            
          default:
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case ProfileInitial:
            return Profile(profileBloc: profileBloc);
          case ProfileProfilePageToAddressPageNavigateState:
            return AddAddress(profileBloc: profileBloc);

          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
