import 'package:flutter/material.dart';
import 'package:Court_Medic/constants/app_colors.dart';
import 'package:Court_Medic/constants/app_text_styles.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool isPassword;
  final TextInputType keyboardType;
  final IconData? prefixIcon;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      style: const TextStyle(
        fontFamily: AppTextStyles.fontFamily,
        color: AppColors.textBlack,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppTextStyles.inputPlaceholder,
        filled: true,
        fillColor: AppColors.surfaceWhite,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        prefixIcon: widget.prefixIcon != null 
            ? Icon(widget.prefixIcon, color: AppColors.textGrey) 
            : null,
        // Nút ẩn/hiện mật khẩu mắt thần
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  color: AppColors.textGrey,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        // Trạng thái viền bình thường
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColors.borderGrey, width: 1.2),
        ),
        // Trạng thái viền khi click vào nhập liệu
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColors.primaryBlue, width: 1.8),
        ),
      ),
    );
  }
}