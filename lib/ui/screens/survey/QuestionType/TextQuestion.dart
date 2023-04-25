import 'package:flutter/material.dart';
import '../model/modelQuestion.dart';

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
  void _onSearchChanged(String query) {
    
    widget.fnChangeAnswerQuiz(query, widget.questions[widget.questionIndex].QuestionID);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            widget.questions[widget.questionIndex].QuestionName,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          TextField(
              controller: textController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
                ),
              ),
              onChanged: _onSearchChanged),
        ]));
  }
}
