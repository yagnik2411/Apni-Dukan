import 'package:apni_dukan/features/Login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OptionPage extends StatelessWidget {
  final LoginBloc loginBloc ;
  const OptionPage({
    super.key, required this.loginBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            200.verticalSpace,
            Container(
              alignment: Alignment.center,
              width: 300.w,
              height: 300.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade200,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 5,
                      offset: Offset(0, 5),
                    ),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/logo.png",height: 200.w, width: 200.w,),
                  Text(
                    "Apni Dukan",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 35.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade300,
                    ),
                  ),
                ],
              ),
            ),
            200.verticalSpace,
            SizedBox(
              width: 300.w,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {
                  loginBloc.add(LoginOptionPageLoginButtonClickedEvent());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            20.verticalSpace,
            SizedBox(
              width: 300.w,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {
                   loginBloc.add(LoginOptionPageRegisterButtonClickedEvent());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
