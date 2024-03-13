import 'package:apni_dukan/features/Login/bloc/login_bloc.dart';
import 'package:apni_dukan/features/Login/ui/widget/login_page.dart';
import 'package:apni_dukan/features/Login/ui/widget/options_page.dart';
import 'package:apni_dukan/features/Login/ui/widget/register_page.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
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
      },
    );
  }
}
