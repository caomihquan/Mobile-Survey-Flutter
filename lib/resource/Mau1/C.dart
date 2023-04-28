import 'package:flutter/material.dart';
import 'package:pokedex/ui/screens/survey/QuestionType/TextQuestion.dart';
import '../../ui/screens/survey/model/modelQuestion.dart';

class C extends StatefulWidget {
  final Function fnChangeAnswerQuiz;
  const C(this.fnChangeAnswerQuiz, {super.key});

  @override
  State<C> createState() => _CState();
}

class _CState extends State<C> {
  final List<ModelQuestion> _questions = [
    ModelQuestion(
        QuestionID: 1,
        QuestionName: 'Mô tả sản phẩm chính của cơ sở SXKD',
        AnswerResult: "",
        Answers: []),
    ModelQuestion(QuestionID: 2, QuestionName: 'Mã sản phẩm', AnswerResult: "", Answers: []),
  ];

  final List<ModelQuestion> _answer = [
    ModelQuestion(
        QuestionID: 2,
        QuestionName: 'Huyện/quận(thị xã,thành phố thuộc tỉnh)',
        AnswerResult: "abc",
        Answers: []),
    ModelQuestion(
        QuestionID: 1,
        QuestionName: 'Tỉnh, thành phố thuộc trung ương',
        AnswerResult: "test",
        Answers: []),
  ];

  @override
  void initState() {
    super.initState();
    for (var answer in _answer) {
      for (var i = 0; i < _questions.length; i++) {
        if (_questions[i].QuestionID == answer.QuestionID) {
          _questions[i].AnswerResult = answer.AnswerResult;
          break;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Thông tin về nhóm sản phẩm của cơ sở"),
        TextQuestion(_questions, 0, widget.fnChangeAnswerQuiz),
        TextQuestion(_questions, 1, widget.fnChangeAnswerQuiz),
      ],
    );
  }
}
