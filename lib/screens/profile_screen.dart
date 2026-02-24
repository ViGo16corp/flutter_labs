import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isTablet = width >= 700.0;
    final maxWidth = isTablet ? 560.0 : 420.0;

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: isTablet ? 28.0 : 18.0,
                vertical: isTablet ? 22.0 : 14.0,
              ),
              children: [
                Text('Vika', style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(height: 6),
                Text(
                  'Smart Plant Care user',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.black54),
                ),
                const SizedBox(height: 16),
                _Card(
                  child: Row(
                    children: const [
                      CircleAvatar(
                        radius: 22,
                        child: Icon(Icons.person_outline),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Email: you@example.com\nPlan: Free',
                          style: TextStyle(height: 1.4),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'Settings (UI only)',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 10),
                _Card(
                  child: Column(
                    children: const [
                      ListTile(
                        leading: Icon(Icons.notifications_outlined),
                        title: Text('Reminders'),
                        subtitle: Text('Coming in next labs'),
                      ),
                      Divider(height: 1),
                      ListTile(
                        leading: Icon(Icons.palette_outlined),
                        title: Text('Theme'),
                        subtitle: Text('Light / Dark (later)'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFD7E2D8)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Padding(padding: const EdgeInsets.all(14), child: child),
    );
  }
}
