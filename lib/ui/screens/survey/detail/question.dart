import 'package:flutter/material.dart';

import '../model/modelQuestion.dart';

class Question extends StatefulWidget {
  final List<ModelQuestion> questions;
  final int questionIndex;
  final Function fnChangeAnswerQuiz;
  const Question(this.questions, this.questionIndex, this.fnChangeAnswerQuiz, {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _QuestionRadio();
}

class _QuestionRadio extends State<Question> {
  int index = 0;
  void onChangeRadio(id) {
    setState(() {
      index = id;
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
          ...(widget.questions[widget.questionIndex].Answers).map((answer) {
            return GestureDetector(
              onTap: () => widget.fnChangeAnswerQuiz(
                  answer.AnswerID, widget.questions[widget.questionIndex].QuestionID),
              child: ListTile(
                leading: widget.questions[widget.questionIndex].AnswerResult
                        .toString()
                        .contains(answer.AnswerID.toString())
                    ? Icon(Icons.check_circle_outline)
                    : Icon(Icons.circle_outlined),
                title: Text(answer.AnswerName),
              ),
            );
          }).toList(),
        ]));
  }
}
