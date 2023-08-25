import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_tv/Logic/API/Models/showModel.dart';

class ShowController {
  
  static Future<List<ShowModel>> getTop250Movies() async{
    var response = await http.get(
      Uri.parse('https://www.imdb-api.com/en/API/Top250Movies/k_c5mb66ix')
    );
    Map<String,dynamic> json = jsonDecode(response.body);
    List<ShowModel> models = [];
    for(var j in json['items'])
      models.add(
        ShowModel.fromJSON(j)
      );
  return models;
  }

  static Future<List<ShowModel>> getTop250TVs() async{
    var response = await http.get(
        Uri.parse('https://www.imdb-api.com/en/API/Top250TVs/k_c5mb66ix')
    );
    Map<String,dynamic> json = jsonDecode(response.body);
    List<ShowModel> models = [];
    for(var j in json['items'])
      models.add(
          ShowModel.fromJSON(j)
      );
    return models;
  }
  
}
