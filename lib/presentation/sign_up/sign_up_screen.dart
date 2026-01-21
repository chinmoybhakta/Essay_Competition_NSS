import 'package:eassy_competition/data/riverpod/data_riverpod.dart';
import 'package:eassy_competition/presentation/competition/writing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController batchController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    final userPersonalData = ref.read(dataProvider);
    if (userPersonalData != null) {
      nameController.text = userPersonalData.name ?? '';
      idController.text = userPersonalData.id ?? '';
      emailController.text = userPersonalData.email ?? '';
      batchController.text = userPersonalData.batch ?? '';
      departmentController.text = userPersonalData.department ?? '';
      mobileController.text = userPersonalData.mobile ?? '';
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    idController.dispose();
    emailController.dispose();
    batchController.dispose();
    departmentController.dispose();
    mobileController.dispose();
    super.dispose();
  }

  InputDecoration inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.orange),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFD700),
        title: const Text(
          "অংশগ্রহণকারীর নিবন্ধন",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // 📜 সরস্বতী শ্লোক
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.yellow.shade50,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.amber),
                ),
                child: const Text(
                  "সরস্বতী নমস্তুভ্যং বরদে কামরূপিণি।\n"
                  "বিদ্যারম্ভং করিষ্যামি সিদ্ধির্ভবতু মে সদা॥",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.brown,
                    height: 1.4,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // 👤 নাম
              TextFormField(
                style: TextStyle(color: Colors.black54),
                controller: nameController,
                decoration: inputDecoration("পূর্ণ নাম", Icons.person),
                validator: (value) => value!.isEmpty ? "নাম আবশ্যক" : null,
              ),

              const SizedBox(height: 15),

              // 🆔 আইডি
              TextFormField(
                style: TextStyle(color: Colors.black54),
                controller: idController,
                decoration: inputDecoration("ছাত্র আইডি", Icons.badge),
                validator: (value) => value!.isEmpty ? "আইডি আবশ্যক" : null,
              ),

              const SizedBox(height: 15),

              // 📧 ইমেইল
              TextFormField(
                style: TextStyle(color: Colors.black54),
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: inputDecoration("ইমেইল", Icons.email),
                validator: (value) {
                  if (value!.isEmpty) return "ইমেইল আবশ্যক";
                  if (!value.contains('@')) return "সঠিক ইমেইল দিন";
                  return null;
                },
              ),

              const SizedBox(height: 15),

              // 🎓 ব্যাচ
              TextFormField(
                style: TextStyle(color: Colors.black54),
                controller: batchController,
                decoration: inputDecoration("ব্যাচ", Icons.school),
                validator: (value) => value!.isEmpty ? "ব্যাচ আবশ্যক" : null,
              ),

              const SizedBox(height: 15),

              // 🏫 বিভাগ
              TextFormField(
                style: TextStyle(color: Colors.black54),
                controller: departmentController,
                decoration: inputDecoration("বিভাগ", Icons.account_balance),
                validator: (value) => value!.isEmpty ? "বিভাগ আবশ্যক" : null,
              ),

              const SizedBox(height: 15),

              // 📱 মোবাইল
              TextFormField(
                style: TextStyle(color: Colors.black54),
                controller: mobileController,
                keyboardType: TextInputType.phone,
                decoration: inputDecoration("মোবাইল নম্বর", Icons.phone),
                validator: (value) {
                  if (value!.isEmpty) return "মোবাইল নম্বর আবশ্যক";
                  if (value.length < 10) return "সঠিক মোবাইল নম্বর দিন";
                  return null;
                },
              ),

              const SizedBox(height: 30),

              // ▶ চালিয়ে যান
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFD700),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ref
                        .read(dataProvider.notifier)
                        .setUserData(
                          name: nameController.text,
                          id: idController.text,
                          email: emailController.text,
                          batch: batchController.text,
                          department: departmentController.text,
                          mobile: mobileController.text,
                        );

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const WritingScreen()),
                    );
                  }
                },
                child: const Text(
                  "চালিয়ে যান",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
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
