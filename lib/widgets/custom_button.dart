import 'package:flutter/material.dart';
import 'package:Court_Medic/constants/app_colors.dart';
import 'package:Court_Medic/constants/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isOutlined;
  final double height;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutlined = false,
    this.height = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    // Định nghĩa style chung để tối ưu độ bo góc của Court Medic
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0), // Bo góc tròn elip theo đúng design
    );

    return SizedBox(
      width: double.infinity,
      height: height,
      child: isOutlined
          ? OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.primaryBlue, width: 1.5),
                shape: shape,
                foregroundColor: AppColors.primaryBlue,
              ),
              child: Text(
                text,
                style: AppTextStyles.buttonTextBlue,
              ),
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                foregroundColor: AppColors.surfaceWhite,
                shape: shape,
                elevation: 0, // Giao diện phẳng 2D theo phong cách comic
              ),
              child: Text(
                text,
                style: AppTextStyles.buttonTextWhite,
              ),
            ),
    );
  }
}