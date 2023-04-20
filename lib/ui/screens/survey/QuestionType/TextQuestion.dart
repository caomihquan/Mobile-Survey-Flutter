import 'package:flutter/material.dart';
import '../model/modelQuestion.dart';
import 'dart:async';

class TextQuestion extends StatefulWidget {
  final List<ModelQuestion> questions;
  final int questionIndex;
  final Function fnChangeAnswerQuiz;
  const TextQuestion(this.questions, this.questionIndex, this.fnChangeAnswerQuiz, {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _TextQuestion();
}

class _TextQuestion extends State<TextQuestion> {
  TextEditingController textController = TextEditingController();
  Timer? _debounce;
  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      widget.fnChangeAnswerQuiz(query, widget.questions[widget.questionIndex].QuestionID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          Container(
              child: Text(widget.questions[widget.questionIndex].QuestionName,
                  style: const TextStyle(fontSize: 28, color: Colors.white),
                  textAlign: TextAlign.center)),
          TextField(
              controller: textController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Mật khẩu",
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.grey.shade100),
                ),
              ),
              onChanged: _onSearchChanged),
        ]));
  }
}
