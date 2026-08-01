import 'dart:math';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'home_shell.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void _enterApp(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomeShell()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5F2),
      body: Stack(
        children: [
          // Faint decorative sport icons in the corners, like the wireframe.
          const Positioned(top: 90, right: 24, child: _FadedIcon(Icons.sports_tennis, angle: 0.3)),
          const Positioned(bottom: 140, left: -10, child: _FadedIcon(Icons.sports_soccer, size: 90)),
          const Positioned(bottom: 150, right: -10, child: _FadedIcon(Icons.sports_basketball, size: 100)),
          const Positioned(bottom: 210, left: 110, child: _FadedIcon(Icons.sports_tennis, size: 40)),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 3),
                  // Logo with a small "bandage" resting on top, like the mock.
                  SizedBox(
                    height: 140,
                    width: 140,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Image.asset('assets/images/logo.png', width: 120, height: 120),
                        Positioned(
                          top: -6,
                          left: -18,
                          child: Transform.rotate(
                            angle: -0.55,
                            child: Container(
                              width: 64,
                              height: 26,
                              decoration: BoxDecoration(
                                color: const Color(0xFFEFC9A6),
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: Colors.white, width: 3),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('Court Medic', style: AppTextStyles.title(context).copyWith(fontSize: 26)),
                  const Spacer(flex: 2),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      onPressed: () => _enterApp(context),
                      child: Text('Login', style: AppTextStyles.label(context).copyWith(color: Colors.white, fontSize: 18)),
                    ),
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.primaryBlue,
                        side: const BorderSide(color: AppColors.primaryBlue),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      onPressed: () => _enterApp(context),
                      child: Text('Sign Up', style: AppTextStyles.label(context).copyWith(color: AppColors.primaryBlue, fontSize: 18)),
                    ),
                  ),
                  const Spacer(flex: 1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FadedIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final double angle;

  const _FadedIcon(this.icon, {this.size = 60, this.angle = 0});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.15,
      child: Transform.rotate(
        angle: angle * pi,
        child: Icon(icon, size: size, color: Colors.black26),
      ),
    );
  }
}
