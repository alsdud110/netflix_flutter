import 'package:flutter/material.dart';

class LabelIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final TextStyle? style;
  const LabelIcon(
      {super.key, required this.icon, required this.label, this.style});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon),
        const SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: style ?? const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
