import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/global/widgets/chart_data.dart';
import 'package:adnems/app/modules/overview/overview_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class EmployeePresenceChart extends StatefulWidget {
  const EmployeePresenceChart({
    Key? key,
  }) : super(key: key);

  @override
  State<EmployeePresenceChart> createState() => _EmployeePresenceChartState();
}

class _EmployeePresenceChartState extends State<EmployeePresenceChart> {
  @override
  Widget build(BuildContext context) {
    return GetX<OverviewController>(
      builder: (oveController) => oveController.leaveLoaded.value
          ? SfCircularChart(
              legend: Legend(
                isVisible: true,
                position: LegendPosition.bottom,
              ),
              series: <CircularSeries>[
                PieSeries<ChartData, String>(
                  dataSource: oveController.leaveInfos,
                  pointColorMapper: (ChartData data, _) => data.color,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                    labelPosition: ChartDataLabelPosition.outside,
                    textStyle: TextStyle(color: Colors.black),
                    labelIntersectAction: LabelIntersectAction.shift,
                  ),
                  enableTooltip: true,
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(
                color: ADNColorConstants.kADNLightGreen,
              ),
            ),
    );
  }
}
