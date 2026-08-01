import 'package:flutter/material.dart';
import '../models/injury.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';
import '../widgets/injury_interactives.dart';

class InjuryDetailScreen extends StatelessWidget {
  final Injury injury;

  const InjuryDetailScreen({super.key, required this.injury});

  Widget _interactive() {
    switch (injury.kind) {
      case InjuryKind.skinWound:
        return const SkinWoundCare();
      case InjuryKind.bruise:
        return const BruiseSeveritySlider();
      case InjuryKind.cramp:
        return const CrampStretchCard();
      case InjuryKind.tornToenail:
        return const TornToenailCare();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: handDrawnAppBar(context, injury.name),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text('About', style: AppTextStyles.heading(context)),
            const SizedBox(height: 8),
            Text(injury.about, style: AppTextStyles.body(context).copyWith(height: 1.5)),
            const SizedBox(height: 20),
            _interactive(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
