import 'package:flutter/material.dart';

enum WaterStatus { ok, late }

class PlantCardData {
  const PlantCardData({
    required this.name,
    required this.room,
    required this.waterStatus,
    required this.light,
    required this.nextWater,
  });

  final String name;
  final String room;
  final WaterStatus waterStatus;
  final String light;
  final String nextWater;
}

class PlantCard extends StatelessWidget {
  const PlantCard({required this.data, super.key});

  final PlantCardData data;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _decoration(),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            _PlantAvatar(letter: data.name.characters.first),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 2),
                  Text(data.room, style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _StatusChip(
                        status: data.waterStatus,
                        text: data.nextWater,
                      ),
                      _InfoChip(
                        icon: Icons.wb_sunny_outlined,
                        text: data.light,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}

class _PlantAvatar extends StatelessWidget {
  const _PlantAvatar({required this.letter});

  final String letter;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFFEAF4EA),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFD7E2D8)),
      ),
      child: SizedBox(
        width: 52,
        height: 52,
        child: Center(
          child: Text(
            letter.toUpperCase(),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status, required this.text});

  final WaterStatus status;
  final String text;

  @override
  Widget build(BuildContext context) {
    final isLate = status == WaterStatus.late;

    final bg = isLate ? const Color(0xFFFFF1F1) : const Color(0xFFEAF7EA);
    final fg = isLate ? const Color(0xFFB42318) : const Color(0xFF1B5E20);
    final label = isLate ? 'Water • Due' : 'Water • OK';

    return _Pill(
      background: bg,
      foreground: fg,
      icon: Icons.water_drop_outlined,
      text: '$label ($text)',
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return _Pill(
      background: const Color(0xFFF3F6F3),
      foreground: const Color(0xFF2D3A30),
      icon: icon,
      text: text,
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({
    required this.background,
    required this.foreground,
    required this.icon,
    required this.text,
  });

  final Color background;
  final Color foreground;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0xFFD7E2D8)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: foreground),
            const SizedBox(width: 6),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: foreground,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

BoxDecoration _decoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: const Color(0xFFD7E2D8)),
    boxShadow: const [
      BoxShadow(color: Color(0x14000000), blurRadius: 18, offset: Offset(0, 8)),
    ],
  );
}
