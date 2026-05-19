
import 'package:ecommerce/ui/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';


import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/app_validator.dart';

import '../../../../../core/utils/sizeconfig.dart';
import '../../../../../core/utils/text_style.dart';
import '../widgets/custom_text_fielld.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController phoneController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneController = TextEditingController();
    nameController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    nameController.dispose();
    super.dispose();
  }
  bool isClicked=false;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * .04,
                vertical: SizeConfig.screenWidth * .04,
              ),
              child: Column(
                crossAxisAlignment: .start,
                spacing: SizeConfig.screenHeight * .02,

                children: [
                  SizedBox(height: SizeConfig.screenHeight *.07,),


                  Padding(
                    padding:  EdgeInsets.only(
                      left: SizeConfig.screenWidth *.1,
                    ),
                    child: Text(
                      "SIGN UP",
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
                          controller: nameController,
                          hintText: "User name",
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          validator: AppValidator.validateName,
                          prefixIcon:  Icon(Icons.people),
                        ),
                        CustomTextFormField(
                          controller: emailController,
                          hintText: "Email",
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: AppValidator.validateEmail,
                          prefixIcon:  Icon(Icons.lock),
                        ),
                        CustomTextFormField(
                          controller: passwordController,
                          hintText: "Password",
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                          isPassword: true,
                          validator: AppValidator.validatePassword,
                          prefixIcon: Image.asset(AppAssets.lock,color: Colors.pink,),
                        ),
                        CustomTextFormField(
                          controller: confirmPasswordController,
                          hintText: "Confirm Password",
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                          isPassword: true,
                          validator: (value) {
                            return AppValidator.validateConfirmPassword(
                              value,
                              passwordController.text,
                            );
                          },

                          prefixIcon: Icon(Icons.lock),
                        ),

                      ],
                    ),
                  ),
                  Row(
                    spacing: SizeConfig.screenWidth *.02,
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            isClicked=!isClicked;
                          });
                          
                        },
                        child: Container(
                          width: 60,
                          height:60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)
                          ),
                          child: isClicked?Image.asset(AppAssets.check):null,
                        ),
                      ),
                      Text("i accept terms and conditions",style: AppTextStyle.regular16Weight,)

                    ],
                  ),
                  CustomElevatedButton(
                    onpPressed: () {
                      if (formKey.currentState!.validate()) {
                        // BlocProvider.of<AuthCubit>(context).register(
                        //   email: emailController.text,
                        //   password: passwordController.text,
                        //   name: nameController.text,
                        // );
                      }
                    },
                    text: "SIGN UP",
                    colorText: Colors.white,
                    backgroundColor: Colors.pink,
                  ),

                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      Text(
                        "already_have_account? ",
                        style: AppTextStyle.regular14Weight,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          Navigator.of(
                            context,
                          ).pushNamed(AppRoutes.loginScreen);
                        },
                        child: Text(
                          "login",
                          style: AppTextStyle.bold14Yellow,
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      );

  }
}