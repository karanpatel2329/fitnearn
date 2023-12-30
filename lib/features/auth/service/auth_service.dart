import 'package:dio/dio.dart';
import 'package:fitnearn/core/route/api_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService{
  static Future<bool> login(String email,String password)async{
   try{
     Dio dio = Dio();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var res = await dio.post(APIRoute.loginURL,data: {
      'email':email,
      'password':password
    });
    print("++++${res}");
    if(res.statusCode==200){
      sharedPreferences.setString('email',email);
      return true;
    }else{
       Get.showSnackbar(GetSnackBar(title: 'error',message: 'Invalid email or password',duration: Duration(seconds: 2),),);
      
      return false;
    }
   }on DioException catch (e) {
  
     if(e.response?.statusCode==401){
        print("+++INSIDE DIO ERORR");
        Get.showSnackbar(const GetSnackBar(title: 'error',message: 'Invalid email or password',duration: Duration(seconds: 2)));
      }else{
         Get.showSnackbar(GetSnackBar(title: 'error',message: 'Something went wrong',duration: Duration(seconds: 2)));
      }
        Get.showSnackbar(GetSnackBar(title: 'error',message: 'Something went wrong',duration: Duration(seconds: 2)));
    
      return false;
   }
   catch(e){
    print(e);
    return false;
   }
  }
   static Future<bool> register({required String email,required String password,required String mobile,required DateTime dob,required String age,required String address,required String city,required String state,required String pincode,required String gender,required String fullName,})async{
    try{
      Dio dio = Dio();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var res = await dio.post(APIRoute.registerURL,data: {
      'email':email,
      'password':password,
      "fullName":fullName,
      "profileImage":"",
      "gender":gender,
     
     "mobileNumber":mobile,
      "age":age,
      "address":address,
      "city":city,
      "state":state,
      "pincode":pincode
    });
    print("++++${res.statusCode}");
    if(res.statusCode==200 ||res.statusCode==201){
      return true;
    }else{
         Get.showSnackbar(GetSnackBar(title: 'error',message: 'Something went wrong',duration: Duration(seconds: 2)));
     
      return false;
    }
    }
    on DioException catch (e) {
     if(e.response?.statusCode==401){
       Get.showSnackbar(GetSnackBar(title: 'error',message: 'Something went wrong',duration: Duration(seconds: 2),),);
      }else{
         Get.showSnackbar(GetSnackBar(title: 'error',message: 'Something went wrong',duration: Duration(seconds: 2)));
      }
      return false;
   }catch(e){
      
      return false;
    }
  }
  static Future<List> pincode(String pincode)async{
    try{
        Dio dio = Dio();
        var res =await dio.get(APIRoute.pincodeURL+pincode);
        // print(res.data);
        return res.data[0]['PostOffice'];
        
    }catch(e){
      print(e);
      return [];
    }
  }
}