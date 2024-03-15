import 'package:apni_dukan/features/profile/bloc/profile_bloc.dart';
import 'package:apni_dukan/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatelessWidget {
  final ProfileBloc profileBloc;
  Profile({
    super.key,
    required this.profileBloc,
  });

  String fullName =
      "${globalUser?.firstName ?? ''} ${globalUser?.lastName ?? ''}";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              color: Colors.teal.shade50,
              child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: SizedBox(
                    height: 100.0.h,
                    width: double.maxFinite.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.teal.shade300,
                          radius: 30.0.h,
                          child: Icon(
                            Icons.person,
                            size: 40.0.h,
                            color: Colors.white,
                          ),
                        ),
                        20.horizontalSpace,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(fullName, style: TextStyle(fontSize: 25.sp)),
                            Text("${globalUser?.emailAddress}",
                                style: TextStyle(fontSize: 16.sp)),
                            Text("${globalUser?.phoneNumber}",
                                style: TextStyle(fontSize: 16.sp)),
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
            20.verticalSpace,
            ElevatedButton(
              onPressed: () {
                profileBloc.add(ProfileAddAddressButtonClickedEvent());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal.shade300,
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: SizedBox(
                  width: 300.w,
                  child: Center(
                      child: Text("Add Address",
                          style:
                              TextStyle(fontSize: 20.sp, color: Colors.white))),
                ),
              ),
            ),
            10.verticalSpace,
            ElevatedButton(
              onPressed: () {
                // ignore: avoid_print
                profileBloc.add(ProfileSignOutButtonClickedEvent());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal.shade300,
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: SizedBox(
                  width: 300.w,
                  child: Center(
                      child: Text("Sign Out",
                          style:
                              TextStyle(fontSize: 20.sp, color: Colors.white))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
