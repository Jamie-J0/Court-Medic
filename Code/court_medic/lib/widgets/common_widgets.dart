import 'package:flutter/material.dart';
import '../models/injury.dart';
import '../theme/app_theme.dart';

/// Small circular/rounded thumbnail used in list tiles when we don't have
/// a real photo asset - draws an icon over a soft gradient instead.
class ThumbIcon extends StatelessWidget {
  final IconData icon;
  final List<Color> gradient;
  final double size;
  final double radius;

  const ThumbIcon({
    super.key,
    required this.icon,
    required this.gradient,
    this.size = 64,
    this.radius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        gradient: LinearGradient(
          colors: gradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Icon(icon, color: Colors.white, size: size * 0.45),
    );
  }
}

/// Green star + numeric rating, matching the wireframes (e.g. "★ 2.0").
class RatingBadge extends StatelessWidget {
  final double rating;
  final double fontSize;

  const RatingBadge({super.key, required this.rating, this.fontSize = 20});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: AppColors.star, size: fontSize + 2),
        const SizedBox(width: 6),
        Text(
          rating.toStringAsFixed(1),
          style: AppTextStyles.label(context).copyWith(
            color: AppColors.star,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}

/// A rounded, bordered search field used on Home and Preparation screens.
class SearchField extends StatelessWidget {
  final String hint;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const SearchField({
    super.key,
    this.hint = 'Search...',
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: AppTextStyles.label(context),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyles.body(context),
        prefixIcon: const Icon(Icons.search, color: AppColors.textGrey),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: AppColors.cardBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: AppColors.primaryBlue),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: AppColors.cardBorder),
        ),
      ),
    );
  }
}

/// A single row in the "Common injuries" list.
class InjuryListTile extends StatelessWidget {
  final Injury injury;
  final VoidCallback onTap;

  const InjuryListTile({super.key, required this.injury, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.cardBorder),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: ThumbIcon(icon: injury.icon, gradient: injury.iconGradient),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(injury.name, style: AppTextStyles.heading(context)),
                  const SizedBox(height: 6),
                  RatingBadge(rating: injury.rating),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: AppColors.textGrey),
          ],
        ),
      ),
    );
  }
}

/// Simple back-chevron app bar matching the hand-drawn style pages.
PreferredSizeWidget handDrawnAppBar(BuildContext context, String title) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.chevron_left, size: 28),
      onPressed: () => Navigator.of(context).maybePop(),
    ),
    title: Text(title),
  );
}
