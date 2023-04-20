import 'package:flutter/material.dart';
import '../model/modelQuestion.dart';
import 'dart:async';
import 'package:dropdown_button2/dropdown_button2.dart';

class ValueListQuestion extends StatefulWidget {
  final List<ModelQuestion> questions;
  final int questionIndex;
  final Function fnChangeAnswerQuiz;
  const ValueListQuestion(this.questions, this.questionIndex, this.fnChangeAnswerQuiz, {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ValueListQuestion();
}

class _ValueListQuestion extends State<ValueListQuestion> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          Container(
              child: Text(widget.questions[widget.questionIndex].QuestionName,
                  style: const TextStyle(fontSize: 28, color: Colors.white),
                  textAlign: TextAlign.center)),
          Center(
            child: DropdownButtonFormField2(
              decoration: InputDecoration(
                //Add isDense true and zero Padding.
                //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                //Add more decoration as you want here
                //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
              ),
              isExpanded: true,
              hint: const Text(
                'Select Your Gender',
                style: TextStyle(fontSize: 14),
              ),
              items: widget.questions[widget.questionIndex].Answers
                  .map((item) => DropdownMenuItem<String>(
                        value: item.AnswerID.toString(),
                        child: Text(
                          item.AnswerName,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: (value) {
                print(value);
                //widget.fnChangeAnswerQuiz(value);
              },
              buttonStyleData: const ButtonStyleData(
                height: 60,
                padding: EdgeInsets.only(left: 20, right: 10),
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 30,
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ]));
  }
}
