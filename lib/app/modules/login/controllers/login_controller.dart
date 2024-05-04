import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mini_project_chapter_10/app/modules/home/views/home_view.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('user');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> checkCredentials(String username, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: username,
        password: password,
      );
      QuerySnapshot querySnapshot =
          await _userCollection.where('username', isEqualTo: username).get();
      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  Future<void> loginUser() async {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Username and password cannot be empty',
          backgroundColor: Color(0xffd567cd), colorText: Color(0xffffffff));
      return;
    }

    bool isValidCredentials = await checkCredentials(username, password);

    if (isValidCredentials) {
      Get.snackbar('Success', 'Login successful',
          backgroundColor: Color(0xffd567cd), colorText: Color(0xffffffff));
      Get.off(
        () => HomeView(),
        transition: Transition.cupertinoDialog,
        duration: Duration(milliseconds: 500),
      );
    } else {
      Get.snackbar('Error', 'Incorrect username or password',
          backgroundColor: Color(0xffd567cd), colorText: Color(0xffffffff));
    }
  }
}
