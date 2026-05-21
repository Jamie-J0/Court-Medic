import 'package:flutter/material.dart';
import 'package:Court_Medic/constants/app_colors.dart';
import 'package:Court_Medic/constants/app_text_styles.dart';

class LoadingWidget extends StatelessWidget {
  final String? message;
  final bool isOverlay;

  const LoadingWidget({
    super.key,
    this.message,
    this.isOverlay = false,
  });

  @override
  Widget build(BuildContext context) {
    final loadingContent = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Vòng xoay tiến trình sử dụng màu thương hiệu của app
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryBlue),
            strokeWidth: 4.0,
          ),
          if (message != null) ...[
            const SizedBox(height: 16),
            Text(
              message!,
              style: const TextStyle(
                fontFamily: AppTextStyles.fontFamily,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.textBlack,
              ),
            ),
          ],
        ],
      ),
    );

    // Nếu dùng làm màn hình phủ chặn tương tác khi đang xử lý (ví dụ bấm Login đợi server)
    if (isOverlay) {
      return Container(
        color: AppColors.textBlack.withOpacity(0.3), // Làm tối nền nhẹ bên dưới
        child: loadingContent,
      );
    }

    // Trả về widget loading thông thường để lồng vào thân các trang danh sách
    return loadingContent;
  }
}