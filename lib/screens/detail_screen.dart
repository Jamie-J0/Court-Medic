import 'package:flutter/material.dart';
import 'package:Court_Medic/constants/app_colors.dart';
import 'package:Court_Medic/constants/app_text_styles.dart';
import 'package:Court_Medic/constants/app_assets.dart';

class DetailScreen extends StatelessWidget {
  final String title;
  final String imageAsset;
  final String rating;
  final String description;

  const DetailScreen({
    super.key,
    this.title = 'Skin Wound',
    this.imageAsset = AppAssets.imgSkinWound,
    this.rating = '3.0',
    this.description = 'A skin wound is damage to the surface of the skin. Clean the area gently with water and mild soap, then apply an antibacterial ointment and cover with a sterile bandage to prevent infection.',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceWhite,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hình ảnh chấn thương lớn ở trung tâm
            Center(
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(imageAsset, fit: BoxFit.contain),
              ),
            ),
            const SizedBox(height: 24),

            // Phần hiển thị Tiêu đề và Điểm Đánh giá hàng ngang
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: AppTextStyles.itemTitle),
                Row(
                  children: [
                    const Icon(Icons.star, color: AppColors.ratingGreen, size: 26),
                    const SizedBox(width: 4),
                    Text(rating, style: AppTextStyles.ratingText),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Khung nội dung chi tiết (About) màu xám bo góc tròn
            const Text('About', style: AppTextStyles.detailAboutHeading),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.cardGreyBg,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                description,
                style: AppTextStyles.detailBodyText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}