import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:team_intervel_test/model/drink_list_model.dart';

class DrinkListService {
  static Future<DrinkListModel> getDrinkList() async {
    try {
      print(Uri.parse(
          "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=rum"));

      final response = await http.get(Uri.parse(
          "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=rum"));

      if (response.statusCode == 200) {
        return Future.value(
            DrinkListModel.fromJson(json.decode(response.body)));
      } else if (response.statusCode == 500) {
        throw Exception(response.body);
      } else {
        throw Exception("errorText");
      }
    } on SocketException {
      print('No Internet connection 😑');
      throw Exception('No Internet connection ');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<DrinkListModel> searchDrinkList(String str) async {
    try {
      print(Uri.parse(
          "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$str"));

      final response = await http.get(Uri.parse(
          "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$str"));

      if (response.statusCode == 200) {
        return Future.value(
            DrinkListModel.fromJson(json.decode(response.body)));
      } else if (response.statusCode == 500) {
        throw Exception(response.body);
      } else {
        throw Exception("errorText");
      }
    } on SocketException {
      print('No Internet connection 😑');
      throw Exception('No Internet connection ');
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
