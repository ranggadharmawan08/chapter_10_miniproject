import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_chapter_10/app/modules/login/views/login_view.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final RegisterController controller = Get.put(RegisterController());
  RegisterView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg-login-register.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 300,
                    height: 45,
                    child: Text(
                      'WELCOME TO AZALEA',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username', // Teks di atas TextFormField pertama
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                      TextFormField(
                        controller: controller.usernameController,
                        decoration: InputDecoration(
                          hintText: 'Username',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name', // Teks di atas TextFormField kedua
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                      TextFormField(
                        controller: controller.nameController,
                        decoration: InputDecoration(
                          hintText: 'Name',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Address', // Teks di atas TextFormField kedua
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                      TextFormField(
                        controller: controller.addressController,
                        decoration: InputDecoration(
                          hintText: 'Address',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Phone Number', // Teks di atas TextFormField kedua
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                      TextFormField(
                        controller: controller.phonenumberController,
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Password', // Teks di atas TextFormField kedua
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                      TextFormField(
                        controller: controller.passwordController,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              )),
                        ),
                        obscureText: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Confirm Password', // Teks di atas TextFormField kedua
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                      TextFormField(
                        controller: controller.confirmpasswordController,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              )),
                        ),
                        obscureText: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      String username = controller.usernameController.text;
                      String name = controller.nameController.text;
                      String address = controller.addressController.text;
                      String phoneNumber =
                          controller.phonenumberController.text;
                      String password = controller.passwordController.text;
                      String confirmPassword =
                          controller.confirmpasswordController.text;
          
                      if (controller.validateInputs(
                          username: username,
                          name: name,
                          address: address,
                          phoneNumber: phoneNumber,
                          password: password)) {
                        if (password != confirmPassword) {
                          Get.snackbar('Error',
                              'Password and Confirm Password do not match', backgroundColor: Color(0xffd567cd), colorText: Color(0xffffffff));
                        } else {
                          bool isUsernameExists =
                              await controller.isUsernameExists(username);
                          if (isUsernameExists) {
                            Get.snackbar('Error', 'Username already exists', backgroundColor: Color(0xffd567cd), colorText: Color(0xffffffff));
                          } else {
                            await controller.registerUser(
                              username,
                              name,
                              address,
                              phoneNumber,
                              password,
                            );
                            Get.snackbar(
                                'Success', 'User registered successfully', backgroundColor: Color(0xffd567cd), colorText: Color(0xffffffff));
          
                            Get.off(
                              () => LoginView(),
                              transition: Transition.circularReveal,
                              duration: Duration(milliseconds: 500),
                            );
                          }
                        }
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(213, 103, 205, 1)),
                      minimumSize:
                          MaterialStateProperty.all<Size>(Size(350, 41)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    child: Text(
                      'Register', // Mengubah teks dari 'Login' menjadi 'Register'
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15, top: 16),
                        child: Text(
                          'Already have an account ?',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.off(
                            () => LoginView(),
                            transition: Transition.rightToLeft,
                            duration: Duration(milliseconds: 500),
                          );
                        },
                        child: Text(
                          'log in',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(0, 148, 255, 1),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
