/// Horizontal bar chart example
import 'package:cryptocurrency_flutter/main.dart';
import 'package:cryptocurrency_flutter/model/coin_chart_model.dart';
import 'package:cryptocurrency_flutter/utils/app_colors.dart';
import 'package:cryptocurrency_flutter/utils/app_common.dart';
import 'package:cryptocurrency_flutter/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// ignore: must_be_immutable
class ChartComponent extends StatelessWidget {
  CoinChartModel coinChart;
  ChartMarketType selectedChartType;
  Color graphColor;

  ChartComponent({required this.coinChart, this.graphColor = secondaryColor, this.selectedChartType = ChartMarketType.PRICES});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      legend: Legend(isVisible: false),
      series: getDefaultData2(),
      selectionType: SelectionType.series,
      trackballBehavior: TrackballBehavior(
        shouldAlwaysShow: true,
        activationMode: ActivationMode.singleTap,
        enable: true,
      ),
      primaryXAxis: CategoryAxis(
        interval: 1,
        axisLine: AxisLine(color: primaryColor),
        isVisible: false,
      ),
      primaryYAxis: NumericAxis(labelStyle: primaryTextStyle(size: 12)),
      enableAxisAnimation: true,
      zoomPanBehavior: ZoomPanBehavior(
        enableMouseWheelZooming: true,
        enablePinching: true,
        zoomMode: ZoomMode.xy,
        enablePanning: true,
        enableSelectionZooming: true,
      ),
      axisLabelFormatter: (axisLabelRenderArgs) {
        return ChartAxisLabel('${appStore.mSelectedCurrency!.symbol.validate()}${axisLabelRenderArgs.text.toInt().amountPrefix}', primaryTextStyle(size: 8));
      },
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  List<ChartSeries> getDefaultData2() {
    List<ChartData> getChartData(ChartMarketType chartMarketType) {
      List<ChartData> chartData = [];

      switch (chartMarketType) {
        case ChartMarketType.PRICES:
          coinChart.prices!.asMap().forEach((key, value) {
            chartData.add(ChartData(value[0].toString().validate(), value[1]));
          });
          break;
        case ChartMarketType.MARKET_CAPS:
          coinChart.marketCaps!.asMap().forEach((key, value) {
            chartData.add(ChartData(value[0].toString().validate(), value[1]));
          });
          break;
        case ChartMarketType.TOTAL_VOLUMES:
          coinChart.totalVolumes!.asMap().forEach((key, value) {
            chartData.add(ChartData(value[0].toString().validate(), value[1]));
          });
          break;
      }

      return chartData;
    }

    return <CartesianSeries>[
      SplineAreaSeries<ChartData, String>(
          dataSource: getChartData(selectedChartType),
          // Type of spline
          enableTooltip: false,
          isVisibleInLegend: false,
          borderWidth: 1.5,
          dataLabelSettings: DataLabelSettings(),
          splineType: SplineType.clamped,
          gradient: LinearGradient(
            colors: <Color>[graphColor.withOpacity(0.2), graphColor.withOpacity(0.2)],
            stops: <double>[0.03, 0.9],
            end: Alignment.topCenter,
            begin: Alignment.bottomCenter,
          ),
          borderColor: graphColor,
          animationDuration: 1000,
          xValueMapper: (ChartData sales, _) => '${sales.key}',
          yValueMapper: (ChartData sales, _) => sales.value,
          legendIconType: LegendIconType.triangle,
          legendItemText: '',
          isVisible: true,
          emptyPointSettings: EmptyPointSettings(mode: EmptyPointMode.average))
    ];
  }
}

class ChartData {
  String? key;
  double? value;

  ChartData(this.key, this.value);
}
