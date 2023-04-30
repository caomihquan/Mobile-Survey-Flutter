class JsonQuestionModel {
  String? questionID;
  String? questionName;
  int? questionType;
  dynamic answerResult;
  int? validType;
  String? questionParent;

  JsonQuestionModel(
      {this.questionID,
      this.questionName,
      this.questionType,
      this.answerResult,
      this.validType,
      this.questionParent});

  JsonQuestionModel.fromJson(Map<String, dynamic> json) {
    questionID = json['QuestionID'];
    questionName = json['QuestionName'];
    questionType = json['QuestionType'];
    answerResult = json['AnswerResult'];
    validType = json['ValidType'];
    questionParent = json['QuestionParent'];
  }

  factory JsonQuestionModel.fromMap(Map<String, dynamic> json) => new JsonQuestionModel(
      questionID: json['QuestionID'],
      questionName: json['QuestionName'],
      questionType: json['QuestionType'],
      answerResult: json['AnswerResult'],
      validType: json['ValidType'],
      questionParent: json['QuestionParent']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['QuestionID'] = this.questionID;
    data['QuestionName'] = this.questionName;
    data['QuestionType'] = this.questionType;
    data['AnswerResult'] = this.answerResult;
    data['ValidType'] = this.validType;
    data['QuestionParent'] = this.questionParent;
    return data;
  }
}
