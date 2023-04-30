// import 'package:flutter/material.dart';
// import 'package:pokedex/ui/screens/survey/detail/question.dart';
// import '../../ui/screens/survey/model/modelAnswer.dart';
// import '../../ui/screens/survey/model/modelQuestion.dart';

// class A2 extends StatefulWidget {
//   final Function fnChangeAnswerQuiz;
//   const A2(this.fnChangeAnswerQuiz, {super.key});

//   @override
//   State<A2> createState() => _A2State();
// }

// class _A2State extends State<A2> {
//   final List<ModelQuestion> _questions = [
//     ModelQuestion(
//         QuestionID: 1,
//         QuestionName: 'Địa điểm sản xuất kinh doanh của của cơ sở',
//         AnswerResult: "",
//         Answers: [
//           ModelAnswer(AnswerID: 1, AnswerName: 'Tại đường phố, ngõ xóm'),
//           ModelAnswer(AnswerID: 2, AnswerName: 'Tại siêu thị trung tâm thương mại'),
//           ModelAnswer(AnswerID: 3, AnswerName: 'Tại chợ kiên cố, bán kiên cố'),
//           ModelAnswer(AnswerID: 4, AnswerName: 'Tại cửa hàng minimart'),
//           ModelAnswer(AnswerID: 5, AnswerName: 'Địa điểm cố định khác'),
//           ModelAnswer(AnswerID: 6, AnswerName: 'Địa điểm không cố định')
//         ])
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [Question(_questions, 0, widget.fnChangeAnswerQuiz)]);
//   }
// }
