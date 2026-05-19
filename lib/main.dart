import 'package:ecommerce/core/utils/app_routes.dart';
import 'package:ecommerce/core/utils/app_theme.dart';
import 'package:ecommerce/ui/screens/auth/login_screen/screens/login_screen.dart';
import 'package:ecommerce/ui/screens/auth/signup_screen/screens/signup_screen.dart';
import 'package:ecommerce/ui/screens/home_screen/screens/home_screen.dart';
import 'package:ecommerce/ui/screens/welcom_screen/screens/welcom_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.welcomeScreen,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      routes: {
        AppRoutes.welcomeScreen:(context)=>WelcomeScreen(),
        AppRoutes.loginScreen:(context)=>LoginScreen(),
        AppRoutes.signupScreen:(context)=>RegisterScreen(),
        AppRoutes.homeScreen:(context)=>HomeScreen(),
      },

    );
  }
}


