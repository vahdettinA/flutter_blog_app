import 'package:blog/firebase_options.dart';

import 'package:blog/future/view/home.dart';
import 'package:blog/future/view/login.dart';
import 'package:blog/future/view/mybottomappbar.dart';
import 'package:blog/product/theme/mytheme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          useMaterial3: true,
          scaffoldBackgroundColor: MyTheme.white,
        ),
        home: Login());
  }
}
