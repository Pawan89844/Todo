import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/module/progress/view%20model/progress_view_model.dart';
import 'package:todo/widgets/text/app_text.dart';

class ProgressComponent extends StatelessWidget {
  const ProgressComponent({super.key});

  @override
  Widget build(BuildContext context) {
    // var viewModel = Provider.of<ProgressViewModel>(context);
    // int _len = viewModel.progress?.tasks.length as int;
    return Consumer<ProgressViewModel>(builder: (context, value, _) {
      if (value.progress == null) {
        return Container();
      } else {
        int _len = value.progress?.tasks.length as int;
        int _lenDay = value.progress?.days.length as int;
        var progress = value.progress?.tasks.reversed.toList();
        var days = value.progress?.days;

        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      for (int i = 0; i < _len; i++)
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.all(8.0),
                          child: AppText(
                            progress?[i].amount.toString() as String,
                          ),
                        ),
                    ],
                  ),
                  for (int j = 0; j < _lenDay; j++)
                    Container(
                      alignment: Alignment.bottomCenter,
                      margin: const EdgeInsets.all(8.0),
                      child: AppText(
                        days?[j].day.toUpperCase() as String,
                        fontSize: 12.0,
                      ),
                    )
                ],
              )
            ],
          ),
        );
      }
    });
  }
}
