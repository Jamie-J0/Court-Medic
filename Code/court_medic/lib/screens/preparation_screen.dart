import 'package:flutter/material.dart';
import '../models/product.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';

class PreparationScreen extends StatefulWidget {
  const PreparationScreen({super.key});

  @override
  State<PreparationScreen> createState() => _PreparationScreenState();
}

class _PreparationScreenState extends State<PreparationScreen> {
  String _query = '';
  bool _showAll = false;

  @override
  Widget build(BuildContext context) {
    final filtered = demoProducts
        .where((p) => p.name.toLowerCase().contains(_query.toLowerCase()))
        .toList();
    final visible = _showAll ? filtered : filtered.take(4).toList();

    return Scaffold(
      appBar: handDrawnAppBar(context, 'Preparation'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SearchField(
            hint: 'Search ...',
            onChanged: (v) => setState(() => _query = v),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFEAF1FE),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text('Always bring these', style: AppTextStyles.heading(context)),
                ),
                const Icon(Icons.medical_services, size: 48, color: Color(0xFFE0524B)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Popular Product', style: AppTextStyles.heading(context)),
              TextButton(
                onPressed: () => setState(() => _showAll = !_showAll),
                child: Text(
                  _showAll ? 'Show less' : 'See all',
                  style: AppTextStyles.label(context).copyWith(color: AppColors.primaryBlue),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: visible.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
              childAspectRatio: 0.95,
            ),
            itemBuilder: (context, index) {
              final product = visible[index];
              return _ProductCard(product: product);
            },
          ),
          if (filtered.isEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Center(child: Text('No products found', style: AppTextStyles.body(context))),
            ),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;

  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (ctx) => Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(radius: 28, backgroundColor: product.color, child: Icon(product.icon, color: Colors.white)),
              const SizedBox(height: 16),
              Text(product.name, style: AppTextStyles.heading(context)),
              const SizedBox(height: 8),
              Text(product.description, style: AppTextStyles.body(context)),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.cardBorder),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 30, backgroundColor: product.color, child: Icon(product.icon, color: Colors.white)),
            const SizedBox(height: 12),
            Text(product.name, textAlign: TextAlign.center, style: AppTextStyles.label(context)),
          ],
        ),
      ),
    );
  }
}
