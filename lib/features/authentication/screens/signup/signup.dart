import 'package:flutter/material.dart';
import 'package:tedix/features/authentication/screens/signup/signup_form.dart';
import 'package:tedix/utils/constants/text_strings.dart';



class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(TTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 32),

              const TSignupForm(),
            ],
          ),
        ),
      ),
    );
  }
}

