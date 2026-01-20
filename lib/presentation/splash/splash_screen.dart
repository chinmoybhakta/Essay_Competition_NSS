import 'dart:async';
import 'package:eassy_competition/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // 🌼 Goddess Saraswati Image
            Image.asset(
              'assets/img/protima_1.jpg',
              height: 200,
            ),

            const SizedBox(height: 30),

            // 📜 Title
            const Text(
              "Saraswati Puja\nEssay Writing Competition",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFFDAA520), // Golden
              ),
            ),

            const SizedBox(height: 20),

            // 🕉 Sanskrit Shloka
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "या कुन्देन्दु तुषारहार धवला\nया शुभ्रवस्त्रावृता ।\nया वीणावरदण्डमण्डितकरा\nया श्वेतपद्मासना ॥",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // ⏳ Loading Indicator
            const CircularProgressIndicator(
              color: Color(0xFFFFD700),
            ),
          ],
        ),
      ),
    );
  }
}
