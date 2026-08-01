import 'dart:async';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Container that mimics the light-grey rounded "illustration box" seen
/// under every injury's About text in the wireframes.
class IllustrationBox extends StatelessWidget {
  final Widget child;
  final double minHeight;

  const IllustrationBox({super.key, required this.child, this.minHeight = 260});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: minHeight),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}

/// --- Skin wound: a simple interactive first-aid checklist -----------------
class SkinWoundCare extends StatefulWidget {
  const SkinWoundCare({super.key});

  @override
  State<SkinWoundCare> createState() => _SkinWoundCareState();
}

class _SkinWoundCareState extends State<SkinWoundCare> {
  final _steps = [
    'Wash your hands before touching the wound',
    'Rinse the wound gently with clean water',
    'Apply antiseptic and cover with a bandage',
    'Change the bandage daily until healed',
  ];
  late final List<bool> _done = List.filled(_steps.length, false);

  @override
  Widget build(BuildContext context) {
    return IllustrationBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Care checklist', style: AppTextStyles.label(context).copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          for (int i = 0; i < _steps.length; i++)
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              value: _done[i],
              activeColor: AppColors.primaryGreen,
              title: Text(
                _steps[i],
                style: AppTextStyles.body(context).copyWith(
                  decoration: _done[i] ? TextDecoration.lineThrough : null,
                ),
              ),
              onChanged: (v) => setState(() => _done[i] = v ?? false),
            ),
        ],
      ),
    );
  }
}

/// --- Bruise: a draggable severity slider -----------------------------------
class BruiseSeveritySlider extends StatefulWidget {
  const BruiseSeveritySlider({super.key});

  @override
  State<BruiseSeveritySlider> createState() => _BruiseSeveritySliderState();
}

class _BruiseSeveritySliderState extends State<BruiseSeveritySlider> {
  double _severity = 3; // 0-10 scale

  String get _label {
    if (_severity <= 3) return 'Mild — rest and monitor';
    if (_severity <= 6) return 'Moderate — ice for 15-20 min';
    return 'Severe — consider seeing a doctor';
  }

  @override
  Widget build(BuildContext context) {
    return IllustrationBox(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Simple "boomerang" shaped bruise illustration.
                    CustomPaint(
                      size: const Size(160, 110),
                      painter: _BoomerangPainter(intensity: _severity / 10),
                    ),
                  ],
                ),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: SizedBox(
                  width: 160,
                  child: Slider(
                    value: _severity,
                    min: 0,
                    max: 10,
                    divisions: 10,
                    activeColor: AppColors.primaryGreenDark,
                    label: _severity.round().toString(),
                    onChanged: (v) => setState(() => _severity = v),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text('Drag the slider to match how it feels', style: AppTextStyles.small(context)),
          const SizedBox(height: 4),
          Text(_label, style: AppTextStyles.label(context).copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class _BoomerangPainter extends CustomPainter {
  final double intensity; // 0..1, darker/purple as it increases

  _BoomerangPainter({required this.intensity});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.lerp(const Color(0xFFE7B9BE), const Color(0xFF3B1F3A), intensity)!
      ..strokeWidth = 18
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height * 0.35);
    final path = Path()
      ..moveTo(center.dx - 60, center.dy + 40)
      ..lineTo(center.dx, center.dy)
      ..lineTo(center.dx + 60, center.dy + 40);
    canvas.drawPath(path, paint);

    final dotPaint = Paint()..color = Color.lerp(const Color(0xFFB5747E), const Color(0xFF1D0F1C), intensity)!;
    canvas.drawCircle(center, 14, dotPaint);
  }

  @override
  bool shouldRepaint(covariant _BoomerangPainter oldDelegate) => oldDelegate.intensity != intensity;
}

/// --- Cramp: stretch option picker + hold timer -----------------------------
class CrampStretchCard extends StatefulWidget {
  const CrampStretchCard({super.key});

  @override
  State<CrampStretchCard> createState() => _CrampStretchCardState();
}

class _CrampStretchCardState extends State<CrampStretchCard> {
  int _selected = 0; // 0 = wall stretch, 1 = towel stretch
  static const int _holdSeconds = 20;
  int _remaining = _holdSeconds;
  Timer? _timer;
  bool get _running => _timer != null;

  void _toggleTimer() {
    if (_running) {
      _timer?.cancel();
      setState(() => _timer = null);
      return;
    }
    setState(() => _remaining = _holdSeconds);
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        if (_remaining <= 1) {
          _remaining = 0;
          t.cancel();
          _timer = null;
        } else {
          _remaining--;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IllustrationBox(
      minHeight: 300,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFD7ECFB),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'TREATMENT 1: STRETCHING',
              style: AppTextStyles.small(context).copyWith(
                color: const Color(0xFF2C6FA8),
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Stretch Gently & Hold 20-30 Seconds',
            textAlign: TextAlign.center,
            style: AppTextStyles.heading(context).copyWith(fontSize: 18),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _StretchOption(
                  label: 'Option A: Wall Stretch',
                  hint: 'Lean forward, keep back heel flat',
                  icon: Icons.accessibility_new,
                  selected: _selected == 0,
                  onTap: () => setState(() => _selected = 0),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StretchOption(
                  label: 'Option B: Towel Stretch',
                  hint: 'Pull towel toward you while leg is straight',
                  icon: Icons.self_improvement,
                  selected: _selected == 1,
                  onTap: () => setState(() => _selected = 1),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          GestureDetector(
            onTap: _toggleTimer,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                color: _running ? const Color(0xFFBFF0D6) : const Color(0xFFD8F7E4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                _running ? 'Holding: ${_remaining}s (tap to stop)' : 'Hold stretch for: ${_holdSeconds}s (tap to start)',
                style: AppTextStyles.small(context).copyWith(
                  color: const Color(0xFF1E7A4A),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StretchOption extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _StretchOption({
    required this.label,
    required this.hint,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected ? AppColors.primaryBlue : AppColors.cardBorder,
            width: selected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Icon(icon, color: selected ? AppColors.primaryBlue : AppColors.textGrey),
            const SizedBox(height: 8),
            Text(label, textAlign: TextAlign.center, style: AppTextStyles.small(context).copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(hint, textAlign: TextAlign.center, style: AppTextStyles.small(context)),
          ],
        ),
      ),
    );
  }
}

/// --- Torn toenail: simple nail illustration + care steps -------------------
class TornToenailCare extends StatefulWidget {
  const TornToenailCare({super.key});

  @override
  State<TornToenailCare> createState() => _TornToenailCareState();
}

class _TornToenailCareState extends State<TornToenailCare> {
  int _step = 0;
  final _steps = [
    'Clean the toe gently with water',
    'Trim any loose nail edge carefully',
    'Apply antiseptic and a soft bandage',
    'Wear open or roomy shoes until it heals',
  ];

  @override
  Widget build(BuildContext context) {
    return IllustrationBox(
      child: Column(
        children: [
          CustomPaint(
            size: const Size(120, 130),
            painter: _NailPainter(),
          ),
          const SizedBox(height: 16),
          Text('Step ${_step + 1} of ${_steps.length}', style: AppTextStyles.small(context)),
          const SizedBox(height: 6),
          Text(
            _steps[_step],
            textAlign: TextAlign.center,
            style: AppTextStyles.label(context).copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: _step == 0 ? null : () => setState(() => _step--),
                child: const Text('Back'),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryGreen, foregroundColor: Colors.white),
                onPressed: _step == _steps.length - 1 ? null : () => setState(() => _step++),
                child: const Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NailPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final toe = Paint()..color = const Color(0xFFF7C8A8);
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(0, 20, size.width, size.height - 20), const Radius.circular(50)),
      toe,
    );
    final nailBed = Paint()..color = const Color(0xFFEED9CE);
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(size.width * 0.25, size.height * 0.28, size.width * 0.5, size.height * 0.4), const Radius.circular(18)),
      nailBed,
    );
    final nail = Paint()..color = Colors.white;
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(size.width * 0.28, size.height * 0.3, size.width * 0.3, size.height * 0.32), const Radius.circular(14)),
      nail,
    );
  }

  @override
  bool shouldRepaint(covariant _NailPainter oldDelegate) => false;
}
