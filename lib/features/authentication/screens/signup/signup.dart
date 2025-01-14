import 'package:gstore_official/common/widgets/login_signup/form_divider.dart';
import 'package:gstore_official/features/authentication/screens/login/widgets/social_buttons.dart';
import 'package:gstore_official/features/authentication/screens/signup/widget/singup_form.dart';
import 'package:gstore_official/utils/constants/sizes.dart';
import 'package:gstore_official/utils/constants/text_strings.dart';
import 'package:gstore_official/utils/helpers/helper_functions.dart';

// import 'package:firebase_eco/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Form
              const TSignupForm(),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Divider
              TFormDivider(
                dark: dark,
                dividerText: TTexts.orSignUpWith.capitalize!,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Social Buttons
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
