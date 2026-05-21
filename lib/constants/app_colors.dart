import 'package:flutter/material.dart';

class AppColors {
  // --- Màu chủ đạo (Primary Colors) ---
  static const Color primaryBlue = Color(0xFF3B72DE); // Màu xanh dương của các nút chính (Login, Sign Up, Sign In)
  static const Color primaryGreen = Color(0xFF2DC84D); // Màu xanh lá của logo Court Medic và các icon cài đặt
  
  // --- Màu nền & Bề mặt (Background & Surface) ---
  static const Color bgHomePink = Color(0xFFFFE3E8); // Màu hồng nền phía trên của màn hình Home
  static const Color surfaceWhite = Color(0xFFFFFFFF); // Màu trắng nền chính của app và các thẻ card
  static const Color cardGreyBg = Color(0xFFF1F3F6); // Màu nền xám nhạt bo góc của phần chi tiết chấn thương (About)
  
  // --- Màu văn bản & Nhãn (Text & Labels) ---
  static const Color textBlack = Color(0xFF1A1A1A); // Màu đen của tiêu đề và nội dung chính
  static const Color textGrey = Color(0xFF8A8A8F); // Màu xám của placeholder (Search..., [Dates]) và text phụ
  static const Color textLinkBlue = Color(0xFF2F80ED); // Màu xanh dương của link "Forgot password?", "Sign up", "See all"
  
  // --- Màu trạng thái & Đánh giá (Status & Rating) ---
  static const Color ratingGreen = Color(0xFF00E676); // Màu xanh lá sáng của các ngôi sao và điểm số đánh giá (2.0, 3.0...)
  static const Color borderGrey = Color(0xFFE5E5EA); // Màu viền xám nhẹ của các ô Input và các ô sản phẩm
}