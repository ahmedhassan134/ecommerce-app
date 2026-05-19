
import 'package:ecommerce/ui/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';


import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_routes.dart';

import '../../../../../core/utils/app_validator.dart';
import '../../../../../core/utils/sizeconfig.dart';
import '../../../../../core/utils/text_style.dart';
import '../../signup_screen/widgets/custom_text_fielld.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.screenHeight * .08,
                horizontal: SizeConfig.screenWidth * .04,
              ),
              child: Column(
                spacing: SizeConfig.screenHeight * .01,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: SizeConfig.screenHeight *.07,),


                  Padding(
                    padding:  EdgeInsets.only(
                      left: SizeConfig.screenWidth *.1,
                    ),
                    child: Text(
                      "LOG IN",
                      style: AppTextStyle.regular16Weight,
                      textAlign: .center,
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      spacing: SizeConfig.screenHeight * .02,
                      children: [
                        CustomTextFormField(
                          controller: emailController,
                          hintText: "email",

                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: AppValidator.validateEmail,
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                        CustomTextFormField(
                          controller: passwordController,
                          hintText: "Password",
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          isPassword: true,
                          validator: AppValidator.validatePassword,
                          prefixIcon:Icon(Icons.lock),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: .end,
                    children: [
                      TextButton(
                        onPressed: () {
                          // todo: navigator to forgetScreen
                          Navigator.of(
                            context,
                          ).pushNamed(AppRoutes.forgetPassword);
                        },
                        child: Text(
                          "Forget Password",

                          style: AppTextStyle.regular14Yellow.copyWith(

                            decorationThickness: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomElevatedButton(
                    onpPressed: () {
                      if (formKey.currentState!.validate()) {
                        // BlocProvider.of<AuthCubit>(context).login(
                        //   email: emailController.text,
                        //   password: passwordController.text,
                        // );
                      }
                    },
                    text: "LOG IN",
                    colorText: Colors.white,
                    backgroundColor: Colors.pink,
                  ),

                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      Text(
                        "Dont Have Account ",
                        style: AppTextStyle.regular14Weight,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          // todo: navigator to forgetScreen
                          Navigator.of(
                            context,
                          ).pushNamed(AppRoutes.signupScreen);
                        },
                        child: Text(
                          "Create One",
                          style: AppTextStyle.bold14Yellow,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      Expanded(
                        child: Divider(
                          endIndent: 16,
                          indent: 30,
                          thickness: 2,
                          color: Colors.white
                        ),
                      ),
                      Text("or", style: AppTextStyle.bold14Yellow),
                      Expanded(
                        child: Divider(
                          endIndent: 30,
                          indent: 16,
                          thickness: 2,
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //todo: not done
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(16),
                      ),
                      minimumSize: const Size.fromHeight(56),
                    ),
                    child: Row(
                      spacing: SizeConfig.screenWidth * .04,
                      mainAxisAlignment: .center,
                      children: [
                        Image.asset(AppAssets.google),
                        Text(
                          "Login With Google",
                          style: AppTextStyle.regular16Weight.copyWith(
                            color: AppColors.darkGreyClr,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * .01),


                ],
              ),
            ),
          ),
        ),
      );
  }
}