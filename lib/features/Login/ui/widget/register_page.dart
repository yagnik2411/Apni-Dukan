import 'package:apni_dukan/features/Login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatelessWidget {
  final LoginBloc loginBloc;
  const RegisterPage({
    super.key,
    required this.loginBloc,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didpop) async {
        loginBloc.add(LoginInitialEvent());
        
      },
      child: Scaffold(
        backgroundColor: Colors.teal.shade50,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              100.verticalSpace,
              Container(
                alignment: Alignment.center,
                width: 220.w,
                height: 70.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 5,
                        offset: Offset(0, 5),
                      ),
                    ]),
                child: Text(
                  "Register Here",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.teal.shade300,
                  ),
                ),
              ),
              100.verticalSpace,
              Padding(
                padding: EdgeInsets.all(10.0.w),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "abc",
                    hintStyle: TextStyle(
                        color: Colors.teal.shade100,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                    label: Container(
                      padding: EdgeInsets.all(10.sp),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Text(
                        "First Name",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0.w),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "abc",
                    hintStyle: TextStyle(
                        color: Colors.teal.shade100,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                    label: Container(
                      padding: EdgeInsets.all(10.sp),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Text(
                        "Last Name",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0.w),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "abc@xyz.com",
                    hintStyle: TextStyle(
                        color: Colors.teal.shade100,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                    label: Container(
                      padding: EdgeInsets.all(10.sp),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Text(
                        "Email",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0.w),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "abc123",
                    hintStyle: TextStyle(
                        color: Colors.teal.shade100,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                    label: Container(
                      padding: EdgeInsets.all(10.sp),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Text(
                        "Password",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0.w),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "abc123",
                    hintStyle: TextStyle(
                        color: Colors.teal.shade100,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                    label: Container(
                      padding: EdgeInsets.all(10.sp),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Text(
                        "Re-enter Password",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              10.verticalSpace,
              SizedBox(
                width: 120.w,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.teal.shade400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
