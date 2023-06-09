import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex/ui/screens/survey/QuestionType/NumberQuestion.dart';
import 'package:pokedex/ui/screens/survey/QuestionType/TextQuestion.dart';
import 'package:pokedex/ui/screens/survey/detail/question.dart';

import '../../../../Database.dart';
import '../../../../model/JsonQuestionModel.dart';
import '../QuestionType/MultipleCheck.dart';
import '../QuestionType/ValueListQuestion.dart';

class Quiz extends StatefulWidget {
  final List<JsonQuestionModel> questions;
  final int questionIndex;
  final Function fnChangeAnswerQuiz;

  const Quiz(
      {Key? key,
      required this.questions,
      required this.fnChangeAnswerQuiz,
      required this.questionIndex})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 184, 219, 241),
            Color.fromARGB(255, 176, 204, 232),
          ],
        )),
        child: Align(alignment: Alignment.center, child: _getTypeQuestion()));
  }

  Widget _getTypeQuestion() {
    // if (widget.questions[widget.questionIndex].QuestionType == 2) {
    //   return MultipleQuestion(widget.questions, widget.questionIndex, widget.fnChangeAnswerQuiz);
    // } else if (widget.questions[widget.questionIndex].QuestionType == 3) {
    //   return TextQuestion(widget.questions, widget.questionIndex, widget.fnChangeAnswerQuiz);
    // } else if (widget.questions[widget.questionIndex].QuestionType == 4) {
    //   return ValueListQuestion(widget.questions, widget.questionIndex, widget.fnChangeAnswerQuiz);
    // } else {
    // if (question.length > 0 &&
    //     widget.questions[widget.questionIndex].questionID == question[0].questionID) {
    //   widget.questions[widget.questionIndex].answerResult = question[0].answerResult;
    // } else {}
    // widget.questions[widget.questionIndex].answerResult = "222222";
    switch (widget.questions[widget.questionIndex].questionType) {
      case 1:
        return TextQuestion(widget.questions, widget.questionIndex, widget.fnChangeAnswerQuiz);
      case 2:
        return NumberQuestion(widget.questions, widget.questionIndex, widget.fnChangeAnswerQuiz);
      case 3:
        return Question(widget.questions, widget.questionIndex, widget.fnChangeAnswerQuiz);
      default:
        return Center(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Text(
              widget.questions[widget.questionIndex].questionName.toString(),
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
        );
    }
    //}
  }
}
