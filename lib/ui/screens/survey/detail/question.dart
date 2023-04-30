import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex/model/JsonAnswerModel.dart';
import 'package:pokedex/model/JsonQuestionModel.dart';

import '../../../../Database.dart';

class Question extends StatefulWidget {
  final List<JsonQuestionModel> questions;
  final int questionIndex;
  final double fontSize;
  final Function fnChangeAnswerQuiz;
  const Question(this.questions, this.questionIndex, this.fnChangeAnswerQuiz,
      {Key? key, this.fontSize = 30})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _QuestionRadio();
}

class _QuestionRadio extends State<Question> {
  double textSize = 14;

  @override
  void initState() {
    super.initState();
    setState(() {
      textSize = widget.fontSize;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<List<JsonAnswerModel>> getAnswers(String? id) async {
    List<JsonAnswerModel> data = [];
    if (id != null) {
      String response = await DefaultAssetBundle.of(context).loadString("assets/answer.json");
      List mapData = jsonDecode(response);
      data = mapData
          .map((item) => JsonAnswerModel.fromJson(item))
          .where((element) => element.questionID == id)
          .toList();
      return data;
    }
    return data;
  }

  var selected = 0;
  TextEditingController textController = TextEditingController();
  void onChangeRadio(id) {
    widget.fnChangeAnswerQuiz(id, widget.questions[widget.questionIndex].questionID);
    setState(() {
      selected = id;
    });
  }

  _onSearchChanged(value) {}

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              child: Text(widget.questions[widget.questionIndex].questionName.toString(),
                  style: TextStyle(fontSize: textSize, color: Colors.black),
                  textAlign: TextAlign.left)),
          FutureBuilder<List<JsonAnswerModel>>(
              future: getAnswers(widget.questions[widget.questionIndex].questionID),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(children: [
                    ...(snapshot.data!).map((answer) {
                      return Column(
                        children: [
                          GestureDetector(
                              onTap: () => onChangeRadio(answer.answerID),
                              child: ListTile(
                                leading: widget.questions[widget.questionIndex].answerResult
                                        .toString()
                                        .contains(answer.answerID.toString())
                                    ? Icon(
                                        Icons.check_circle,
                                        size: 40,
                                        color: Colors.green,
                                      )
                                    : Icon(Icons.circle_outlined, size: 40),
                                title: Text(answer.answerName.toString()),
                              )),
                          answer.isOther == true && answer.answerID == selected
                              ? TextField(
                                  controller: textController,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(color: Colors.grey),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
                                    ),
                                  ),
                                  onChanged: _onSearchChanged)
                              : Container()
                        ],
                      );
                    }).toList(),
                  ]);
                } else {
                  return CircularProgressIndicator();
                }
              })
        ]));
  }
}
