import 'package:flutter/material.dart';
import 'package:gradient/screen/calender_page.dart';
import 'package:gradient/screen/details_page.dart';
import 'package:gradient/screen/explorePage.dart';
import 'package:gradient/screen/payment_page.dart';
import 'package:gradient/screen/sidebar_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Travel UI",
      debugShowCheckedModeBanner: false,

      // ------------------ THEME ------------------
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F1532),
        fontFamily: 'Poppins',
      ),

      // ------------------ ROUTES ------------------
      initialRoute: "/",
      routes: {
        "/": (context) => const PropertyHomePage(),            // Home Page
        "/details": (context) => const LuxuryStayPage(),      // Details Page
        "/drawer": (context) => const SideMenu3D(),        // Side Menu 3D
        "/calendar": (context) => const BookAvailableDatePage(priceText: '', initialRangeText: '',), // Calendar Page
      },
    );
  }
}
