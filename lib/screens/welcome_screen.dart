import 'package:flutter/material.dart';
import 'package:Court_Medic/constants/app_colors.dart';
import 'package:Court_Medic/constants/app_text_styles.dart';
import 'package:Court_Medic/constants/app_assets.dart';
import 'package:Court_Medic/widgets/custom_button.dart';
import 'login_screen.dart'; // Giả định bạn có file login_screen.dart

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Logo Court Medic
              Image.asset(
                AppAssets.imgLogo,
                width: 160,
                height: 160,
                fit: Alignment.center,
              ),
              const SizedBox(height: 24),
              // Tên ứng dụng phong cách handwritten
              const Text(
                'Court Medic',
                style: AppTextStyles.appTitle,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              // Nút điều hướng Login
              CustomButton(
                text: 'Login',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
              ),
              const SizedBox(height: 16),
              // Nút điều hướng Sign Up dạng viền (Outlined)
              CustomButton(
                text: 'Sign Up',
                isOutlined: true,
                onPressed: () {
                  // Điều hướng sang màn hình Đăng ký
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}