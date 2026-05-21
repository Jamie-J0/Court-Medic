import 'package:flutter/material.dart';
import 'package:Court_Medic/constants/app_colors.dart';
import 'package:Court_Medic/constants/app_text_styles.dart';
import 'package:Court_Medic/constants/app_assets.dart';
import 'package:Court_Medic/widgets/custom_button.dart';
import 'package:Court_Medic/widgets/custom_textfield.dart';
import 'home_screen.dart'; // Để điều hướng sau khi đăng nhập thành công

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceWhite,
      // AppBar ẩn tiêu đề nhưng giữ nút quay lại phong cách iOS
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: AppColors.textBlack),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Tiêu đề lớn "Login" phong cách viết tay
              const Text(
                'Login',
                style: AppTextStyles.appTitle,
              ),
              const SizedBox(height: 40),

              // Ô nhập Email
              const CustomTextField(
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email_outlined,
              ),
              const SizedBox(height: 16),

              // Ô nhập Password
              const CustomTextField(
                hintText: 'Password',
                isPassword: true,
                prefixIcon: Icons.lock_outline,
              ),
              const SizedBox(height: 12),

              // Dòng chữ "Forgot password?" nằm bên phải
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Xử lý quên mật khẩu
                  },
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: const Text(
                    'Forgot password?',
                    style: AppTextStyles.linkBlue,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Nút bấm Đăng nhập chính
              CustomButton(
                text: 'Sign In',
                onPressed: () {
                  // Giả lập đăng nhập thành công -> chuyển thẳng vào HomeScreen và xóa lịch sử stack cũ
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (route) => false,
                  );
                },
              ),
              const SizedBox(height: 48),

              // --- Khu vực đăng nhập bằng MXH (Social Login) ---
              Center(
                child: Text(
                  'Or sign in with',
                  style: AppTextStyles.inputPlaceholder.copyWith(fontSize: 12),
                ),
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton(
                    assetPath: AppAssets.icGoogle,
                    onTap: () {
                      // Xử lý đăng nhập Google
                    },
                  ),
                  const SizedBox(width: 24),
                  _buildSocialButton(
                    assetPath: AppAssets.icApple,
                    onTap: () {
                      // Xử lý đăng nhập Apple
                    },
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Dòng chữ chuyển hướng đăng ký dưới cùng "Don't have an account? Sign up"
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: AppTextStyles.inputPlaceholder.copyWith(fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Chuyển sang màn hình Đăng ký (Sign Up Screen)
                    },
                    child: Text(
                      'Sign up',
                      style: AppTextStyles.linkBlue.copyWith(fontSize: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  // Widget phụ tạo nút bấm tròn cho Google và Apple
  Widget _buildSocialButton({required String assetPath, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: AppColors.surfaceWhite,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.borderGrey, width: 1.2),
        ),
        padding: const EdgeInsets.all(14),
        child: Image.asset(
          assetPath,
          fit: BoxFit.contain,
          // Trường hợp chưa có file ảnh thực tế, bạn có thể tạm thay thế bằng:
          // errorBuilder: (context, error, stackTrace) => Icon(Icons.g_mobiledata, size: 28),
        ),
      ),
    );
  }
}