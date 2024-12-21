import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tedix/common/styles/spacing_styles.dart';
import 'package:tedix/features/authentication/screens/signup/signup.dart';
import 'package:tedix/utils/constants/sizes.dart';
import 'package:tedix/utils/constants/text_strings.dart';
import 'package:get/get.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(TTexts.loginTitle,
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: TSizes.sm),
                  Text(TTexts.loginSubTitle,//
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),


              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: TSizes.spaceBtwSections),
                  child: Column(
                    children: [

                      TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.direct_right),
                            labelText: TTexts.email), // InputDecoration
                      ),
                      const SizedBox(height: TSizes.spaceBtwInputFields),


                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.password_check),
                          labelText: TTexts.password,
                          suffixIcon: Icon(Iconsax.eye_slash),
                        ),
                      ),
                      const SizedBox(height: TSizes.spaceBtwInputFields / 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          TextButton(
                              onPressed: () {},
                              child: const Text(TTexts.forgetPassword)),
                        ],
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),


                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: const Text(TTexts.signIn))),
                      const SizedBox(height: TSizes.spaceBtwSections),


                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignupScreen()));},
                            child: const Text(TTexts.createAccount)),
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}