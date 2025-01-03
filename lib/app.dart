import 'package:flutter/material.dart';
import 'package:tedix/utils/theme/theme.dart';
import 'package:tedix/features/authentication/screens/login/login.dart';

class App extends StatelessWidget {
  const App({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      home: LoginScreen(),
    );


  }
}

