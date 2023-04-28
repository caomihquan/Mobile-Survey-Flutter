import 'package:flutter/material.dart';
import 'package:pokedex/ui/screens/survey/QuestionType/TextQuestion.dart';
import '../../ui/screens/survey/model/modelQuestion.dart';

class D extends StatefulWidget {
  final Function fnChangeAnswerQuiz;
  const D(this.fnChangeAnswerQuiz, {super.key});

  @override
  State<D> createState() => _DState();
}

class _DState extends State<D> {
  final List<ModelQuestion> _questions = [
    ModelQuestion(
        QuestionID: 1,
        QuestionName: 'Số tháng hoạt động SXKD của cơ sở trong năm 2023?',
        AnswerResult: "",
        Answers: []),
    ModelQuestion(
        QuestionID: 2,
        QuestionName:
            'Ước tính số tiền thu về bao gồm cả vốn và lãi bình quân 1 tháng có hoạt động SXKD năm 2022 của cơ sở là bao nhiêu?',
        AnswerResult: "",
        Answers: []),
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
        Text("THÔNG TIN VỀ HOẠT ĐỘNG SẢN XUẤT KINH DOANH  CỦA CƠ SỞ"),
        TextQuestion(_questions, 0, widget.fnChangeAnswerQuiz),
        TextQuestion(_questions, 1, widget.fnChangeAnswerQuiz),
        Row(
          children: [
            Text("Tổng số doanh thu ước tính năm 2023:"),
            Text("2.000.000"),
          ],
        ),
      ],
    );
  }
}
