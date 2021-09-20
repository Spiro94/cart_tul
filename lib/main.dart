import 'package:cart_tul/depedency_injection/dependency_injection.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  init();
  runApp(MyApp());
}
