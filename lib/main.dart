import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/home/ui/home.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize:  const Size(393, 873),
      child: MaterialApp(
      title: "Apni Dukan",
        // ignore: unnecessary_new
        theme: ThemeData(
          backgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.teal.shade300,
            foregroundColor: Colors.white,
            // centerTitle: true
          )
        ),
        debugShowCheckedModeBanner: false,
        home: const Home(),
      ),
    );
  }
}













