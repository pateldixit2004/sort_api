  import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sort_api/screen/model/sort_model.dart';
class ApiHelper
{
  static final apihelper=ApiHelper._();
  ApiHelper._();


  Future<List<SortModel>> getApi()
  async {
    String? link="https://fakestoreapi.com/products";
    var responce =await http.get(Uri.parse(link));
    List json=jsonDecode(responce.body);
    List<SortModel> list=json.map((e) => SortModel.fromJson(e)).toList();
    return list;





    // var r=http.get(Uri.parse(link));
    // List json=JsonDecoder(r.body);
  }
}