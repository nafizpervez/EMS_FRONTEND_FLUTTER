import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/modules/overview/overview_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class _SalesData {
  _SalesData(this.xval, this.yval);

  final String xval;
  final double yval;
}

class FunnelInfoChart extends StatefulWidget {
  const FunnelInfoChart({
    Key? key,
  }) : super(key: key);

  @override
  State<FunnelInfoChart> createState() => _FunnelInfoChartState();
}

class _FunnelInfoChartState extends State<FunnelInfoChart> {
  late final _tooltipB;

  @override
  void initState() {
    super.initState();
    _tooltipB = TooltipBehavior(
      enable: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetX<OverviewController>(
      builder: (oveController) => oveController.funnelLoaded.value
          ? SfCartesianChart(
              tooltipBehavior: _tooltipB,
              series: [
                BarSeries<_SalesData, String>(
                  name: 'Project Value',
                  sortingOrder: SortingOrder.descending,
                  dataLabelMapper: (_SalesData fi, _) => fi.xval,
                  dataSource: oveController.funnelInfos.map(
                    (element) {
                      return _SalesData(
                        element.id + ' - ' + element.projectName,
                        element.valueOfTheProject.toDouble(),
                      );
                    },
                  ).toList(),
                  xValueMapper: (_SalesData fi, _) => fi.xval,
                  yValueMapper: (_SalesData fi, _) => fi.yval,
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: false,
                  ),
                  enableTooltip: true,
                ),
              ],
              primaryXAxis: CategoryAxis(
                  // labelRotation: -90,
                  ),
              primaryYAxis: NumericAxis(
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                numberFormat: NumberFormat.simpleCurrency(
                  name: 'BDT',
                  decimalDigits: 0,
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(
                color: ADNColorConstants.kADNLightGreen,
              ),
            ),
    );
  }
}
