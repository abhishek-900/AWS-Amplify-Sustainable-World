import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/ui/views/home_statistics/home_statistics_view_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeStatisticsDonoughtChart extends ConsumerWidget {
  final List<dynamic> disposerStatistics;
  const HomeStatisticsDonoughtChart({
    required this.disposerStatistics,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String?> categories = ref
        .watch(homeStatisticsViewModelProvider)
        .productCategory
        .map((e) => e!.title)
        .toList();
    List<double> percentage = [
      10.0,
      17.0,
      0.0,
      23.0,
      0.0,
      60.0,
      0.0,
      16.3,
    ];
    return categories.isNotEmpty
        ? SizedBox(
            height: 300,
            child: SfCircularChart(
              palette: const <Color>[
                Colors.amber,
                Colors.brown,
                Colors.green,
                Colors.redAccent,
                Colors.blueAccent,
                Colors.cyan,
                Colors.deepOrange,
                Colors.deepPurple,
              ],
              legend: Legend(
                alignment: ChartAlignment.center,
                position: LegendPosition.bottom,
                isVisible: true,
                title: LegendTitle(
                  text: "Contribution",
                ),
              ),
              series: [
                PieSeries<double, String>(
                  dataSource: percentage,
                  legendIconType: LegendIconType.triangle,
                  dataLabelSettings: const DataLabelSettings(
                    labelPosition: ChartDataLabelPosition.outside,
                    isVisible: true,
                  ),
                  xValueMapper: (d, _) => categories[_],
                  yValueMapper: (d, _) => d,
                ),
              ],
            ),
          )
        : SizedBox(
            height: 300,
            child: SfCircularChart(
              legend: Legend(
                alignment: ChartAlignment.center,
                position: LegendPosition.bottom,
                isVisible: true,
                title: LegendTitle(
                  text: "Contribution",
                ),
              ),
              palette: const <Color>[
                Colors.amber,
                Colors.brown,
                Colors.green,
                Colors.redAccent,
                Colors.blueAccent,
                Colors.cyan,
                Colors.deepOrange,
                Colors.deepPurple,
              ],
              series: [
                PieSeries<double, String>(
                  dataSource: percentage,
                  legendIconType: LegendIconType.triangle,
                  dataLabelSettings: const DataLabelSettings(
                    labelPosition: ChartDataLabelPosition.outside,
                    isVisible: true,
                  ),
                  xValueMapper: (d, _) => "No Data",
                  yValueMapper: (d, _) => d,
                ),
              ],
            ),
          );
  }
}
