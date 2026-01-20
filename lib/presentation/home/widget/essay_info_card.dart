import 'package:flutter/material.dart';

class EssayInfoCard extends StatelessWidget {
  const EssayInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFFF8E1), // হালকা হলুদ
            Color(0xFFFFE082), // পূজার সোনালি রং
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.orange.shade300, width: 1.5),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.orange.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // 🌸 শিরোনাম
          const Center(
            child: Text(
              "🪔 প্রবন্ধ রচনা প্রতিযোগিতা",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // 📝 বিষয়সমূহ
          const Text(
            "📚 প্রবন্ধের বিষয়",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange,
            ),
          ),

          const SizedBox(height: 8),

          _topicItem("১. ছাত্রজীবনে সরস্বতী পূজার গুরুত্ব"),
          _topicItem("২. জাতি গঠনে শিক্ষার ভূমিকা"),
          _topicItem("৩. জ্ঞান, প্রজ্ঞা ও মানবতা"),
          _topicItem("৪. যুবসমাজ ও শিক্ষার শক্তি"),
          _topicItem("৫. আধুনিক শিক্ষায় নৈতিক মূল্যবোধ"),

          const Divider(height: 24, thickness: 1),

          // 📏 নিয়মাবলী
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _ruleChip(
                icon: Icons.article,
                label: "শব্দসীমা: ৫০০  ",
              ),
              _ruleChip(
                icon: Icons.timer,
                label: "সময় সীমিত  ",
              ),
            ],
          ),

          const SizedBox(height: 16),

          // ⚠ AI সতর্কবার্তা
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.red.shade300),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Icon(Icons.warning_amber_rounded, color: Colors.red),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "যেকোনো ধরনের AI টুল ব্যবহার করলে সঙ্গে সঙ্গে অযোগ্য ঘোষণা করা হবে।",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 বিষয় আইটেম
  static Widget _topicItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.circle, size: 6, color: Colors.brown),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

// 🔹 নিয়ম চিপ উইজেট
// ignore: camel_case_types
class _ruleChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ruleChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(icon, size: 18, color: Colors.brown),
      label: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.redAccent,
        ),
      ),
      backgroundColor: Colors.yellow.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.orange.shade300),
      ),
    );
  }
}
