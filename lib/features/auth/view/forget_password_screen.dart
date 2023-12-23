import 'package:fitnearn/core/constant/colors.dart';
import 'package:fitnearn/core/constant/image_path.dart';
import 'package:fitnearn/core/constant/text_style.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          child: Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.px(30.0)),
        child: Column(
          children: [
            Spacer(),
            Center(child: Image.asset(ImagePath.forgetPng)),
            SizedBox(
              height: Adaptive.px(50),
            ),
            Row(
              children: [
                Text(
                  'E-mail Address',
                  style: AppTextStyle.inputLable,
                ),
                Text(
                  '*',
                  style: AppTextStyle.inputLable
                      .copyWith(color: AppColor.errorColor),
                ),
              ],
            ),
            SizedBox(
              height: Adaptive.px(6),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter E-mail address',
                contentPadding: EdgeInsets.symmetric(
                    vertical: 0, horizontal: Adaptive.px(20)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Adaptive.px(13)),
                    borderSide: BorderSide(
                        color: AppColor.primaryText.withOpacity(0.15))),
              ),
            ),
            SizedBox(
              height: Adaptive.px(18),
            ),
            Pinput(
              validator: (s) {
                return s == '2222' ? null : 'Pin is incorrect';
              },
              defaultPinTheme: PinTheme(
                width: 56,
                height: 56,
                textStyle: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(30, 60, 87, 1),
                    fontWeight: FontWeight.w600),
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              showCursor: true,
              onCompleted: (pin) => print(pin),
            ),
            SizedBox(
              height: Adaptive.px(18),
            ),
            Center(
              child: InkWell(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Adaptive.px(42), vertical: Adaptive.px(8)),
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius:
                          BorderRadius.all(Radius.circular(Adaptive.px(30))),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ]),
                  child: Text(
                    "Get OTP",
                    style: AppTextStyle.interText.copyWith(
                        color: Colors.white,
                        fontSize: Adaptive.px(20),
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Adaptive.px(18),
            ),
            Divider(
              color: Color(0xffd9d9d9),
              thickness: 0.8,
            ),
            SizedBox(
              height: Adaptive.px(12),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Adaptive.px(20)),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'Already have an account? ',
                        style: AppTextStyle.interText,
                        children: [
                          TextSpan(
                              text: 'Login',
                              style: AppTextStyle.interText
                                  .copyWith(color: AppColor.primaryColor))
                        ])),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
