import 'dart:async';
import 'package:eassy_competition/core/services/music_service.dart';
import 'package:eassy_competition/presentation/home/widget/essay_info_card.dart';
import 'package:eassy_competition/presentation/home/widget/puja_schedule_section.dart';
import 'package:eassy_competition/presentation/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 🔥 প্রতিযোগিতা শেষ হওয়ার সময়
  final DateTime submissionEndTime = DateTime(2026, 1, 22, 23, 59);

  Duration remainingTime = Duration.zero;
  Timer? timer;

  bool isAudioPlaying = false;

  final List<String> images = [
    'assets/img/cover_pp_2.png',
    'assets/img/cover_pp_3.png',
    'assets/img/cover_pp_4.png',
    'assets/img/cover_pp_5.png',
    'assets/img/cover_pp_6.png',
    'assets/img/cover_pp_7.png',
    'assets/img/cover_pp_8.png',
    'assets/img/cover_pp_9.png',
    'assets/img/cover_pp_10.png',
    'assets/img/cover_pp_11.png',
    'assets/img/cover_pp_12.png',
    'assets/img/cover_pp_13.png',
    'assets/img/cover_pp_14.png',
    'assets/img/cover_pp_15.png',
    'assets/img/cover_pp_16.png',
    'assets/img/cover_pp_21.png',
    'assets/img/cover_pp_22.png',
    'assets/img/cover_pp_25.png',
    'assets/img/cover_pp_26.png',
    'assets/img/cover_pp_27.png',
    'assets/img/cover_pp_28.png',
  ];

  @override
  void initState() {
    super.initState();
    startCountdown();
    BackgroundMusicService.stop();
  }

  void startCountdown() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        remainingTime = submissionEndTime.difference(DateTime.now());
      });
    });
  }

  String toBanglaNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const bangla = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], bangla[i]);
    }
    return input;
  }

  String formatDuration(Duration d) {
    if (d.isNegative) return "জমা দেওয়ার সময় শেষ";
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    final time =
        "${twoDigits(d.inHours)} : "
        "${twoDigits(d.inMinutes % 60)} : "
        "${twoDigits(d.inSeconds % 60)}";

    return toBanglaNumber(time);
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🕉 ইভেন্ট শিরোনাম
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset("assets/img/club_pp.jpg", width: 100),
                ),
                const Text(
                  "সরস্বতী পূজা–১৪৩২\nপ্রবন্ধ রচনা প্রতিযোগিতা",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFDAA520),
                  ),
                ),
              ],
            ),

            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  isAudioPlaying ? BackgroundMusicService.stop() : BackgroundMusicService.play();
                  setState(() {
                    isAudioPlaying = !isAudioPlaying;
                  });
                },
                child: Text(isAudioPlaying ?  "🔇 সঙ্গীত বন্ধ করুন" : "🔊 সঙ্গীত চালু করুন"),
              ),
            ),


            const SizedBox(height: 20),

            // 🌼 ছবি স্লাইডার
            CarouselSlider(
              items: images.map((image) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(image, fit: BoxFit.fitHeight),
                );
              }).toList(),
              options: CarouselOptions(
                height: 500,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
              ),
            ),

            const SizedBox(height: 10),

            const Text("সরস্বতী পূজা–১৪৩১ এর কিছু স্মৃতি"),

            const SizedBox(height: 30),

            // ⏳ টাইমার
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.yellow.shade50,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.amber, width: 2),
              ),
              child: Column(
                children: [
                  const Text(
                    "অবশিষ্ট সময়",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    formatDuration(remainingTime),
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 📜 শ্লোক
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "বিদ্যা দদাতি বিনয়ং, বিনয়াদ্ যাতি পাত্রতাম্।",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.black54,
                ),
              ),
            ),

            EssayInfoCard(),

            const SizedBox(height: 20),

            // ✍️ শুরু বাটন
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                if (remainingTime.isNegative) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('সময় শেষ! পরের বার চেষ্টা করো।'),
                      backgroundColor: Colors.redAccent,
                    ),
                  );
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SignUpPage()),
                );
              },
              child: const Text(
                "প্রবন্ধ লেখা শুরু করুন",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrangeAccent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PujaScheduleSection()),
                );
              },
              child: const Text(
                "📌 পূজা কার্যক্রমসূচি",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),

            const SizedBox(height: 30),

            Text("☎️ যোগাযোগ:\n মিঠুন চন্দ্র দাস মিঠু: +880-1533086994 (Bkash/Nagad/Rocket)\n অমর্ত্য চৌধুরী বর্ন: +880 1706-662814 (Bkash/Nagad/Rocket)\n ব্যাংক একাউন্ট: A/C Number: 1503105176791001, A/C Name: AMARTYA CHOWDHURY BORNO (BRAC Bank PLC, Moghbazar]\n আয়োজনে: নিটার সনাতনী সংঘ, নয়ারহাট, সাভার।", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black87),),
            const SizedBox(height: 10),
            Text("Copyright @2025-2026 CHINMOY BHAKTA All Rights Reserved", style: TextStyle(fontSize: 12, color: Colors.blueGrey)),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
