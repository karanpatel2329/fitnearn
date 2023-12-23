import 'package:fitnearn/features/auth/view/forget_password_screen.dart';
import 'package:fitnearn/features/auth/view/login_screen.dart';
import 'package:fitnearn/features/auth/view/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          home: LoginScreen(),
          theme: ThemeData(
            textTheme: GoogleFonts.nunitoTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
        );
      },
    );
  }
}
