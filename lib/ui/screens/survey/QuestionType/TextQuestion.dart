import 'package:flutter/material.dart';
import 'package:pokedex/model/JsonQuestionModel.dart';

class TextQuestion extends StatefulWidget {
  final List<JsonQuestionModel> questions;
  final int questionIndex;
  final Function fnChangeAnswerQuiz;
  final TextInputType type;
  const TextQuestion(this.questions, this.questionIndex, this.fnChangeAnswerQuiz,
      {Key? key, this.type = TextInputType.text})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _TextQuestion();
}

class _TextQuestion extends State<TextQuestion> {
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
        margin: const EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            widget.questions[widget.questionIndex].questionName.toString(),
            style: const TextStyle(
              fontSize: 28,
              color: Colors.black,
            ),
          ),
          TextField(
              controller: textController,
              style: TextStyle(color: Colors.black, fontSize: 20),
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                ),
              ),
              onChanged: _onSearchChanged),
        ]));
  }
}
