import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sort_api/screen/model/sort_model.dart';
import 'package:sort_api/utils/api_helper.dart';

class SortController extends GetxController {
  RxList<SortModel> sortList = <SortModel>[].obs;

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
}
