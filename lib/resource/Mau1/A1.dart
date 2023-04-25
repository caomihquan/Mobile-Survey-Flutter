import 'package:flutter/material.dart';
import 'package:pokedex/ui/screens/survey/detail/question.dart';
import '../../ui/screens/survey/model/modelAnswer.dart';
import '../../ui/screens/survey/model/modelQuestion.dart';

class A1 extends StatefulWidget {
  final Function fnChangeAnswerQuiz;
  const A1(this.fnChangeAnswerQuiz, {super.key});

  @override
  State<A1> createState() => _A1State();
}

class _A1State extends State<A1> {
  final List<ModelQuestion> _questions = [
    ModelQuestion(
        QuestionID: 1,
        QuestionName: 'Địa điểm sản xuất kinh doanh của của cơ sở là:',
        AnswerResult: "",
        Answers: [
          ModelAnswer(AnswerID: 1, AnswerName: 'Là địa điểm SXKD chủ cơ sở đi thuê/mượn'),
          ModelAnswer(AnswerID: 2, AnswerName: 'Là địa điểm SXKD thuộc sở hữu của chủ cơ sở')
        ])
  ];
  @override
  Widget build(BuildContext context) {
    return Center(child: Question(_questions, 0, widget.fnChangeAnswerQuiz));
  }
}
