import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart'as http;

import '../Home/home.dart';


class LoginProvider with ChangeNotifier{
  bool _loading=false;
  bool get loading=>_loading;
  load(bool load){
    _loading=load;
    notifyListeners();
  }
  Future<void> Login({required String email,required String password})async{
    try{
      load(true);
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer 11|laravel_sanctum_MCZV5MOwOKdYVHXeiqulYeEXW3khrAHvmLBBTAB51e9fea84'
      };
      var request = http.MultipartRequest('POST', Uri.parse('http://gifoff.learnunstoppable.com/api/login'));
      request.fields.addAll({
        'email': '$email',
        'password': '$password'
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var data = await http.Response.fromStream(response);
     Map<String,dynamic> map = jsonDecode(data.body);
     print('login $map');
      if (response.statusCode == 200) {
       print(data.body);

       Get.snackbar('Successfuly',"${map['message']}");
       Get.offAll(Home());
        load(false);
        print(await response.stream.bytesToString());
      }
      else {
        load(false);
        Get.snackbar('Error',"${map['message']}");
        print(response.reasonPhrase);
      }
    }catch(e){
      Get.snackbar('Successfuly',"$e");
      load(false);
    }
  }
}