import 'package:flutter/material.dart';
import 'package:my_project/routes/app_routes.dart';
import 'package:my_project/widgets/plant_card.dart';
import 'package:my_project/widgets/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isTablet = width >= 700;
    final padding = isTablet ? 28.0 : 18.0;

    final plants = const <PlantCardData>[
      PlantCardData(
        name: 'Monstera',
        room: 'Living room',
        waterStatus: WaterStatus.ok,
        light: 'Bright indirect',
        nextWater: '2 days',
      ),
      PlantCardData(
        name: 'Snake Plant',
        room: 'Bedroom',
        waterStatus: WaterStatus.late,
        light: 'Low light',
        nextWater: 'Today',
      ),
      PlantCardData(
        name: 'Aloe Vera',
        room: 'Kitchen',
        waterStatus: WaterStatus.ok,
        light: 'Sunny spot',
        nextWater: '5 days',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Plant Care'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.profile),
            icon: const Icon(Icons.person_outline),
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(padding),
          children: [
            const SectionTitle(
              title: 'Your plants 🌿',
              subtitle: 'Simple care cards. No extra logic yet.',
            ),
            const SizedBox(height: 16),
            _QuickStatsRow(isTablet: isTablet),
            const SizedBox(height: 18),
            Text('Plants', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: plants.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isTablet ? 2 : 1,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: isTablet ? 2.2 : 2.5,
              ),
              itemBuilder: (context, i) {
                return PlantCard(data: plants[i]);
              },
            ),
            const SizedBox(height: 14),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Add plant (UI only)'),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickStatsRow extends StatelessWidget {
  const _QuickStatsRow({required this.isTablet});

  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    final gap = isTablet ? 14.0 : 10.0;

    return Row(
      children: [
        Expanded(
          child: _StatCard(
            title: 'Water',
            value: '1 due',
            icon: Icons.water_drop_outlined,
          ),
        ),
        SizedBox(width: gap),
        Expanded(
          child: _StatCard(
            title: 'Light',
            value: '2 ok',
            icon: Icons.wb_sunny_outlined,
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _softCardDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: 2),
                Text(value, style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

BoxDecoration _softCardDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: const Color(0xFFD7E2D8)),
    boxShadow: const [
      BoxShadow(color: Color(0x14000000), blurRadius: 18, offset: Offset(0, 8)),
    ],
  );
}
