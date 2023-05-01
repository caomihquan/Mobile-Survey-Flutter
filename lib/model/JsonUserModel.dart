class JsonUserModel {
  String? userName;
  String? password;
  String? userID;

  JsonUserModel({this.userName, this.password, this.userID});

  JsonUserModel.fromJson(Map<String, dynamic> json) {
    userName = json['UserName'];
    password = json['Password'];
    userID = json['UserID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserName'] = this.userName;
    data['Password'] = this.password;
    data['UserID'] = this.userID;
    return data;
  }

  factory JsonUserModel.fromMap(Map<String, dynamic> json) => new JsonUserModel(
      userName: json['UserName'], password: json['Password'], userID: json['UserID']);
}
