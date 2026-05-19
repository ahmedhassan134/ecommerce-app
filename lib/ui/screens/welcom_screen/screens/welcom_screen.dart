import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_routes.dart';
import 'package:ecommerce/core/utils/sizeconfig.dart';
import 'package:ecommerce/ui/screens/welcom_screen/widgets/custom_container.dart';
import 'package:ecommerce/ui/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.backgroundWelcomeScreen),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            // spacing: SizeConfig.screenHeight * .02,
            // mainAxisAlignment: .center,
            // crossAxisAlignment: .center,
            children: [
              SizedBox(height: SizeConfig.screenHeight *.3,),
              CustomContainer(
                width: SizeConfig.screenWidth * .4,
                child: Text(
                  "Welcome",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: .w900,
                  ),
                  textAlign: .center,
                ),
              ),
              CustomContainer(
                width: SizeConfig.screenWidth * .6,
                child: RichText(
                  text: TextSpan(
                    text: 'Asroo ',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 24,
                      fontWeight: .w900,
                    ),
                    children: [
                      TextSpan(
                        text: 'Shop',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: .w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight *.2,),

              CustomElevatedButton(
                onpPressed: () {},
                text: "Get Start ",
                width: SizeConfig.screenWidth * .4,
                backgroundColor: AppColors.mainColor,
                colorText: Colors.white,
              ),
              SizedBox(height: SizeConfig.screenHeight *.1,),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    "dont have account?",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: .bold,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(AppRoutes.signupScreen);
                    },
                    child: Text(
                      "Signup",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                        color: Colors.white,
                        fontWeight: .bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
