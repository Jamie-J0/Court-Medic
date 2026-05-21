import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  // Tên font chữ mặc định được đồng bộ từ AppTextStyles
  static const String _fontFamily = AppTextStyles.fontFamily;

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primaryBlue,
      scaffoldBackgroundColor: AppColors.surfaceWhite,
      fontFamily: _fontFamily, // Áp dụng font viết tay cho toàn bộ ứng dụng

      // --- Cấu hình AppBar (Thanh tiêu đề phía trên) ---
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surfaceWhite,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.textBlack),
        titleTextStyle: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.textBlack,
        ),
      ),

      // --- Cấu hình ElevatedButton (Các nút như Login, Sign Up, Sign In) ---
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue,
          foregroundColor: AppColors.surfaceWhite,
          minimumSize: const Size(double.infinity, 50), // Chiều cao nút chuẩn theo design
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25), // Bo tròn góc mạnh theo hình dáng nút bấm của app
          ),
          textStyle: AppTextStyles.buttonTextWhite,
          elevation: 0,
        ),
      ),

      // --- Cấu hình OutlinedButton (Nút Sign Up viền xanh ở màn hình đầu tiên) ---
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryBlue,
          side: const BorderSide(color: AppColors.primaryBlue, width: 1.5),
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          textStyle: AppTextStyles.buttonTextBlue,
        ),
      ),

      // --- Cấu hình Ô nhập liệu (Input/TextField) ---
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceWhite,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        hintStyle: AppTextStyles.inputPlaceholder,
        // Viền khi ở trạng thái bình thường
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColors.borderGrey, width: 1),
        ),
        // Viền khi nhấn chọn vào ô
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColors.primaryBlue, width: 1.5),
        ),
      ),

      // --- Cấu hình Thanh điều hướng bên dưới (Bottom Navigation Bar) ---
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.surfaceWhite,
        selectedItemColor: AppColors.primaryBlue, // Màu xanh dương khi được chọn (như icon Home/Profile trong hình)
        unselectedItemColor: AppColors.textGrey,
        selectedLabelStyle: TextStyle(fontFamily: _fontFamily, fontSize: 12, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontFamily: _fontFamily, fontSize: 12),
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),

      // --- Cấu hình Thẻ hiển thị (Card - như danh sách Common Injuries) ---
      cardTheme: CardTheme(
        color: AppColors.surfaceWhite,
        elevation: 2,
        shadowColor: AppColors.textGrey.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Độ bo góc xấp xỉ của các ô chấn thương
          side: const BorderSide(color: AppColors.borderGrey, width: 0.5), // Viền xám rất mảnh
        ),
      ),
    );
  }
}