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
                Container(
                  height: 300.0,
                  width: 300.0,
                  child: CustomPaint(
                      painter: PieChart(width: 300.0, height: 300.0, data: [
                    PieChartData(value: 30, color: Colors.blue),
                    PieChartData(value: 50, color: Colors.orange),
                    PieChartData(value: 20, color: Colors.green),
                  ])),
                )
              ],
            ),
          ),
        );
      }
    });
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
