import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/main.dart';
import 'package:sustainable_world/models/ModelProvider.dart';
import 'package:sustainable_world/ui/views/home_statistics/home_statistics_view_model.dart';
import 'package:sustainable_world/ui/views/home_statistics/widgets/home_statistics_header.dart';
import 'package:sustainable_world/ui/views/home_statistics/widgets/statistics_dougnut_chart.dart';

class HomeStatisticsView extends ConsumerWidget {
  const HomeStatisticsView({required this.onPressedViewMore, Key? key})
      : super(key: key);

  final void Function()? onPressedViewMore;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var model = ref.watch(homeStatisticsViewModelProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HomeStatisticsHeader(
          weightStats: mRole == UserType.RECYCLER
              ? model.recyclerSum
              : model.disposerSum,
        ),
        const SizedBox(height: 10),
        HomeStatisticsDonoughtChart(
            disposerStatistics: mRole == UserType.RECYCLER ? [] : []),
      ],
    );
  }
}
