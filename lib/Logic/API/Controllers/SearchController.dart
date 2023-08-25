import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:my_tv/Logic/API/Models/searchModel.dart';

class SearchController{

  static Future<List<SearchModel>> searchTitle(val) async {
    var response = await http.get(
        Uri.parse('https://www.imdb-api.com/en/API/SearchTitle/k_c5mb66ix/$val')
    );
    Map<String,dynamic> json = jsonDecode(response.body);
    List<SearchModel> models = [];
    for(var j in json['results'])
      models.add(
          SearchModel.fromJSON(j)
      );

    return models;
  }


}