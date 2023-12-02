import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  final Widget icon;
  final String label;
  final String data;

  const InfoItem({
    super.key,
    required this.icon,
    required this.label,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 40.0, child: icon),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(data),
        ])
      ],
    );
  }
}
