import 'package:api/Views/LoginScreens/login.dart';
import 'package:api/Views/Provider/registerProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'Views/Provider/loginProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider(),),
        ChangeNotifierProvider(create: (context) => RegisterProvider(),),
      ],
      child: ScreenUtilInit(
        designSize: Size(400, 900),
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: const Login(),
        ),
      ),
    );
  }
}


