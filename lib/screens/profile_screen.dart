import 'package:flutter/material.dart';
import 'package:Court_Medic/constants/app_colors.dart';
import 'package:Court_Medic/constants/app_text_styles.dart';
import 'package:Court_Medic/constants/app_assets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tên Tài khoản kích thước siêu lớn ở góc trái trên cùng
              const Text('John Doe', style: AppTextStyles.profileName),
              const SizedBox(height: 40),

              // Danh sách các Menu Setting
              _buildSettingMenuItem(
                label: 'Account Setting',
                icon: Icons.person_outline,
                onTap: () {},
              ),
              _buildSettingMenuItem(
                label: 'History',
                icon: Icons.history,
                onTap: () {},
              ),
              _buildSettingMenuItem(
                label: 'Notification',
                icon: Icons.notifications_none,
                onTap: () {},
              ),
              _buildSettingMenuItem(
                label: 'Log out',
                icon: Icons.logout,
                isLogout: true,
                onTap: () {
                  // Xử lý logic đăng xuất và quay về WelcomeScreen
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingMenuItem({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
          child: Row(
            children: [
              // Khung tròn nhỏ chứa icon màu thương hiệu (Xanh lá / Xanh dương)
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: isLogout 
                      ? AppColors.primaryGreen.withOpacity(0.1) 
                      : AppColors.primaryBlue.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: isLogout ? AppColors.primaryGreen : AppColors.primaryBlue,
                  size: 22,
                ),
              ),
              const SizedBox(width: 20),
              // Nhãn Menu chữ đậm phong cách comic
              Expanded(
                child: Text(
                  label,
                  style: AppTextStyles.settingMenuLabel,
                ),
              ),
              // Mũi tên chỉ hướng sang phải (Không hiện ở nút Log out)
              if (!isLogout)
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppColors.textGrey,
                ),
            ],
          ),
        ),
      ),
    );
  }
}