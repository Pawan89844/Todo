import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/module/task/view%20model/task_details_view_model.dart';
import 'package:todo/module/task/view%20model/task_view_model.dart';
import 'package:todo/style/theme/app_colors.dart';
import 'package:todo/widgets/buttons/app_elevated_button.dart';
import 'package:todo/widgets/input/app_input_field.dart';
import 'package:todo/widgets/text/app_heading.dart';
import 'package:todo/widgets/text/app_text.dart';

class TaskDetailsComponent extends StatelessWidget {
  const TaskDetailsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TaskViewModel>(context);
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Column(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 8.0),
                  child: const AppHeading('Grocery Purchase')),
              Container(
                  alignment: Alignment.centerLeft,
                  margin:
                      const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                  child: const AppText('In Progress')),
            ],
          ),
          Visibility(
            visible: provider.descriptionState == null ||
                provider.descriptionState == DescriptionEdit.complete,
            child: SizedBox(
              height: size.height * .3,
              width: size.width,
              child: Card(
                color: AppColor.cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const AppHeading('Description'),
                          IconButton(
                              onPressed: () => provider
                                  .editDescription(DescriptionEdit.active),
                              icon: const Icon(Icons.edit))
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      const AppText('This is a sample Description')
                    ],
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: provider.descriptionState != null &&
                provider.descriptionState == DescriptionEdit.active,
            child: AppInputField(
              labelText: 'Description',
              controller: provider.taskDescriptionController,
              maxLines: 4,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.done,
              onSubmitted: (value) =>
                  provider.editDescription(DescriptionEdit.complete),
            ),
          ),
          const Spacer(),
          AppInputField(
            hintText: 'Write a comment',
            controller: provider.taskDescriptionController,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.done,
            suffixIcon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                  width: 100.0,
                  child:
                      AppElevatedButton(buttonName: 'Send', onPressed: () {})),
            ),
          ),
        ],
      ),
    );
  }
}
