import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: [0.1, 0.5, 0.9],
          colors: [Color(0xFF0A171D), Color(0xFF0A171D), Color(0xFF1E4045)],
        ),
      ),
      child: child,
    );
  }
}
