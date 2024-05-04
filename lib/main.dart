import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAqfZpU91p6b3cG9GJn-qLTNEIGysKCehI",
          appId: "1:735403371279:android:6d533cb385ad619fb2ec7a",
          messagingSenderId: "735403371279",
          projectId: "miniproject-8f331",
          storageBucket: "gs://miniproject-8f331.appspot.com"));
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
