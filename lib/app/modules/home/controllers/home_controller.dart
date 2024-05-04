import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeController extends GetxController {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('user');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxString imageUrl = ''.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  Future<void> uploadAndDisplayImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      try {
        if (imageUrl.value.isNotEmpty) {
          await firebase_storage.FirebaseStorage.instance
              .refFromURL(imageUrl.value)
              .delete();
        }

        String imageName = DateTime.now().millisecondsSinceEpoch.toString();
        firebase_storage.Reference ref = firebase_storage
            .FirebaseStorage.instance
            .ref()
            .child('images')
            .child('$imageName.jpg');
        await ref.putFile(imageFile);

        String downloadUrl = await ref.getDownloadURL();

        imageUrl.value = downloadUrl;
        Get.snackbar(
        'Upload Berhasil',
        'Gambar berhasil diupload',
        backgroundColor: const Color.fromARGB(255, 245, 95, 145),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      } catch (e) {
        print('Error uploading image: $e');
      }
    } else {
      print('No image selected.');
    }
  }

  

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DocumentSnapshot userSnapshot =
            await _userCollection.doc(user.uid).get();
        if (userSnapshot.exists) {
          var userData = userSnapshot.data() as Map<String, dynamic>;
          nameController.text = userData['name'] ?? '';
          addressController.text = userData['address'] ?? '';
          phoneNumberController.text = userData['phoneNumber'] ?? '';
        } else {
          print('No user data found.');
        }
      } else {
        print('No user logged in.');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }
}
