import 'package:api/Views/Home/home.dart';
import 'package:api/Views/LoginScreens/signUp.dart';
import 'package:api/Views/Provider/loginProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}
TextEditingController _emailcontroller=TextEditingController();
TextEditingController _passwordcontroller=TextEditingController();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0).r,
          child: Consumer<LoginProvider>(builder: (context, value, child) {
            return  Column(crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(height: 50.h,),
                Center(
                  child: GestureDetector(
                    onTap: () {
                     value.Login(email: _emailcontroller.text, password: _passwordcontroller.text);
                    },
                    child: Container(
                      height: 50.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(child:value.loading?CircularProgressIndicator(): Text('Login',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),)),
                    ),
                  ),
                ),
                SizedBox(height: 30.h,),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                    },
                    child: Container(
                      height: 50.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(child: Text('SignUp',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),)),
                    ),
                  ),
                )
              ],
            );
          },

          )

        ),
      ),
    );
  }
}
