import 'package:flutter/material.dart';
import '../models/injury.dart';
import '../widgets/common_widgets.dart';
import 'injury_detail_screen.dart';

class CommonInjuriesScreen extends StatelessWidget {
  const CommonInjuriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: handDrawnAppBar(context, 'Common injuries'),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: demoInjuries.length,
        separatorBuilder: (_, __) => const SizedBox(height: 14),
        itemBuilder: (context, index) {
          final injury = demoInjuries[index];
          return InjuryListTile(
            injury: injury,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => InjuryDetailScreen(injury: injury)),
            ),
          );
        },
      ),
    );
  }
}
