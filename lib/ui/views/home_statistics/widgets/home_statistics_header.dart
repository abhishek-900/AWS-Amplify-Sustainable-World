import 'package:flutter/material.dart';

class HomeStatisticsHeader extends StatelessWidget {
  const HomeStatisticsHeader({required this.weightStats, Key? key})
      : super(key: key);

  final double weightStats;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("You have disposed $weightStats Kg of waste"));
  }
}
