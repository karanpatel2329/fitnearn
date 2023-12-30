import 'package:fitnearn/core/constant/colors.dart';
import 'package:fitnearn/core/constant/image_path.dart';
import 'package:fitnearn/core/constant/text_style.dart';
import 'package:fitnearn/features/auth/controller/auth_controller.dart';
import 'package:fitnearn/features/auth/view/forget_password_screen.dart';
import 'package:fitnearn/features/auth/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  AuthController authController = Get.put(AuthController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    authController.resetValuesToDefault();
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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SvgPicture.asset(
                    ImagePath.authSvg,
                  ),
                ),
                Text(
                  'Signup',
                  style: AppTextStyle.labelText,
                ),
                SizedBox(
                  height: Adaptive.px(16),
                ),
                Row(
                  children: [
                    Text(
                      'Full Name',
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
                  controller: authController.fullNameController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Full name',
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 0, horizontal: Adaptive.px(20)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Adaptive.px(13)),
                        borderSide: BorderSide(
                            color: AppColor.primaryText.withOpacity(0.15))),
                  ),
                ),
                SizedBox(
                  height: Adaptive.px(10),
                ),
                Row(
                  children: [
                    Text(
                      'Gender',
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
                Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(Adaptive.px(13))),
                      border: Border.all(
                          color: AppColor.primaryText.withOpacity(0.45))),
                  padding: EdgeInsets.symmetric(horizontal: Adaptive.px(20)),
                  child: DropdownButton(
                      value: authController.gender.value,
                      dropdownColor: Colors.white,
                      hint: Text("Select Gender"),
                      underline: SizedBox(),
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(value: 'male', child: Text('Male')),
                        DropdownMenuItem(value: 'female', child: Text('Female'))
                      ],
                      onChanged: (v) {
                        authController.gender.value = v ?? '';
                      }),
                ),
                SizedBox(
                  height: Adaptive.px(10),
                ),
                Row(
                  children: [
                    Text(
                      'D.O.B.',
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
                Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(Adaptive.px(13))),
                        border: Border.all(
                            color: AppColor.primaryText.withOpacity(0.45))),
                    padding: EdgeInsets.symmetric(
                        horizontal: Adaptive.px(20), vertical: Adaptive.px(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          authController.dob.value == null
                              ? "Enter D.O.B."
                              : "${authController.dob.value?.day}/${authController.dob.value?.month}/${authController.dob.value?.year}",
                        ),
                        InkWell(
                            onTap: () async {
                              DateTime? date = await showDatePicker(
                                context: context,
                                firstDate: DateTime(1980),
                                lastDate: DateTime.now(),
                              );
                              setState(() {
                                authController.dob = date.obs;
                              });
                            },
                            child: Icon(
                              Icons.calendar_month,
                              color: AppColor.primaryColor,
                            ))
                      ],
                    )),
                SizedBox(
                  height: Adaptive.px(10),
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
                  controller: authController.registerEmailController,
                  validator: (value) {
                    if (!authController.isValidEmail(value ?? "")) {
                      return 'Please enter valid email';
                    }
                    return null;
                  },
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
                  height: Adaptive.px(10),
                ),
                Text(
                  'Password',
                  style: AppTextStyle.inputLable,
                ),
                SizedBox(
                  height: Adaptive.px(6),
                ),
                TextFormField(
                  controller: authController.registerPasswordController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 0, horizontal: Adaptive.px(20)),
                    suffixIcon: Icon(
                      Icons.visibility_off,
                      color: AppColor.primaryColor,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Adaptive.px(13)),
                        borderSide: BorderSide(
                            color: AppColor.primaryText.withOpacity(0.15))),
                  ),
                ),
                SizedBox(
                  height: Adaptive.px(10),
                ),
                Row(
                  children: [
                    Text(
                      'Mobile Number',
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
                  controller: authController.mobileController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your mobile';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Mobile Number',
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 0, horizontal: Adaptive.px(20)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Adaptive.px(13)),
                        borderSide: BorderSide(
                            color: AppColor.primaryText.withOpacity(0.15))),
                  ),
                ),
                SizedBox(
                  height: Adaptive.px(10),
                ),
                Row(
                  children: [
                    Text(
                      'Age',
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
                  controller: authController.ageController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a age';
                    }

                    // Use a regular expression to check if the entered value is numeric
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Please enter a valid age';
                    }

                    return null; // Return null if the value is valid
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter Age',
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 0, horizontal: Adaptive.px(20)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Adaptive.px(13)),
                        borderSide: BorderSide(
                            color: AppColor.primaryText.withOpacity(0.15))),
                  ),
                ),
                SizedBox(
                  height: Adaptive.px(10),
                ),
                Text(
                  'Address',
                  style: AppTextStyle.inputLable,
                ),
                SizedBox(
                  height: Adaptive.px(6),
                ),
                TextFormField(
                  controller: authController.addressController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter address',
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 0, horizontal: Adaptive.px(20)),
                    suffixIcon: Icon(
                      Icons.share_location_sharp,
                      color: AppColor.primaryColor,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Adaptive.px(13)),
                        borderSide: BorderSide(
                            color: AppColor.primaryText.withOpacity(0.15))),
                  ),
                ),
                SizedBox(
                  height: Adaptive.px(10),
                ),
                Row(
                  children: [
                    Text(
                      'City',
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
                  controller: authController.cityController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your city';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter City',
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 0, horizontal: Adaptive.px(20)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Adaptive.px(13)),
                        borderSide: BorderSide(
                            color: AppColor.primaryText.withOpacity(0.15))),
                  ),
                ),
                SizedBox(
                  height: Adaptive.px(10),
                ),
                Row(
                  children: [
                    Text(
                      'State',
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
                  controller: authController.stateController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your state';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter State',
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 0, horizontal: Adaptive.px(20)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Adaptive.px(13)),
                        borderSide: BorderSide(
                            color: AppColor.primaryText.withOpacity(0.15))),
                  ),
                ),
                SizedBox(
                  height: Adaptive.px(10),
                ),
                Row(
                  children: [
                    Text(
                      'Pincode',
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
                  controller: authController.pincodeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a pincode';
                    }

                    // Use a regular expression to check if the entered value is numeric
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Please enter a valid pincode';
                    }

                    return null; // Return null if the value is valid
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter Pincode',
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 0, horizontal: Adaptive.px(20)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Adaptive.px(13)),
                        borderSide: BorderSide(
                            color: AppColor.primaryText.withOpacity(0.15))),
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
                      onTap: () {
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
                      onTap: () async {
                        if (authController.gender.value == null) {
                          Get.showSnackbar(
                            GetSnackBar(
                              title: 'Select',
                              message: 'Please select gender',
                              duration: Duration(seconds: 2),
                            ),
                          );
                          return;
                        }
                        if (authController.dob.value == null) {
                          Get.showSnackbar(
                            GetSnackBar(
                              title: 'Select',
                              message: 'Please select DOB',
                              duration: Duration(seconds: 2),
                            ),
                          );
                          return;
                        }
                        if (_formKey.currentState?.validate() ?? false) {
                          // If the form is valid, proceed with registration logic
                          // Call your registration function here
                          authController.isLoading.value = true;
                          bool isvalidAddress =
                              await authController.validateAddress();
                               authController.isLoading.value = false;
                          if (isvalidAddress) {
                            authController.register();
                          }else{
                                  Get.showSnackbar(GetSnackBar(title: 'error',message: 'Enter valid pincode of your state',duration: Duration(seconds: 2)));
  
                          }
                        }
                      },
                      child: Obx(
                        () => Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Adaptive.px(42),
                              vertical: Adaptive.px(8)),
                          decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(Adaptive.px(30))),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                )
                              ]),
                          child: authController.isLoading.value
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  "Register",
                                  style: AppTextStyle.interText.copyWith(
                                      color: Colors.white,
                                      fontSize: Adaptive.px(20),
                                      fontWeight: FontWeight.w600),
                                ),
                        ),
                      )),
                ),
                SizedBox(
                  height: Adaptive.px(35),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(LoginScreen());
                  },
                  child: Center(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Adaptive.px(20)),
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
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
