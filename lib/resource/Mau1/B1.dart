// import 'package:flutter/material.dart';
// import 'package:pokedex/ui/screens/survey/QuestionType/TextQuestion.dart';
// import '../../ui/screens/survey/model/modelQuestion.dart';

// class B1 extends StatefulWidget {
//   final Function fnChangeAnswerQuiz;
//   const B1(this.fnChangeAnswerQuiz, {super.key});

//   @override
//   State<B1> createState() => _B1State();
// }

// class _B1State extends State<B1> {
//   final List<ModelQuestion> _questions = [
//     ModelQuestion(
//         QuestionID: 1,
//         QuestionName: 'Trong tổng số: Lao động nữ là bao nhiêu người',
//         AnswerResult: "",
//         Answers: []),
//     ModelQuestion(
//         QuestionID: 2,
//         QuestionName: 'Trong tổng số: Lao động thuê ngoài',
//         AnswerResult: "",
//         Answers: []),
//   ];

//   final List<ModelQuestion> _answer = [
//     ModelQuestion(
//         QuestionID: 2,
//         QuestionName: 'Huyện/quận(thị xã,thành phố thuộc tỉnh)',
//         AnswerResult: "abc",
//         Answers: []),
//     ModelQuestion(
//         QuestionID: 1,
//         QuestionName: 'Tỉnh, thành phố thuộc trung ương',
//         AnswerResult: "test",
//         Answers: []),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     for (var answer in _answer) {
//       for (var i = 0; i < _questions.length; i++) {
//         if (_questions[i].QuestionID == answer.QuestionID) {
//           _questions[i].AnswerResult = answer.AnswerResult;
//           break;
//         }
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//             "Tổng số lao động (kể cả chủ cơ sở) làm việc tại cơ sở của ông/bà tại thời điểm 01/10/2022 là bao nhiêu người?"),
//         TextQuestion(_questions, 0, widget.fnChangeAnswerQuiz),
//         TextQuestion(_questions, 1, widget.fnChangeAnswerQuiz),
//       ],
//     );
//   }
// }
