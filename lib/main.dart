import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:g_trip/helper/theme.dart';
import 'package:g_trip/veiw/get_started.dart';
import 'package:get/route_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'G Trip',
        theme: getThemeDate(),
        home: const GetStartedView());
  }
}
