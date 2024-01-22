import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sort_api/screen/controller/sort_controller.dart';

class ChartsScreen extends StatefulWidget {
  const ChartsScreen({super.key});

  @override
  State<ChartsScreen> createState() => _ChartsScreenState();
}

class _ChartsScreenState extends State<ChartsScreen> {
  SortController controller = Get.put(SortController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffefcbcb),
      // appBar: AppBar(
      //   title: Text("Data "),
      // ),
      body: FutureBuilder(
        future: controller.takeApi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    child: Row(
                      children: [
                        Obx(
                          () => AspectRatio(
                            aspectRatio: 1,
                            child: PieChart(
                              PieChartData(
                                  pieTouchData: PieTouchData(
                                    touchCallback:
                                        (FlTouchEvent event, pieTouchResponse) {
                                      if (!event.isInterestedForInteractions ||
                                          pieTouchResponse == null ||
                                          pieTouchResponse.touchedSection ==
                                              null) {
                                        controller.touchedIndex.value = -1;
                                        return;
                                      }
                                      controller.touchedIndex.value =
                                          pieTouchResponse.touchedSection!
                                              .touchedSectionIndex;
                                      log("${controller.touchedIndex.value}==");
                                      // setState(() {});
                                    },
                                  ),
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  sectionsSpace: 0,
                                  centerSpaceRadius: 40,
                                  // sections: showingSections(),),
                                  sections: controller.showingSections()),
                            ),
                          ),
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                                Obx(
                                  () =>  Indicator(
                                      color: Colors.blue,
                                      text: 'First',
                                      isSquare: controller.touchedIndex.value == 0?true:false

                                    ),
                                ),

                            SizedBox(
                              height: 4,
                            ),
                            Obx(
                              () =>  Indicator(
                                color: Colors.yellow,
                                text: 'Second',
                                isSquare:controller.touchedIndex.value == 1?true:false
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Obx(
                              () =>  Indicator(
                                color: Colors.purple,
                                text: 'Third',
                                isSquare:controller.touchedIndex.value == 2?true:false

                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Obx(
                              () =>  Indicator(
                                color: Colors.green,
                                text: 'Fourth',
                                isSquare: controller.touchedIndex.value == 3?true:false
                              ),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // FutureBuilder(future: controller.takeApi(), builder: (context, snapshot) {
                  //   return Obx(
                  //         () => Expanded(
                  //       child: ListView.builder(
                  //         itemBuilder: (context, index) {
                  //           return Card(
                  //             elevation: 1,
                  //             child: ListTile(
                  //
                  //               leading: Container(
                  //                   width: 60,
                  //                   height: 100,
                  //                   decoration: BoxDecoration(
                  //                     color: Colors.white12,
                  //                   ),
                  //                   child: Image.network(
                  //                       "${controller.sortList[index].image}")),
                  //               title: Text("${controller.sortList[index].title}"),
                  //               subtitle: Text("₹ ${controller.sortList[index].price}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                  //             ),
                  //           );
                  //         },
                  //         itemCount: controller.sortList.length,
                  //       ),
                  //     ),
                  //   );
                  // },)
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text(("${snapshot.error}"));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    ));
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 16,
    this.textColor,
  });

  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        )
      ],
    );
  }
}
