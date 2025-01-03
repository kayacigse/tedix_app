import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/text_strings.dart';

class TSignupForm extends StatefulWidget {
  const TSignupForm({super.key});

  @override
  _TSignupFormState createState() => _TSignupFormState();
}

class _TSignupFormState extends State<TSignupForm> {
  // TextEditController'lar
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // Firebase Authentication
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Kullanıcı kaydını yapacak fonksiyon
  Future<void> _signup() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      // Şifreler eşleşmiyorsa hata mesajı
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    try {
      // Firebase Authentication ile kullanıcı oluştur
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Başarılı kayıt sonrası mesaj ve yönlendirme
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account created successfully!')),
      );

      // Başarılı kayıttan sonra ana sayfaya veya giriş ekranına yönlendirebilirsiniz.
      Navigator.pushReplacementNamed(context, '/home');  // Örnek: 'home' adlı ekrana yönlendirme

    } on FirebaseAuthException catch (e) {
      String errorMessage = "An error occurred. Please try again.";

      if (e.code == 'email-already-in-use') {
        errorMessage = "The email address is already in use by another account.";
      } else if (e.code == 'weak-password') {
        errorMessage = "The password is too weak.";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // İlk ve Soyad
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                    labelText: TTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                    labelText: TTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Kullanıcı Adı
          TextFormField(
            controller: _usernameController,
            decoration: const InputDecoration(
              labelText: TTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: 16),

          // E-posta
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: 16),

          // Telefon Numarası
          TextFormField(
            controller: _phoneNoController,
            decoration: const InputDecoration(
              labelText: TTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: 16),

          // Şifre
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: TTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(height: 16),

          // Şifre Onayı
          TextFormField(
            controller: _confirmPasswordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: TTexts.confirmPassword,
              prefixIcon: const Icon(Iconsax.password_check),
              suffixIcon: const Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(height: 32),

          // Hesap Oluştur butonu
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _signup,  // Firebase'e kullanıcı kaydını yapacak fonksiyon
              child: const Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}