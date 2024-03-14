import 'package:apni_dukan/features/Login/bloc/login_bloc.dart';
import 'package:apni_dukan/features/Login/ui/widget/login_page.dart';
import 'package:apni_dukan/features/Login/ui/widget/options_page.dart';
import 'package:apni_dukan/features/Login/ui/widget/register_page.dart';
import 'package:apni_dukan/features/home/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginRegisterOptionPage extends StatefulWidget {
  const LoginRegisterOptionPage({super.key});

  @override
  State<LoginRegisterOptionPage> createState() =>
      _LoginRegisterOptionPageState();
}

class _LoginRegisterOptionPageState extends State<LoginRegisterOptionPage> {
  final LoginBloc loginBloc = LoginBloc();
  @override
  void initState() {
    loginBloc.add(LoginInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: loginBloc,
      listenWhen: (previous, current) => current is LoginActionState,
      buildWhen: (previous, current) => current is! LoginActionState,
      listener: (context, state) {
        switch (state.runtimeType) {
          case LoginSignUpState:
            final successState = state as LoginSignUpState;
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(successState.message)));
            break;
          case LoginRegisterPageToHomePageNavigateState:
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ));
            break;
          case LoginSignInState:
            final successState = state as LoginSignInState;
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(successState.message)));
            break;
          case LoginLoginPageToHomePageNavigateState:
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ));

          default:
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case LoginSuccessLoadedState:
            return OptionPage(
              loginBloc: loginBloc,
            );
          case LoginOptionPageToLoginPageNavigateState:
            return LoginPage(loginBloc: loginBloc);
          case LoginOptionPageToRegisterPageNavigateState:
            return RegisterPage(loginBloc: loginBloc);
          default:
            return Container(
              alignment: Alignment.center,
              color: Colors.white,
              width: double.infinity,
              height: double.infinity,
              child: SizedBox(
                height: 80.w,
                width: 80.w,
                child: CircularProgressIndicator(
                  color: Colors.teal.shade300,
                ),
              ),
            );
        }
      },
    );
  }
}
