import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  SplashscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/bg-splash-screen.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/bunga-ungu.png',
                width: 200,
                height: 152.68,
              ),
              SizedBox(height: 10),
              // Teks splash screen
              Container(
                width: 210, 
                height: 35,
                child: Text(
                  'HELLO FELLAS.',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                width: 199, 
                height: 36,
                child: Text(
                  'Temukan segala jenis bunga dari berbagai belahan dunia!',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}