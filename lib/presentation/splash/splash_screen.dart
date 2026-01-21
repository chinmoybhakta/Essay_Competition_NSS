import 'dart:async';
import 'package:eassy_competition/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animations
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Create animations
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.elasticOut),
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.8, curve: Curves.easeOut),
      ),
    );

    _rotateAnimation = Tween<double>(begin: 0.0, end: 2 * 3.14159).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );

    // Start animations
    _controller.forward();

    // Navigate after animations
    Timer(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const HomeScreen(),
          transitionsBuilder:
              (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 500),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFDF6E3), // Light cream
              Colors.white,
              Color(0xFFF5F5F5),
            ],
          ),
        ),
        child: Stack(
          children: [
            // Background decorative elements
            Positioned(
              top: 50,
              right: 30,
              child: AnimatedBuilder(
                animation: _rotateAnimation,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _rotateAnimation.value,
                    child: child,
                  );
                },
                child: Icon(
                  Icons.book,
                  size: 40,
                  color: const Color(0xFFDAA520)
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              left: 30,
              child: Icon(
                Icons.brush,
                size: 35,
                color: const Color(0xFFDAA520),
              ),
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 🌼 Goddess Saraswati Image with animation
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFFDAA520).withOpacity(0.3),
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFDAA520),
                              blurRadius: 20,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            'assets/img/protima_1.jpg',
                            height: 180,
                            width: 180,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // 📜 Title with slide animation
                  SlideTransition(
                    position: _slideAnimation,
                    child: Column(
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Saraswati Puja\n",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF8B4513), // Rich brown
                                  fontFamily: 'Serif',
                                ),
                              ),
                              TextSpan(
                                text: "Essay Writing Competition",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFDAA520), // Golden
                                  fontFamily: 'Serif',
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 25),

                        // Decorative divider
                        Container(
                          height: 3,
                          width: 100,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFFDAA520),
                                const Color(0xFFDAA520),
                                const Color(0xFFDAA520)
                              ],
                            ),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),

                        const SizedBox(height: 30),

                        // 🕉 Sanskrit Shloka in beautiful container
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFDF6E3),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: const Color(0xFFDAA520),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.auto_awesome,
                                  color: Color(0xFFDAA520),
                                  size: 24,
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "या कुन्देन्दु तुषारहार धवला\nया शुभ्रवस्त्रावृता ।\nया वीणावरदण्डमण्डितकरा\nया श्वेतपद्मासना ॥",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF5D4037),
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "- Saraswati Vandana",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 40),

                        // ⏳ Animated loading indicator
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            // Outer rotating circle
                            AnimatedBuilder(
                              animation: _controller,
                              builder: (context, child) {
                                return Transform.rotate(
                                  angle: _controller.value * 2 * 3.14159,
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color:
                                            const Color(0xFFDAA520).withOpacity(0.3),
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),

                            // Inner animated dots
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(3, (index) {
                                return AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  margin: const EdgeInsets.symmetric(horizontal: 3),
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFDAA520),
                                    shape: BoxShape.circle,
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        // Loading text with fade animation
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: Text(
                            "Preparing the competition...",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Bottom decorative wave
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFFDAA520).withOpacity(0.1),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}