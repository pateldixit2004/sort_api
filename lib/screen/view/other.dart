import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sort_api/screen/controller/sort_controller.dart';
import 'package:sort_api/screen/model/sort_model.dart';

class OtherPage extends StatefulWidget {
  const OtherPage({super.key});

  @override
  State<OtherPage> createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  SortController controller = Get.put(SortController());
  Future<List<SortModel>>? list;
  SortModel? model;

  @override
  void initState() {
    list = controller.takeApi();
    model = controller.model.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sort Models"),
        ),
        body: Column(
          children: [
            // Container(
            //   padding: EdgeInsets.all(16),
            //   decoration: BoxDecoration(border: Border.all(color: Colors.pink)),
            //   child: FutureBuilder(
            //     future: list,
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return CircularProgressIndicator();
            //       } else if (snapshot.hasError) {
            //         return Center(child: Text("Error: ${snapshot.error}"));
            //       } else {
            //         return Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: DropdownButton(
            //             items: controller.sortList.map((element) {
            //               return DropdownMenuItem(
            //                 child: Text(
            //                   "${element.price}",
            //                   style: TextStyle(color: Colors.black),
            //                 ),
            //                 value: element,
            //                 onTap: () {
            //                   model = element;
            //                   setState(() {});
            //                 },
            //               );
            //             }).toList(),
            //             isExpanded: true,
            //             value: model,
            //             onChanged: (value) {
            //               model = value;
            //               setState(() {});
            //             },
            //           ),
            //         );
            //       }
            //     },
            //   ),
            // ),
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: FutureBuilder(
                future: list,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else {
                    return Obx(
                      () => DropdownButton(
                        items: controller.sortList.map((element) {
                          return DropdownMenuItem(
                            value: element,
                            onTap: () {
                              model = element;
                            },
                            child: Text(
                              "${element.price}",
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                        isExpanded: true,
                        value: model,
                        onChanged: (value) {
                          model = value;
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
