import 'package:flutter/material.dart';

/// The kind of interactive content shown at the bottom of an injury's
/// detail page. Each one maps to a different widget built in
/// injury_detail_screen.dart.
enum InjuryKind { skinWound, bruise, cramp, tornToenail }

class Injury {
  final String name;
  final double rating;
  final String about;
  final IconData icon;
  final List<Color> iconGradient;
  final InjuryKind kind;

  const Injury({
    required this.name,
    required this.rating,
    required this.about,
    required this.icon,
    required this.iconGradient,
    required this.kind,
  });
}

/// Demo dataset matching the "Common injuries" wireframe.
final List<Injury> demoInjuries = [
  Injury(
    name: 'Skin wound',
    rating: 2.0,
    about:
        'A skin wound is a small injury on the surface of the skin, such as '
        'a cut or a scrape. It usually happens when you fall down or rub '
        'your skin against a rough surface. It may hurt and bleed a '
        'little, but it often heals quickly.',
    icon: Icons.healing,
    iconGradient: const [Color(0xFFF3D9DC), Color(0xFFEBC3C8)],
    kind: InjuryKind.skinWound,
  ),
  Injury(
    name: 'Bruise',
    rating: 1.0,
    about:
        'A bruise happens when you hit your body and the skin turns blue, '
        'purple, or yellow. It can feel sore, but there is usually no open '
        'wound. Bruises are common in many sports and normally go away '
        'after a few days or weeks.',
    icon: Icons.circle,
    iconGradient: const [Color(0xFF8E5A82), Color(0xFF3B1F3A)],
    kind: InjuryKind.bruise,
  ),
  Injury(
    name: 'Cramp',
    rating: 3.0,
    about:
        'A muscle cramp is a sudden pain when a muscle tightens by itself. '
        'It often happens during exercise when your muscles are tired or '
        'when you do not drink enough water. The pain can be strong, but '
        'it usually goes away after a short time.',
    icon: Icons.accessibility_new,
    iconGradient: const [Color(0xFF4A4A4A), Color(0xFF1E1E1E)],
    kind: InjuryKind.cramp,
  ),
  Injury(
    name: 'Torn toenail',
    rating: 2.5,
    about:
        'A torn toenail happens when the toenail is pulled or hit and '
        'starts to come off. It can be very painful and may bleed. This '
        'injury often happens in sports when your toe hits the ground, a '
        'ball, or another player.',
    icon: Icons.front_hand,
    iconGradient: const [Color(0xFFF7C8A8), Color(0xFFEE9B72)],
    kind: InjuryKind.tornToenail,
  ),
];
