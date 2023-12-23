import 'package:fitnearn/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppTextStyle{
   static TextStyle titleText = TextStyle(
    fontSize: Adaptive.px(25),
    fontWeight: FontWeight.w700,
    color: AppColor.primaryColor
  );
  static TextStyle labelText = TextStyle(
    fontSize: Adaptive.px(30),
    fontWeight: FontWeight.w700,
    color: AppColor.primaryColor
  );

  static TextStyle inputLable = TextStyle(
    fontSize: Adaptive.px(16),
    fontWeight: FontWeight.w500,
    color: AppColor.primaryText
  );

  static TextStyle smallText = TextStyle(
    fontSize: Adaptive.px(10),
    fontWeight: FontWeight.w500,
    color: AppColor.primaryText
  );
  
  static TextStyle smallTextWithPrimaryColor = TextStyle(
    fontSize: Adaptive.px(10),
    fontWeight: FontWeight.w500,
    color: AppColor.primaryColor
  );
   static TextStyle interText = GoogleFonts.inter(
    fontSize: Adaptive.px(15),
    fontWeight: FontWeight.w400,
    color: AppColor.primaryText,
  );

  static TextStyle headingStyle = GoogleFonts.nunito(
    color: Color(0xFF5479BB),
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 0,
  );

  static TextStyle titleStyle =GoogleFonts.nunito(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 0,
  );

  static TextStyle descriptionStyle =GoogleFonts.nunito(
    color: Colors.white,
    fontSize: 8,
    fontWeight: FontWeight.w400,
    height: 0,
  );

  static TextStyle infoTextStyle = GoogleFonts.nunito(
    color: Colors.white,
    fontSize: 10,
    fontWeight: FontWeight.w600,
    height: 0,
  );
}