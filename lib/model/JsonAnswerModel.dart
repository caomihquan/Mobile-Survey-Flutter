class JsonAnswerModel {
  int? answerID;
  String? answerName;
  bool? isOther;
  String? questionID;

  JsonAnswerModel({this.answerID, this.answerName, this.isOther, this.questionID});

  JsonAnswerModel.fromJson(Map<String, dynamic> json) {
    answerID = json['AnswerID'];
    answerName = json['AnswerName'];
    isOther = json['IsOther'];
    questionID = json['QuestionID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AnswerID'] = this.answerID;
    data['AnswerName'] = this.answerName;
    data['IsOther'] = this.isOther;
    data['QuestionID'] = this.questionID;
    return data;
  }
}
