import 'package:adnems/app/global/widgets/sale_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ConveyanceMonthlyChart extends StatelessWidget {
  const ConveyanceMonthlyChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ConveyanceData> data = [
      ConveyanceData("April'21", 2462),
      ConveyanceData("May'21", 4682),
      ConveyanceData("June'21", 9582),
      ConveyanceData("July'21", 10587),
      ConveyanceData("August'21", 2589),
      ConveyanceData("September'21", 13058),
    ];
    return SfCartesianChart(
      primaryYAxis: NumericAxis(
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        numberFormat: NumberFormat.simpleCurrency(
          name: 'BDT',
          decimalDigits: 0,
        ),
      ),
      primaryXAxis: CategoryAxis(),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <ChartSeries<ConveyanceData, String>>[
        LineSeries<ConveyanceData, String>(
          name: 'Monthly Conveyance',
          dataSource: data,
          xValueMapper: (ConveyanceData sales, _) => sales.month,
          yValueMapper: (ConveyanceData sales, _) => sales.totalConveyance,
        ),
      ],
    );
  }
}
