import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterController extends GetxController {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('user');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  Future<bool> isUsernameExists(String username) async {
    QuerySnapshot querySnapshot =
        await _userCollection.where('username', isEqualTo: username).get();
    return querySnapshot.docs.isNotEmpty;
  }

  Future<void> registerUser(String username, String name, String address,
      String phoneNumber, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: username,
        password: password,
      );
      
      String userId = userCredential.user!.uid;

      await _userCollection.doc(userId).set({
        'username': username,
        'name': name,
        'address': address,
        'phoneNumber': phoneNumber,
      });

    } catch (e) {
      print("Error registering user: $e");
      Get.snackbar('Error', 'Gagal mendaftarkan pengguna. Silakan coba lagi nanti.', backgroundColor: Color(0xffd567cd), colorText: Color(0xffffffff));
    }
  }

  bool validateInputs(
      {required String username,
      required String name,
      required String address,
      required String phoneNumber,
      required String password}) {
    if (username.isEmpty ||
        name.isEmpty ||
        address.isEmpty ||
        phoneNumber.isEmpty ||
        password.isEmpty) {
      Get.snackbar('Error', 'Silakan isi semua kolom', backgroundColor: Color(0xffd567cd), colorText: Color(0xffffffff));
      return false;
    } else if (!isValidEmail(username)) {
      Get.snackbar('Error', 'Silakan masukkan email/username yang valid', backgroundColor: Color(0xffd567cd), colorText: Color(0xffffffff));
      return false;
    } else if (password.length < 8) {
      Get.snackbar('Error', 'Password harus minimal 8 karakter', backgroundColor: Color(0xffd567cd), colorText: Color(0xffffffff));
      return false;
    }
    return true;
  }

  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}
