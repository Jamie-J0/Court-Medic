import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';
import 'common_injuries_screen.dart';
import 'preparation_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.headerPink,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Pink header
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hello!', style: AppTextStyles.title(context)),
                  Text('[Your name]', style: AppTextStyles.title(context)),
                  const SizedBox(height: 10),
                  Text("How's your day going?", style: AppTextStyles.body(context)),
                ],
              ),
            ),
            // White rounded content area
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SearchField(),
                      const SizedBox(height: 28),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _MenuShortcut(
                            label: 'Common injuries',
                            icon: Icons.medical_services_outlined,
                            color: const Color(0xFFF3E6BE),
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => const CommonInjuriesScreen()),
                            ),
                          ),
                          _MenuShortcut(
                            label: 'Preparation',
                            icon: Icons.medical_information_outlined,
                            color: const Color(0xFFF3E6BE),
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => const PreparationScreen()),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 28),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Updates', style: AppTextStyles.heading(context)),
                          TextButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('No more updates yet — this is a demo build.')),
                              );
                            },
                            child: Text('See all', style: AppTextStyles.label(context).copyWith(color: AppColors.primaryBlue)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.cardBorder),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('[From dev]', style: AppTextStyles.label(context)),
                            const SizedBox(height: 18),
                            Text('[Dates]', style: AppTextStyles.small(context)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuShortcut extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _MenuShortcut({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(40),
      child: Column(
        children: [
          CircleAvatar(
            radius: 34,
            backgroundColor: color,
            child: Icon(icon, color: AppColors.textDark.withOpacity(0.7), size: 30),
          ),
          const SizedBox(height: 10),
          Text(label, style: AppTextStyles.label(context)),
        ],
      ),
    );
  }
}
