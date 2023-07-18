import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weater_apk_2/ui/home_screen/home_screen.dart';
import 'package:weater_apk_2/ui/home_screen/widget/query.dart';
import 'package:weater_apk_2/ui/next_7_days/next_7days.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(430, 868),
      builder: (BuildContext context, Widget? child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home:HomeScreen(),
        );
      },
    );
  }
}
