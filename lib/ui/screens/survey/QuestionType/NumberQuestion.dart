import 'package:flutter/material.dart';
import 'package:pokedex/model/JsonQuestionModel.dart';

class NumberQuestion extends StatefulWidget {
  final List<JsonQuestionModel> questions;
  final int questionIndex;
  final Function fnChangeAnswerQuiz;
  const NumberQuestion(this.questions, this.questionIndex, this.fnChangeAnswerQuiz, {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _NumberQuestion();
}

class _NumberQuestion extends State<NumberQuestion> {
  TextEditingController textController = TextEditingController();
  void _onSearchChanged(String query) {
    widget.fnChangeAnswerQuiz(query, widget.questions[widget.questionIndex].questionID);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    textController.text = widget.questions[widget.questionIndex].answerResult;
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            widget.questions[widget.questionIndex].questionName.toString(),
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          TextField(
              controller: textController,
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                ),
              ),
              onChanged: _onSearchChanged),
        ]));
  }
}
