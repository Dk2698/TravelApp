import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_app/model/data_model.dart';

class DataServices{
  String baseUrl = "http://mark.bslmeiyu.com/api";
  Future<List<DataModel>> getInfo() async{
    var apiUrl = '/getplaces';
    http.Response res = await http.get(Uri.parse(baseUrl+apiUrl));
    try {
      if(res.statusCode == 200){
        List<dynamic> list = json.decode(res.body);
        // first all first take a list then after passing to model constructor
        // traveing to list data into model data then after add to list of modeldata
        print(list);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else{
        return <DataModel> [];
      }

    } catch (e) {
      print(e);
      return <DataModel> [];
    }
  }
}