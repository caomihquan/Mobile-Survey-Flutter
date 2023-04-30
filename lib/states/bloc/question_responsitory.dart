import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../../model/JsonQuestionModel.dart';

class StoreResponsitory {
  Future<List<JsonQuestionModel>> readJson() async {
    String response = await rootBundle.loadString("assets/question.json");
    List mapData = jsonDecode(response);
    List<JsonQuestionModel> data = mapData.map((item) => JsonQuestionModel.fromJson(item)).toList();
    return data;
  }
}
