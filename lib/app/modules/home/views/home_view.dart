import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final HomeController controller = Get.put(HomeController());
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg-home-screen.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(230, 230, 230, 1),
                        border: Border(
                          bottom: BorderSide(width: 1, color: Colors.black),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 20, top: 100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment
                                    .start, // Tambahkan baris ini
                                children: [
                                  Text(
                                    'Hello, ${controller.nameController.text}',
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          5), // Tambahkan jarak vertikal antara teks
                                  Text(
                                    'How\'s your day going?',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Obx(
                              () => controller.imageUrl.value.isEmpty
                                  ? ClipOval(
                                      child: Container(
                                        color: const Color.fromRGBO(
                                            220, 220, 220, 1),
                                        height: 60,
                                        width: 60,
                                        child: Image.asset(
                                          'assets/images/Person.png',
                                          width: 50,
                                          height: 50,
                                        ),
                                      ),
                                    )
                                  : ClipOval(
                                      child: Image.network(
                                        controller.imageUrl.value,
                                        height: 50,
                                        width: 50,
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top:
                                    10), // Sesuaikan jarak atas sesuai kebutuhan
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'My Phone Number : ${controller.phoneNumberController.text}',
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  'My Address : ${controller.addressController.text}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.uploadAndDisplayImage();
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
                      'Upload Foto',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
