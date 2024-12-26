import 'package:flutter/material.dart';
import 'app.dart';
import 'package:tedix/features/authentication/screens/login/login.dart';

import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure bindings are initialized
  runApp(const App());
}



