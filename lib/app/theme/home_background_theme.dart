import 'package:flutter/material.dart';

class HomeBackgroundTheme extends StatelessWidget {
  final Widget child;

  const HomeBackgroundTheme({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF09141A),
      child: child,
    );
  }
}
