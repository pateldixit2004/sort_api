import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sort_api/screen/controller/sort_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SortController controller = Get.put(SortController());

  @override
  void initState() {
    super.initState();
    controller.takeApi();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sort Api"),
          backgroundColor: Colors.orangeAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: controller.textEditingController,

                onTap: () {
                  controller.selectDate();
                },

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        controller.sortA();
                      },
                      child: Text("A to Z")),
                  ElevatedButton(
                      onPressed: () {
                        controller.sortZ();
                      },
                      child: Text("Z to A")),
                  Obx(
                        () =>
                        ElevatedButton(
                          onPressed: () {
                            controller.dataSort();
                          },
                          child: Text(
                              controller.sort.value ? "H to L" : "L to H"),
                        ),
                  ),
                ],
              ),
              Obx(
                    () =>
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: SizedBox(
                                width: 60,
                                child: Image.network(
                                    "${controller.sortList[index].image}")),
                            title: Text("${controller.sortList[index].title}"),
                            subtitle: Text("${controller.sortList[index]
                                .price}"),
                          );
                        },
                        itemCount: controller.sortList.length,
                      ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
