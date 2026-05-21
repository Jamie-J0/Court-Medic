import 'package:flutter/material.dart';
import 'package:Court_Medic/constants/app_colors.dart';
import 'package:Court_Medic/constants/app_text_styles.dart';
import 'package:Court_Medic/constants/app_assets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceWhite,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Phần Header màu hồng phía trên ---
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.bgHomePink,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(24, 64, 24, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Hello,', style: AppTextStyles.homeHeaderHello),
                  const Text('John Doe', style: AppTextStyles.homeHeaderName),
                  const SizedBox(height: 8),
                  const Text(
                    'Find your injury or preparation tips below',
                    style: AppTextStyles.homeSubHeader,
                  ),
                  const SizedBox(height: 24),
                  // Ô Tìm kiếm (Search Bar)
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: const Icon(Icons.search, color: AppColors.textGrey),
                      fillColor: AppColors.surfaceWhite,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: AppColors.primaryBlue),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // --- Phần Thân dưới chứa các Categories ---
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Categories', style: AppTextStyles.sectionTitle),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Nút Danh mục Chấn thương
                      _buildCategoryItem(
                        context,
                        title: 'Common Injuries',
                        iconAsset: AppAssets.icCategoryInjuries,
                        onTap: () {
                          // Điều hướng sang màn hình Common Injuries
                        },
                      ),
                      // Nút Danh mục Chuẩn bị dụng cụ
                      _buildCategoryItem(
                        context,
                        title: 'Preparation',
                        iconAsset: AppAssets.icCategoryPreparation,
                        onTap: () {
                          // Điều hướng sang màn hình Preparation
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(
    BuildContext context, {
    required String title,
    required String iconAsset,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          // Vòng tròn chứa Icon lớn
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: AppColors.cardGreyBg,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.borderGrey, width: 1),
            ),
            padding: const EdgeInsets.all(18),
            child: Image.asset(iconAsset, fit: BoxFit.contain),
          ),
          const SizedBox(height: 10),
          // Nhãn văn bản
          Text(
            title,
            style: const TextStyle(
              fontFamily: AppTextStyles.fontFamily,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.textBlack,
            ),
          ),
        ],
      ),
    );
  }
}