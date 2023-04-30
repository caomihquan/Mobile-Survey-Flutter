// import 'package:flutter/material.dart';
// import 'package:pokedex/ui/screens/survey/QuestionType/TextQuestion.dart';
// import '../../ui/screens/survey/model/modelQuestion.dart';

// class A extends StatefulWidget {
//   final Function fnChangeAnswerQuiz;
//   const A(this.fnChangeAnswerQuiz, {super.key});

//   @override
//   State<A> createState() => _AState();
// }

// class _AState extends State<A> {
//   final List<ModelQuestion> _questions = [
//     ModelQuestion(
//         QuestionID: 1,
//         QuestionName: 'Tỉnh, thành phố thuộc trung ương',
//         AnswerResult: "",
//         Answers: []),
//     ModelQuestion(
//         QuestionID: 2,
//         QuestionName: 'Huyện/quận(thị xã,thành phố thuộc tỉnh)',
//         AnswerResult: "",
//         Answers: []),
//     ModelQuestion(QuestionID: 3, QuestionName: 'Xã phường thị trấn', AnswerResult: "", Answers: []),
//     ModelQuestion(QuestionID: 4, QuestionName: 'Địa bàn', AnswerResult: "", Answers: []),
//     ModelQuestion(QuestionID: 5, QuestionName: 'Mã cơ sở', AnswerResult: "", Answers: []),
//     ModelQuestion(QuestionID: 6, QuestionName: 'Tên cơ sở', AnswerResult: "", Answers: []),
//     ModelQuestion(
//         QuestionID: 7,
//         QuestionName: 'Địa chỉ (số nhà, đường phố, tổ/thôn/ấp):',
//         AnswerResult: "",
//         Answers: []),
//     ModelQuestion(QuestionID: 8, QuestionName: 'Số điện thoại:', AnswerResult: "", Answers: []),
//     ModelQuestion(QuestionID: 9, QuestionName: 'Email(nếu có)', AnswerResult: "", Answers: []),
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
//         TextQuestion(_questions, 0, widget.fnChangeAnswerQuiz),
//         TextQuestion(_questions, 1, widget.fnChangeAnswerQuiz),
//         TextQuestion(_questions, 2, widget.fnChangeAnswerQuiz),
//         TextQuestion(_questions, 3, widget.fnChangeAnswerQuiz),
//         TextQuestion(_questions, 4, widget.fnChangeAnswerQuiz),
//         TextQuestion(_questions, 5, widget.fnChangeAnswerQuiz),
//         TextQuestion(_questions, 6, widget.fnChangeAnswerQuiz),
//         TextQuestion(_questions, 7, widget.fnChangeAnswerQuiz),
//         TextQuestion(_questions, 8, widget.fnChangeAnswerQuiz),
//       ],
//     );
//   }
// }
