import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/module/progress/components/pie_chart.dart';
import 'package:todo/module/progress/model/progress_model.dart';
import 'package:todo/module/progress/view%20model/progress_view_model.dart';
import 'package:todo/style/theme/app_colors.dart';
import 'package:todo/widgets/text/app_heading.dart';
import 'package:todo/widgets/text/app_text.dart';

class ProgressComponent extends StatelessWidget {
  const ProgressComponent({super.key});
  final double inProgressPercentage = 0.6;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProgressViewModel>(builder: (context, value, _) {
      if (value.progress == null) {
        return Container();
      } else {
        int _len = value.progress?.tasks.length as int;
        int _lenDay = value.progress?.days.length as int;
        var progress = value.progress?.tasks;
        var days = value.progress?.days;

        return Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                BarChart(
                    len: _len, progress: progress, lenDay: _lenDay, days: days),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: const AppHeading('Tasks Overview')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 250.0,
                        width: 150.0,
                        // color: Colors.blue,
                        child: CustomPaint(
                          painter: PieChart(
                              inProgressPercentage: inProgressPercentage),
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Column(
                              children: [
                                _PieChartIndicators(
                                    statusColor: Color(0xFF1F38AB),
                                    status: 'In-Progress'),
                                _PieChartIndicators(
                                    statusColor: Color(0xFF86C3C2),
                                    status: 'Unassigned'),
                              ],
                            ),
                            SizedBox(width: 20.0),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                _PieChartIndicators(
                                    statusColor: Colors.amber.shade500,
                                    status:
                                        '${(inProgressPercentage * 100).toStringAsFixed(1)} %'),
                                _PieChartIndicators(
                                    statusColor: AppColor.cardColor,
                                    status:
                                        '${(1 - inProgressPercentage) * 100} %'),
                              ],
                            ),
                            const SizedBox(width: 20.0),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(),
                ),
              ],
            ),
          ),
        );
      }
    });
  }
}

class _PieChartIndicators extends StatelessWidget {
  final Color statusColor;
  final String status;
  const _PieChartIndicators({required this.statusColor, required this.status});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          color: statusColor,
          height: 20.0,
          width: 20.0,
          margin: const EdgeInsets.symmetric(vertical: 12.0),
        ),
        const SizedBox(width: 14.0),
        AppText(status)
      ],
    );
  }
}

class BarChart extends StatelessWidget {
  const BarChart({
    super.key,
    required int len,
    required this.progress,
    required int lenDay,
    required this.days,
  })  : _len = len,
        _lenDay = lenDay;

  final int _len;
  final List<ProgressTasks>? progress;
  final int _lenDay;
  final List<ProgressDay>? days;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const Padding(padding: EdgeInsets.all(8.0), child: Divider()),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 8.0),
                    child: const AppText(
                      'Task Completed',
                    )),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 8.0),
                    child: const AppHeading(
                      '20',
                    )),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 8.0),
                    child: const AppText(
                      'Task Pending',
                    )),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 8.0),
                    child: const AppHeading('5')),
              ],
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.all(8.0), child: Divider()),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              children: List.generate(
                  _len,
                  (i) => Container(
                        margin: const EdgeInsets.only(
                            left: 14.0, right: 14.0, bottom: 32.0),
                        child: AppText('${progress?[i].amount.toString()}'),
                      )).reversed.toList(),
            ),
            for (int j = 0; j < _lenDay; j++)
              Column(
                children: [
                  Container(
                    height: j == 2
                        ? 200.0
                        : j == 4
                            ? 50.0
                            : 100.0,
                    width: 20.0,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: j == 2 || j == 4
                            ? const Color(0xFF32C97F)
                            : const Color(0xFFD7F5E6),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                            topRight: Radius.circular(5.0),
                            bottomLeft: Radius.circular(4.0),
                            bottomRight: Radius.circular(4.0))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 0.0, top: 5.0),
                        child: AppText(
                            days?[j].day.toUpperCase().substring(0, 1)
                                as String,
                            fontSize: 12.0),
                      )
                    ],
                  )
                ],
              ),
          ],
        ),
      ],
    );
  }
}
