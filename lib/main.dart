import 'package:eassy_competition/core/route/route_config.dart';
import 'package:eassy_competition/core/route/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Swarashati Puja Essay Competition',
      themeMode: ThemeMode.system,

      // 👇 Set light theme with background color
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFFFFD700),
        ),
        scaffoldBackgroundColor: Colors.white, // App background
      ),
      
      // 👇 Set dark theme with background color
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFFFFD700),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: Color(0xFF121212),
      ),

      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: RouteNames.splashScreen,
    );
  }
}
