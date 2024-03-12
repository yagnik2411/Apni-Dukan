import 'package:apni_dukan/features/Login/ui/login_options.dart';
import 'package:apni_dukan/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



Future<void> main() async {
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 873),
      child: MaterialApp(
        title: "Apni Dukan",
        // ignore: unnecessary_new
        theme: ThemeData(
            backgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.teal.shade300,
              foregroundColor: Colors.white,
            )),
        debugShowCheckedModeBanner: false,
        home:  LoginRegisterOptionPage(),
      ),
    );
  }
}
