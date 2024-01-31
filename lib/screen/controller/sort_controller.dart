import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sort_api/screen/model/extra_model.dart';
import 'package:sort_api/screen/model/sort_model.dart';
import 'package:sort_api/utils/api_helper.dart';

class SortController extends GetxController {
  RxList<ExtraModel> modelList=<ExtraModel>[
    ExtraModel(amount: 0,baseAmount: '100'),
    ExtraModel(amount: 0,baseAmount: '200'),
    ExtraModel(amount: 0,baseAmount: '500'),
  ].obs;

  RxList<TextEditingController> con=<TextEditingController>[].obs;
  RxInt resuly=0.obs;


  RxList<SortModel> sortList = <SortModel>[].obs;
  RxList<RxInt> resultList = <RxInt>[].obs;

  Rx<SortModel> model = SortModel().obs;

  // Rx<HomeModel?> mainModel =HomeModel(content: []).obs;
  Future<List<SortModel>> takeApi() async {
    sortList.value = await ApiHelper.apihelper.getApi();
    return sortList;
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   // sortList = <SortModel>[].obs;
  //   model = SortModel().obs;
  //   takeApi();
  // }

  RxBool sort = false.obs;

  void dataSort() {
    List<SortModel> l1 = List.from(sortList);

    if (!sort.value) {
      l1.sort(
        (a, b) => b.price!.compareTo(a.price!),
      );
    } else {
      l1.sort(
        (a, b) => a.price!.compareTo(b.price!),
      );
    }
    sortList.value = l1;
    sort.value = !sort.value;
  }

  RxBool sortAtoZ = false.obs;

  void sortA() {
    List<SortModel> l1 = List.from(sortList);

    l1.sort((a, b) => a.title!.toLowerCase().compareTo(b.title!.toLowerCase()));

    sortList.value = l1;
    sortAtoZ.value = true;
  }

  RxBool sortZtoA = false.obs;

  void sortZ() {
    List<SortModel> l1 = List.from(sortList);

    l1.sort((a, b) => b.title!.toLowerCase().compareTo(a.title!.toLowerCase()));

    sortList.value = l1;
    sortZtoA.value = true;
  }

  var selectedDate = DateTime.now().obs;
  var selectedTime = TimeOfDay.now().obs;
  TextEditingController textEditingController = TextEditingController();

  void selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2018),
      lastDate: DateTime(2025),
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
      textEditingController.text =
          DateFormat('dd-MM-yyyy').format(selectedDate.value).toString();
    }
  }

  //Charts

  RxInt touchedIndex = (-1).obs;
  RxBool isTouched=false.obs;

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
       isTouched.value = i == touchedIndex.value;
      final fontSize = isTouched.value ? 25.0 : 16.0;
      final radius = isTouched.value ? 60.0 : 50.0;
      const shadows = [Shadow(color:Colors.white, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.blue,
            value: 40,
            title: '40',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color:Colors.white,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.yellow,
            value: 30,
            title: '30',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color:Colors.white,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.purple,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color:Colors.white,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.green,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color:Colors.white,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
