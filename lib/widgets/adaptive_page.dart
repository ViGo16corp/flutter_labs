import 'package:flutter/material.dart';

class AdaptivePage extends StatelessWidget {
  const AdaptivePage({
    required this.child,
    super.key,
    this.maxWidthNarrow = 420.0,
    this.maxWidthWide = 520.0,
    this.wideBreakpoint = 600.0,
    this.padding = const EdgeInsets.all(20),
  });

  final Widget child;
  final double maxWidthNarrow;
  final double maxWidthWide;
  final double wideBreakpoint;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isWide = width > wideBreakpoint;
    final maxWidth = isWide ? maxWidthWide : maxWidthNarrow;

    return SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: SingleChildScrollView(padding: padding, child: child),
        ),
      ),
    );
  }
}
