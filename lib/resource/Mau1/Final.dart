// import 'package:flutter/material.dart';
// import 'package:pokedex/ui/screens/survey/QuestionType/TextQuestion.dart';
// import '../../ui/screens/survey/model/modelQuestion.dart';

// class Final1 extends StatefulWidget {
//   final Function fnChangeAnswerQuiz;
//   const Final1(this.fnChangeAnswerQuiz, {super.key});

//   @override
//   State<Final1> createState() => _Final1State();
// }

// class _Final1State extends State<Final1> {
//   final List<ModelQuestion> _questions = [
//     ModelQuestion(
//         QuestionID: 1,
//         QuestionName: 'Họ và tên người cung cấp thông tin',
//         AnswerResult: "",
//         Answers: []),
//     ModelQuestion(QuestionID: 2, QuestionName: 'Số điện thoại', AnswerResult: "", Answers: []),
//     ModelQuestion(QuestionID: 2, QuestionName: 'Email', AnswerResult: "", Answers: []),
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
//         Text("Thông tin người trả lời phiếu"),
//         TextQuestion(_questions, 0, widget.fnChangeAnswerQuiz),
//         TextQuestion(_questions, 1, widget.fnChangeAnswerQuiz),
//         TextQuestion(_questions, 2, widget.fnChangeAnswerQuiz),
//       ],
//     );
//   }
// }
