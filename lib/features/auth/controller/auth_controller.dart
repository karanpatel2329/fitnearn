import 'package:fitnearn/features/auth/service/auth_service.dart';
import 'package:fitnearn/features/auth/view/login_screen.dart';
import 'package:fitnearn/features/home/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  RxString gender = 'male'.obs;
  Rx<DateTime?> dob = null.obs;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  RxBool isVisible = false.obs;
  void login() async {
    isLoading.value = true;
    bool res =
        await AuthService.login(emailController.text, passwordController.text);
    if (res) {
      Get.offAll(HomeScreen());
    }
    isLoading.value = false;
  }
  void register()async{
     isLoading.value = true;
    bool res =
        await AuthService.register(fullName: fullNameController.text,mobile: mobileController.text,email: registerEmailController.text,password: registerPasswordController.text,address: addressController.text,age: ageController.text,gender: gender.value,city: cityController.text,state: stateController.text,pincode: pincodeController.text,dob: dob.value??DateTime.now());
    if (res) {
      Get.offAll(const HomeScreen());
    }
    isLoading.value = false;
  }
  void checkLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? isLogin = prefs.getString('email');
    if (isLogin != null) {
      Get.offAll(HomeScreen());
    }
  }

  Future logout()async{
     final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
     Get.offAll(LoginScreen());
  }
  bool isValidEmail(String email) {
  // Email regex pattern
  final RegExp emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
  );

  return emailRegex.hasMatch(email);
}

Future<bool> validateAddress()async{

  List list =await AuthService.pincode(pincodeController.text);
  if(list.isNotEmpty){
    if(list[0]['State'].toString().toLowerCase()==stateController.text.toLowerCase()){
      return true;
    }
  }
  return false;
}

 void resetValuesToDefault() {
    isLoading.value = false;
    emailController.clear();
    passwordController.clear();

    registerEmailController.clear();
    registerPasswordController.clear();
    gender.value = 'male';
    dob.value = null;

    fullNameController.clear();
    mobileController.clear();
    ageController.clear();
    addressController.clear();
    cityController.clear();
    stateController.clear();
    pincodeController.clear();
  }
}
