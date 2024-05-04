import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_chapter_10/app/modules/register/views/register_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final LoginController controller = Get.put(LoginController());
  LoginView({Key? key}) : super(key: key);

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
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Image.asset(
                      'assets/images/login-logo.png',
                      width: 250,
                      height: 250,
                      fit: BoxFit.contain,
                    ),
                  ),
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
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      controller.loginUser();
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
                      'Login',
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
                          'Don’t have an account ?',
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
                            () => RegisterView(),
                            transition: Transition.leftToRight,
                            duration: Duration(milliseconds: 500),
                          );
                        },
                        child: Text(
                          'sign in',
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
