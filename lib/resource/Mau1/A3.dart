// import 'package:flutter/material.dart';
// import 'package:pokedex/ui/screens/survey/detail/question.dart';
// import '../../ui/screens/survey/model/modelAnswer.dart';
// import '../../ui/screens/survey/model/modelQuestion.dart';

// class A3 extends StatefulWidget {
//   final Function fnChangeAnswerQuiz;
//   const A3(this.fnChangeAnswerQuiz, {super.key});

//   @override
//   State<A3> createState() => _A3State();
// }

// class _A3State extends State<A3> {
//   final List<ModelQuestion> _questions = [
//     ModelQuestion(
//         QuestionID: 1,
//         QuestionName: 'Tình trạng đăng ký kinh doanh của cơ sở SXKD của ông/bà?',
//         AnswerResult: "",
//         Answers: [
//           ModelAnswer(AnswerID: 1, AnswerName: 'Đã có giấy chứng nhận ĐKKD'),
//           ModelAnswer(AnswerID: 2, AnswerName: 'Chưa đăng ký ĐKKD'),
//           ModelAnswer(AnswerID: 3, AnswerName: 'Đã ĐKKD nhưng chưa được cấp'),
//           ModelAnswer(AnswerID: 4, AnswerName: 'Không phải ĐKKD'),
//         ])
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [Question(_questions, 0, widget.fnChangeAnswerQuiz)]);
//   }
// }
