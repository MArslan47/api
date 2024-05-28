import 'dart:convert';

import 'package:api/Views/LoginScreens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart'as http;

class RegisterProvider with ChangeNotifier{
  bool _getting=false;
  bool get getting=>_getting;
  load(bool load){
    _getting=load;
    notifyListeners();
  }
  Future<void>Register ({required String email,required String password,required String confPassword})async{
    try{

      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer 11|laravel_sanctum_MCZV5MOwOKdYVHXeiqulYeEXW3khrAHvmLBBTAB51e9fea84'
      };
      var request = http.MultipartRequest('POST', Uri.parse('http://gifoff.learnunstoppable.com/api/register'));
      request.fields.addAll({
        'email': '$email',
        'password': '$password',
        'password_confirmation': '$confPassword'
      });
      load(true);
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var data =await http.Response.fromStream(response);
      Map<String,dynamic> map= jsonDecode(data.body);
      print('register $map');
      if (response.statusCode == 200) {
        print(data.body);
        Get.snackbar('Successfuly',"${map['message']}");
        Get.offAll(Login());

        print(await response.stream.bytesToString());
      }
      else {
        Get.snackbar('Error',"${map['message']}");
        load(false);
        print(response.reasonPhrase);
      }

    }catch(e){
      Get.snackbar('Successfuly',"$e}");
      load(false);

    }
  }

}