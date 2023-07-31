import 'package:flutter/material.dart';

class Statistic extends StatelessWidget {
  const Statistic({required this.label, required this.value, Key? key}) : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(
          height: 4,
        ),
        Text(value, style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}
