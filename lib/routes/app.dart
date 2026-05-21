import 'package:flutter/material.dart';
import 'app_routes.dart';

class CourtMedicApp extends StatelessWidget {
  const CourtMedicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Court Medic',
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xff3b76f6),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff3b76f6),
          primary: const Color(0xff3b76f6),
          background: Colors.white,
        ),
        fontFamily: 'Comic Sans MS',
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
      
      routerConfig: AppRoutes.router,
    );
  }
}