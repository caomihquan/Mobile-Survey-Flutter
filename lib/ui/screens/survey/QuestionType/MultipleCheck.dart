import 'package:flutter/material.dart';
import '../model/modelQuestion.dart';

class MultipleQuestion extends StatefulWidget {
  final List<ModelQuestion> questions;
  final int questionIndex;
  final Function fnChangeAnswerQuiz;
  const MultipleQuestion(this.questions, this.questionIndex, this.fnChangeAnswerQuiz, {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultipleQuestion();
}

class _MultipleQuestion extends State<MultipleQuestion> {
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
                    ? Icon(Icons.check_box)
                    : Icon(Icons.check_box_outline_blank),
                title: Text(answer.AnswerName),
              ),
            );
          }).toList(),
        ]));
  }
}
