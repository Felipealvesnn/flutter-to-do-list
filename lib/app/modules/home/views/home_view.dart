import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/app/modules/CalendarPage/controllers/calendar_page_controller.dart';
import 'package:flutter_to_do_list/app/modules/CalendarPage/views/calendar_page_view.dart';
import 'package:flutter_to_do_list/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_to_do_list/app/routes/app_pages.dart';
import 'package:flutter_to_do_list/app/theme/colors/light_colors.dart';
import 'package:flutter_to_do_list/app/widgets/active_project_card.dart';
import 'package:flutter_to_do_list/app/widgets/task_column.dart';
import 'package:flutter_to_do_list/app/widgets/top_container.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  @override
  final controller = Get.find();
  Text subheading(String title) {
    return Text(
      title,
      style: const TextStyle(
          color: LightColors.kDarkBlue,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  static CircleAvatar calendarIcon() {
    return const CircleAvatar(
      radius: 25.0,
      backgroundColor: LightColors.kGreen,
      child: Icon(
        Icons.calendar_today,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      drawer: Drawer(
        // Conteúdo do Drawer aqui
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                  //  color: Colors.blue,
                  ),
              child: Text('Header do Drawer'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Lógica quando o Item 1 do Drawer for pressionado
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Lógica quando o Item 2 do Drawer for pressionado
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            //container do top
            Builder(
              builder: (context) => TopContainer(
                height: 200,
                width: width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              Scaffold.of(context)
                                  .openDrawer(); // Abre o Drawer
                            },
                            icon: const Icon(Icons.menu, size: 25.0),
                            color: LightColors.kDarkBlue, // Use a cor desejada
                          ),
                          const Icon(Icons.search,
                              color: LightColors.kDarkBlue, size: 25.0),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            CircularPercentIndicator(
                              radius: 60.0,
                              lineWidth: 5.0,
                              animation: true,
                              percent: 0.75,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: LightColors.kRed,
                              backgroundColor: LightColors.kDarkYellow,
                              center: const CircleAvatar(
                                backgroundColor: LightColors.kBlue,
                                radius: 50.0,
                                backgroundImage: NetworkImage(
                                  'https://avatars.githubusercontent.com/u/88728350?s=400&u=3f1fb1f47fc18e90605ebc54b2ecddf07e528e12&v=4', // Substitua 'URL_DA_IMAGEM' pela URL da imagem da web
                                ),
                              ),
                            ),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Felipe Alves',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      color: LightColors.kDarkBlue,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Text(
                                    'App Developer',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ]),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              subheading('Minhas Tarefas'),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.CALENDAR_PAGE);
                                },
                                child: calendarIcon(),
                              ),
                            ],
                          ),
                          Obx(
                            () => SizedBox(
                              height:  120, //controller.listCategoryQtdTalks.length * 59,
                              child: ListView.separated(
                                // physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    controller.listCategoryQtdTalks.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 15.0),
                                itemBuilder: (context, index) {
                                  final task = controller
                                      .listCategoryQtdTalks.value[index];
                                  return TaskColumn(
                                    icon: task.icon,
                                    iconBackgroundColor: LightColors.kBlue,
                                    title: task.nome,
                                    subtitle: '${task.qtd} Tarefas',
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            subheading('Active Projects'),
                            const SizedBox(height: 5.0),
                            SizedBox(
                              height: controller.listCategoryQtdTalks.length *
                                  (150),
                              child: Obx(
                                () => Visibility(
                                  visible: controller
                                          .listCategoryQtdTalks.isNotEmpty,
                                  replacement: const CircularProgressIndicator(),
                                  child: GridView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.6,
                                      crossAxisSpacing: 10.0,
                                      mainAxisSpacing: 10.0,
                                    ),
                                    itemCount:
                                        controller.listCategoryQtdTalks.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ActiveProjectsCard(
                                        cardColor: LightColors.getRandomColor(),
                                        loadingPercent: controller
                                            .listCategoryQtdTalks[index].porcentagem,
                                        title: controller
                                            .listCategoryQtdTalks[index].nome,
                                        subtitle:
                                            '${controller.listCategoryQtdTalks[index].nome} Tarefas',
                                      );
                                    },
                                  ),
                               
                                ),
                              ),
                            ),
                            //   const Row(
                            //     children: <Widget>[
                            //       ActiveProjectsCard(
                            //         cardColor: LightColors.kGreen,
                            //         loadingPercent: 0.25,
                            //         title: 'Medical App',
                            //         subtitle: '9 hours progress',
                            //       ),
                            //       SizedBox(width: 20.0),
                            //       ActiveProjectsCard(
                            //         cardColor: LightColors.kRed,
                            //         loadingPercent: 0.6,
                            //         title: 'Making History Notes',
                            //         subtitle: '20 hours progress',
                            //       ),
                            //     ],
                            //   ),
                            //   const Row(
                            //     children: <Widget>[
                            //       ActiveProjectsCard(
                            //         cardColor: LightColors.kDarkYellow,
                            //         loadingPercent: 0.45,
                            //         title: 'Sports App',
                            //         subtitle: '5 hours progress',
                            //       ),
                            //       SizedBox(width: 20.0),
                            //       ActiveProjectsCard(
                            //         cardColor: LightColors.kBlue,
                            //         loadingPercent: 0.9,
                            //         title: 'Online Flutter Course',
                            //         subtitle: '23 hours progress',
                            //       ),
                            //     ],
                            //   ),
                            // ],
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {},
        indicatorColor: Colors.amber[800],
        //selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.school),
            icon: Icon(Icons.school_outlined),
            label: 'School',
          ),
        ],
      ),
    );
  }
}
