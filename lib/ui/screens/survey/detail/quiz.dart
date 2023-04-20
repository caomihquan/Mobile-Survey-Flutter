import 'package:flutter/material.dart';
import 'package:pokedex/ui/screens/survey/QuestionType/TextQuestion.dart';
import 'package:pokedex/ui/screens/survey/detail/question.dart';

import '../QuestionType/MultipleCheck.dart';
import '../QuestionType/ValueListQuestion.dart';
import '../model/modelQuestion.dart';

class Quiz extends StatefulWidget {
  final List<ModelQuestion> questions;
  final int questionIndex;
  final Function fnQuestionIndex;
  final Function fnChangeAnswerQuiz;

  const Quiz(
      {Key? key,
      required this.questions,
      required this.fnChangeAnswerQuiz,
      required this.fnQuestionIndex,
      required this.questionIndex})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 184, 219, 241),
            Color.fromARGB(255, 176, 204, 232),
          ],
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _getTypeQuestion(),
            Expanded(child: Container()),
            ColoredBox(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Padding(
                  padding: EdgeInsets.all(1),
                  child: Row(
                    children: [
                      widget.questionIndex != 0
                          ? Expanded(
                              child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      widget.fnQuestionIndex(1);
                                    },
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [Icon(Icons.arrow_left), Text('Trở lại')]),
                                  )))
                          : Container(),
                      (widget.questions.length - 1) == widget.questionIndex
                          ? Container()
                          : Expanded(
                              child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      widget.fnQuestionIndex(2);
                                    },
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [Text('Tiếp theo'), Icon(Icons.arrow_right)]),
                                  ))),
                    ],
                  )),
            )
          ],
        ));
  }

  Widget _getTypeQuestion() {
    if (widget.questions[widget.questionIndex].QuestionType == 2) {
      return MultipleQuestion(widget.questions, widget.questionIndex, widget.fnChangeAnswerQuiz);
    } else if (widget.questions[widget.questionIndex].QuestionType == 3) {
      return TextQuestion(widget.questions, widget.questionIndex, widget.fnChangeAnswerQuiz);
    } else if (widget.questions[widget.questionIndex].QuestionType == 4) {
      return ValueListQuestion(widget.questions, widget.questionIndex, widget.fnChangeAnswerQuiz);
    } else {
      return Question(widget.questions, widget.questionIndex, widget.fnChangeAnswerQuiz);
    }
  }
}
