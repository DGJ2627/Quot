import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quotes_app/Model/qutoes_model.dart';

class Qutoes_Api {
  Qutoes_Api._();

  static final Qutoes_Api qutoes_api = Qutoes_Api._();

  Future<List<Qutoes_model>?> CallApi() async {
    http.Response response = await http.get(
        Uri.parse("https://dummyjson.com/docs/quotes"));


    if (response.statusCode == 200) {
      Map decodedData = jsonDecode(response.body);

      List photo = decodedData['quotes'];

      List <Qutoes_model> allwallpaper = [];


      photo.forEach((element) {
        allwallpaper.add(Qutoes_model.fromMap(data: element));
      });
      return allwallpaper;
    }
  return null;
  }
}
