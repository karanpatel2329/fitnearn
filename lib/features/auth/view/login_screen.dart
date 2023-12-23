import 'package:fitnearn/core/constant/colors.dart';
import 'package:fitnearn/core/constant/image_path.dart';
import 'package:fitnearn/core/constant/text_style.dart';
import 'package:fitnearn/features/auth/controller/auth_controller.dart';
import 'package:fitnearn/features/auth/view/forget_password_screen.dart';
import 'package:fitnearn/features/auth/view/signup_screen.dart';
import 'package:fitnearn/features/home/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    authController.checkLogin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.px(40)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SvgPicture.asset(
                  ImagePath.authSvg,
                ),
              ),
              Text(
                'Login',
                style: AppTextStyle.labelText,
              ),
              SizedBox(
                height: Adaptive.px(16),
              ),
              Text(
                'E-mail Address',
                style: AppTextStyle.inputLable,
              ),
              SizedBox(
                height: Adaptive.px(6),
              ),
              TextFormField(
                controller: authController.emailController,
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
                height: Adaptive.px(12),
              ),
              Text(
                'Password',
                style: AppTextStyle.inputLable,
              ),
              SizedBox(
                height: Adaptive.px(6),
              ),
              Obx(()=> TextFormField(
                obscureText: authController.isVisible.value,
                controller: authController.passwordController,
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 0, horizontal: Adaptive.px(20)),
                  suffixIcon: InkWell(
                    onTap: (){
                      authController.isVisible.value = !authController.isVisible.value ;
                    },
                    child: Icon(
                     authController.isVisible.value?Icons.visibility: Icons.visibility_off,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Adaptive.px(13)),
                      borderSide: BorderSide(
                          color: AppColor.primaryText.withOpacity(0.15))),
                ),
              ),
             ),
              SizedBox(
                height: Adaptive.px(6),
              ),
              Row(
                children: [
                  Checkbox(value: true, onChanged: (v) {}),
                  Text(
                    "Remember me",
                    style: AppTextStyle.smallText,
                  ),
                  Spacer(),
                  InkWell(
                    onTap: (){
                      Get.to(ForgetPasswordScreen());
                    },
                    child: Text(
                      "Forget Password?",
                      style: AppTextStyle.smallText
                          .copyWith(color: AppColor.primaryColor),
                    ),
                  )
                ],
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
                          text: 'By signing in you are agreeing our ',
                          style: AppTextStyle.smallText
                              .copyWith(fontWeight: FontWeight.w400),
                          children: [
                            TextSpan(
                                text: 'Terms & privacy policy',
                                style: AppTextStyle.smallTextWithPrimaryColor)
                          ])),
                ),
              ),
              SizedBox(
                height: Adaptive.px(12),
              ),
              Center(
                child: InkWell(
                  onTap: (){
                   authController.login();
                  },
                  child:Obx(()=> Container(
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
                    child:authController.isLoading.value?CircularProgressIndicator(color: Colors.white,): Text("Login",style: AppTextStyle.interText.copyWith(color: Colors.white,fontSize: Adaptive.px(20),fontWeight: FontWeight.w600),),
                  ),
                )),
              ),
              SizedBox(
                height: Adaptive.px(35),
              ),
               InkWell(
                onTap: (){
                  Get.to(SignUpScreen());
                },
                child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Adaptive.px(20)),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: 'Don’t have an account? ',
                          style: AppTextStyle.interText,
                          children: [
                            TextSpan(
                                text: 'Sign up',
                                style: AppTextStyle.interText.copyWith(color: AppColor.primaryColor))
                          ])),
                ),
              ),
               )
            ],
          ),
        ),
      )),
    );
  }
}
