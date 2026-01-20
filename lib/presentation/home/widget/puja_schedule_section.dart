import 'package:flutter/material.dart';

class PujaScheduleSection extends StatelessWidget {
  const PujaScheduleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.yellow.shade100, Colors.orange.shade100],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(onTap: ()=>Navigator.pop(context),child: Icon(Icons.arrow_back, color: Colors.black54,)),

          // 🔱 Title
          const Center(
            child: Text(
              "📌 পূজা কার্যক্রমসূচি",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
          ),

          const SizedBox(height: 16),

          const ScheduleItem(
            time: "সকাল ৯.৩০ মি",
            title: "মণ্ডপ শুদ্ধিকরণ, আলপনা ও আগমনী সংগীত",
          ),
          const ScheduleItem(
            time: "সকাল ১০.০১ মি",
            title: "বাণী অর্চনা, দেবী আবাহন ও বোধন",
          ),
          const ScheduleItem(
            time: "সকাল ১০.৪৫ মি",
            title: "ষোড়শোপচার পূজা ও মন্ত্রোচ্চারণ",
          ),
          const ScheduleItem(
            time: "সকাল ১১.৩০ মি",
            title: "পুষ্পাঞ্জলি ও প্রসাদ নিবেদন",
          ),
          const ScheduleItem(time: "দুপুর ১২.৩০ মি", title: "মহাপ্রসাদ বিতরণ"),
          const Divider(height: 24),

          const ScheduleItem(
            time: "সন্ধ্যা ৬.০১ মি",
            title: "সন্ধ্যা আরতি, ধূপ ও ধুনুচি নৃত্য",
          ),
          const ScheduleItem(
            time: "সন্ধ্যা ৬.৪৫ মি",
            title: "দেবীকে প্রণাম ও আশীর্বাদ গ্রহণ",
          ),
        ],
      ),
    );
  }
}

class ScheduleItem extends StatelessWidget {
  final String time;
  final String title;

  const ScheduleItem({super.key, required this.time, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("🪔  "),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black87, fontSize: 15),
                children: [
                  TextSpan(
                    text: "$time : ",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: title),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
