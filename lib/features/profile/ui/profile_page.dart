import 'package:flutter/material.dart';
import 'package:apni_dukan/main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String fullName =
        "${globalUser?.firstName ?? ''} ${globalUser?.lastName ?? ''}";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                            Text("$fullName", style: TextStyle(fontSize: 25.sp)),
                            Text("${globalUser?.emailAddress}",
                                style: TextStyle(fontSize: 16.sp)),
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
