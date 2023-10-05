import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/app/modules/CreateNewTaskPage/controllers/create_new_task_page_controller.dart';
import 'package:flutter_to_do_list/app/modules/home/views/home_view.dart';
import 'package:flutter_to_do_list/app/theme/colors/light_colors.dart';
import 'package:flutter_to_do_list/app/widgets/back_button.dart';
import 'package:flutter_to_do_list/app/widgets/my_text_field.dart';
import 'package:flutter_to_do_list/app/widgets/top_container.dart';

import 'package:get/get.dart';

class CreateNewTaskPageView extends GetView<CreateNewTaskPageController> {
  const CreateNewTaskPageView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var downwardIcon = const Icon(
      Icons.keyboard_arrow_down,
      color: Colors.black54,
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height:MediaQuery.of(context).size.height ,
            child: Column(
              children: <Widget>[
                TopContainer(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
                  width: width,
                  child: Column(
                    children: <Widget>[
                      const MyBackButton(),
                      const SizedBox(
                        height: 30,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Create new task',
                            style: TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const MyTextField(label: 'Title'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Expanded(
                                child: MyTextField(
                                  label: 'Date',
                                  icon: downwardIcon,
                                ),
                              ),
                              HomeView.calendarIcon(),
                            ],
                          )
                        ],
                      ))
                    ],
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                              child: MyTextField(
                            label: 'Start Time',
                            icon: downwardIcon,
                          )),
                          const SizedBox(width: 40),
                          Expanded(
                            child: MyTextField(
                              label: 'End Time',
                              icon: downwardIcon,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const MyTextField(
                        label: 'Description',
                        minLines: 3,
                        maxLines: 3,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Category',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black54,
                              ),
                            ),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.start,
                              //direction: Axis.vertical,
                              alignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              runSpacing: 0,
                              //textDirection: TextDirection.rtl,
                              spacing: 10.0,
                              children: <Widget>[
                                Chip(
                                  label: Text("SPORT APP"),
                                  backgroundColor: LightColors.kRed,
                                  labelStyle: TextStyle(color: Colors.white),
                                ),
                                Chip(
                                  label: Text("MEDICAL APP"),
                                ),
                                Chip(
                                  label: Text("RENT APP"),
                                ),
                                Chip(
                                  label: Text("NOTES"),
                                ),
                                Chip(
                                  label: Text("GAMING PLATFORM APP"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
                SizedBox(
                  height: 80,
                  width: width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                        width: width - 40,
                        decoration: BoxDecoration(
                          color: LightColors.kBlue,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Text(
                          'Create Task',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
