import 'package:eassy_competition/core/services/sheet_service.dart';
import 'package:eassy_competition/data/riverpod/data_riverpod.dart';
import 'package:eassy_competition/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WritingScreen extends StatefulWidget {
  const WritingScreen({super.key});

  @override
  State<WritingScreen> createState() => _WritingScreenState();
}

class _WritingScreenState extends State<WritingScreen> {
  final TextEditingController essayController = TextEditingController();

  final int wordLimit = 500;

  int get wordCount {
    if (essayController.text.trim().isEmpty) return 0;
    return essayController.text.trim().split(RegExp(r'\s+')).length;
  }

  @override
  void dispose() {
    essayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: const Color(0xFFFFD700),
        title: const Text(
          "প্রবন্ধ রচনা",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),

      body: Column(
        children: [
          // 🧑 অংশগ্রহণকারীর তথ্য
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            color: Colors.yellow.shade100,
            child: const Text(
              "অংশগ্রহণকারী: নিবন্ধিত শিক্ষার্থী",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
            ),
          ),

          // ✍️ প্রবন্ধ লেখার অংশ
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 📜 উক্তি
                  const Text(
                    "“জ্ঞান তখনই শক্তি, যখন তা প্রজ্ঞার দ্বারা পরিচালিত হয়।”",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // 📝 লেখার জায়গা
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.black54),
                      controller: essayController,
                      maxLines: null,
                      expands: true,
                      decoration: InputDecoration(
                        hintText: "এখানে আপনার প্রবন্ধ লেখা শুরু করুন...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: const EdgeInsets.all(12),
                      ),
                      onChanged: (value) => setState(() {}),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // 🔢 শব্দ গণনা
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "শব্দ সংখ্যা: $wordCount / $wordLimit",
                        style: TextStyle(
                          color: wordCount > wordLimit
                              ? Colors.red
                              : Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Consumer(
                        builder: (_, ref, _) {
                          final fullData = ref.watch(dataProvider);
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFFD700),
                            ),
                            onPressed: () async {
                              if (wordCount == 0) return;

                              ref
                                  .read(dataProvider.notifier)
                                  .setEssay(essayController.text.trim());

                              if (fullData != null) {
                                final success = await SheetService()
                                    .submitEssay(
                                      fullData,
                                      essayController.text.trim(),
                                    );

                                showDialog(
                                  // ignore: use_build_context_synchronously
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (_) => AlertDialog(
                                    title: Text(
                                      success
                                          ? "জমা সম্পন্ন"
                                          : "জমা অসম্পূর্ণ",
                                    ),
                                    content: Text(
                                      success
                                          ? "আপনার প্রবন্ধ সফলভাবে জমা হয়েছে।\n\nধন্যবাদ!"
                                          : "সময় শেষ অথবা কোনো সমস্যা হয়েছে।",
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) =>
                                                  const HomeScreen(),
                                            ),
                                          );
                                        },
                                        child: const Text("ঠিক আছে"),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                            child: const Text(
                              "জমা দিন",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
