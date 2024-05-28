import 'package:api/Views/Provider/registerProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp  ({super.key});

  @override
  State<SignUp > createState() => _State();
}

TextEditingController _emailcontroller=TextEditingController();
TextEditingController _passwordcontroller=TextEditingController();
TextEditingController _confirmpasswordcontroller=TextEditingController();


class _State extends State<SignUp > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0).r,
          child: Consumer<RegisterProvider>(builder: (context, value, child) {
            return Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h,),
                Text('Email',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
                SizedBox(height: 10.h,),
                TextField(
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12).r,
                      hintText: 'Enter Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20).r,
                        borderSide: BorderSide(color: Colors.red),
                      )
                  ),
                ),
                SizedBox(height: 20.h,),
                Text('Password',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
                SizedBox(height: 10.h,),
                TextField(
                  controller: _passwordcontroller,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12).r,
                      hintText: 'Enter Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20).r,
                        borderSide: BorderSide(color: Colors.red),
                      )
                  ),
                ),
                SizedBox(height: 20.h,),
                Text('Confirm Password',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
                SizedBox(height: 10.h,),
                TextField(
                  controller: _confirmpasswordcontroller,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12).r,
                      hintText: 'Enter Confirm Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20).r,
                        borderSide: BorderSide(color: Colors.red),
                      )
                  ),
                ),
                SizedBox(height: 50.h,),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      value.Register(email: _emailcontroller.text, password: _passwordcontroller.text, confPassword: _confirmpasswordcontroller.text).then((value) => {
                        _emailcontroller.clear(),
                        _passwordcontroller.clear(),
                        _confirmpasswordcontroller.clear(),
                      });
                    },
                    child: Container(
                      height: 50.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(child:value.getting?CircularProgressIndicator(): Text('SignUp',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),)),
                    ),
                  ),
                ),


              ],
            );
          },)
        ),
      ),
    );
  }
}
