
import 'package:ecommerce/ui/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_assets.dart';

import '../../../../../core/utils/app_validator.dart';
import '../../../../../core/utils/sizeconfig.dart';
import '../../../../../core/utils/text_style.dart';
import '../../signup_screen/widgets/custom_text_fielld.dart';


class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("forget_password",style: AppTextStyle.regular14Yellow.copyWith(fontSize: 16),),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: SizeConfig.screenHeight * .04,
            horizontal: SizeConfig.screenWidth * .04,
          ),
          child: Column(
            crossAxisAlignment: .start,
            spacing: SizeConfig.screenHeight * .02,
            children: [
              Image.asset(AppAssets.forgetpass_copy),
              CustomTextFormField(
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: AppValidator.validateEmail,
                prefixIcon:Icon(Icons.lock),
              ),
              CustomElevatedButton(onpPressed: () {}, text: "Verify Email",    colorText: Colors.white,
                backgroundColor: Colors.pink,),
            ],
          ),
        ),
      ),
    );
  }
}