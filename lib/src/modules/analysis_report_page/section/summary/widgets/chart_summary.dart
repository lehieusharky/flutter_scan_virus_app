import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:virusscanapp/src/data/models/summary_model.dart';
import 'package:virusscanapp/src/theme/color_theme.dart';

class ChartSummaryWidget extends StatelessWidget {
  final List<SummaryModel> listStatus;
  const ChartSummaryWidget({
    super.key,
    required this.listStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.flip(
      flipX: true,
      flipY: true,
      child: Center(
        child: SfCircularChart(
          palette: [ColorTheme.radicalRed],
          series: <CircularSeries>[
            RadialBarSeries<SummaryModel, String>(
              dataSource: listStatus,
              maximumValue: listStatus[0].getTotal * 1.0,
              trackColor: ColorTheme.brightGreen,
              cornerStyle: CornerStyle.bothFlat,
              enableTooltip: true,
              xValueMapper: (SummaryModel data, _) => data.datetime,
              yValueMapper: (SummaryModel data, _) => data.getMalicious,
            )
          ],
        ),
      ),
    );
  }
}
