import 'package:flutter/material.dart';
import 'app_colors.dart'; // Import file màu bạn đã tạo ở bước trước

class AppTextStyles {
  // --- Tên Font mặc định của App (Cấu hình trong pubspec.yaml) ---
  static const String fontFamily = 'HandwrittenFont'; 

  // --- Màn hình Login / Sign In / Sign Up ---
  static const TextStyle appTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textBlack,
  );

  static const TextStyle buttonTextWhite = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.surfaceWhite,
  );

  static const TextStyle buttonTextBlue = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryBlue,
  );

  static const TextStyle inputPlaceholder = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    color: AppColors.textGrey,
  );

  static const TextStyle linkBlue = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.textLinkBlue,
  );

  // --- Màn hình Home (Chào hỏi & Đón tiếp) ---
  static const TextStyle homeHeaderHello = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.normal,
    color: AppColors.textBlack,
  );

  static const TextStyle homeHeaderName = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textBlack,
  );

  static const TextStyle homeSubHeader = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    color: AppColors.textGrey,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textBlack,
  );

  // --- Màn hình Danh sách & Chi tiết chấn thương ---
  static const TextStyle itemTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.textBlack,
  );

  static const TextStyle ratingText = TextStyle(
    fontFamily: fontFamily,
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.ratingGreen,
  );

  static const TextStyle detailAboutHeading = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textBlack,
  );

  static const TextStyle detailBodyText = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 1.4, // Tạo độ giãn dòng nhẹ cho dễ đọc đoạn văn dài
    color: AppColors.textGrey,
  );

  // --- Màn hình Thiết lập (Setting) ---
  static const TextStyle profileName = TextStyle(
    fontFamily: fontFamily,
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: AppColors.textBlack,
  );

  static const TextStyle settingMenuLabel = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textBlack,
  );
}