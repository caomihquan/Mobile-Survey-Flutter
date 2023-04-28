import 'package:flutter/material.dart';

import '../model/modelQuestion.dart';

class Question extends StatefulWidget {
  final List<ModelQuestion> questions;
  final int questionIndex;
  final double fontSize;
  final Function fnChangeAnswerQuiz;
  const Question(this.questions, this.questionIndex, this.fnChangeAnswerQuiz,
      {Key? key, this.fontSize = 14})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _QuestionRadio();
}

class _QuestionRadio extends State<Question> {
  double textSize = 14;

  @override
  void initState() {
    super.initState();
    setState(() {
      textSize = widget.fontSize;
    });
  }

  var selected = 0;
  TextEditingController textController = TextEditingController();
  void onChangeRadio(id) {
    widget.fnChangeAnswerQuiz(id, widget.questions[widget.questionIndex].QuestionID);
    setState(() {
      selected = id;
    });
  }

  void _onSearchChanged(value) {}

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              child: Text(widget.questions[widget.questionIndex].QuestionName,
                  style: TextStyle(fontSize: textSize, color: Colors.black),
                  textAlign: TextAlign.left)),
          ...(widget.questions[widget.questionIndex].Answers).map((answer) {
            return Column(
              children: [
                GestureDetector(
                    onTap: () => onChangeRadio(answer.AnswerID),
                    child: ListTile(
                      leading: answer.AnswerID == selected
                          ? Icon(
                              Icons.check_circle,
                              size: 24,
                              color: Colors.green.shade300,
                            )
                          : Icon(Icons.circle_outlined, size: 24),
                      title: Text(answer.AnswerName),
                    )),
                answer.IsOther == true && answer.AnswerID == selected
                    ? TextField(
                        controller: textController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
                          ),
                        ),
                        onChanged: _onSearchChanged)
                    : Container()
              ],
            );
          }).toList(),
        ]));
  }
}
