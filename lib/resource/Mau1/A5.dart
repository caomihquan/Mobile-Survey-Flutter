// import 'package:flutter/material.dart';
// import 'package:pokedex/ui/screens/survey/detail/question.dart';
// import '../../ui/screens/survey/model/modelAnswer.dart';
// import '../../ui/screens/survey/model/modelQuestion.dart';

// class A5 extends StatefulWidget {
//   final Function fnChangeAnswerQuiz;
//   const A5(this.fnChangeAnswerQuiz, {super.key});

//   @override
//   State<A5> createState() => _A5State();
// }

// class _A5State extends State<A5> {
//   final List<ModelQuestion> _questions = [
//     ModelQuestion(
//         QuestionID: 1,
//         QuestionName: 'Cơ sở có mã số thuế không',
//         AnswerResult: "",
//         Answers: [
//           ModelAnswer(AnswerID: 1, AnswerName: 'Có (ghi rõ)', IsOther: true),
//           ModelAnswer(AnswerID: 2, AnswerName: 'Không'),
//         ])
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [Question(_questions, 0, widget.fnChangeAnswerQuiz)]);
//   }
// }
