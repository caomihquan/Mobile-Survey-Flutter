import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../routes.dart';

class ChangePassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePassword> {
  @override
  void initState() {
    super.initState();
  }

  bool _obscurePassOld = true;
  bool _obscurePassNew = true;
  bool _obscurePassConfirm = true;

  void _toggleOld() {
    setState(() {
      _obscurePassOld = !_obscurePassOld;
    });
  }

  void _toggleNew() {
    setState(() {
      _obscurePassNew = !_obscurePassNew;
    });
  }

  void _toggleConfirm() {
    setState(() {
      _obscurePassConfirm = !_obscurePassConfirm;
    });
  }

  TextEditingController passWordConfirmController = TextEditingController();
  TextEditingController passWordOldController = TextEditingController();
  TextEditingController passWordNewController = TextEditingController();

  void changepass(passOld, passNew, passConfirm) async {
    try {
      var res = await http.post(Uri.parse("https://restful-booker.herokuapp.com/auth"),
          body: {'username': 'admin2', 'password': 'password123'});
    } catch (err) {
      print(err);
    }

    await AppNavigator.push(Routes.home);
  }

  void Back() async {
    AppNavigator.pop();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 400,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/backgroundLogin.png'),
                              fit: BoxFit.fill)),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            right: 40,
                            top: 40,
                            width: 80,
                            height: 150,
                            child: Container(
                                child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/images/clock.png'))),
                            )),
                          ),
                          Positioned(
                            child: Container(
                                child: Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Center(
                                child: Text(
                                  "Đổi Mật Khẩu",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                              child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border:
                                          Border(bottom: BorderSide(color: (Colors.grey[100])!))),
                                  child: TextFormField(
                                    controller: passWordOldController,
                                    obscureText: _obscurePassOld,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Mật khẩu cũ",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        suffixIcon: Padding(
                                          padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                          child: GestureDetector(
                                            onTap: _toggleOld,
                                            child: Icon(
                                              _obscurePassOld
                                                  ? Icons.visibility_rounded
                                                  : Icons.visibility_off_rounded,
                                              size: 24,
                                            ),
                                          ),
                                        )),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: passWordNewController,
                                    obscureText: _obscurePassNew,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Mật khẩu mới",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        suffixIcon: Padding(
                                          padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                          child: GestureDetector(
                                            onTap: _toggleNew,
                                            child: Icon(
                                              _obscurePassNew
                                                  ? Icons.visibility_rounded
                                                  : Icons.visibility_off_rounded,
                                              size: 24,
                                            ),
                                          ),
                                        )),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: passWordConfirmController,
                                    obscureText: _obscurePassConfirm,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Xác nhận mật khẩu",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        suffixIcon: Padding(
                                          padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                          child: GestureDetector(
                                            onTap: _toggleConfirm,
                                            child: Icon(
                                              _obscurePassConfirm
                                                  ? Icons.visibility_rounded
                                                  : Icons.visibility_off_rounded,
                                              size: 24,
                                            ),
                                          ),
                                        )),
                                  ),
                                )
                              ],
                            ),
                          )),
                          SizedBox(
                            height: 30,
                          ),
                          InkWell(
                              onTap: () => changepass(
                                  passWordOldController.text.toString(),
                                  passWordNewController.text.toString(),
                                  passWordConfirmController.text.toString()),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(colors: [
                                      Color.fromRGBO(66, 133, 250, 1),
                                      Color.fromRGBO(97, 150, 230, 0.6),
                                    ])),
                                child: Center(
                                  child: Text(
                                    "Đổi mật khẩu",
                                    style:
                                        TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          InkWell(
                              onTap: () => Back(),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(colors: [
                                      Color.fromRGBO(184, 184, 184, 1),
                                      Color.fromRGBO(184, 184, 184, 1),
                                    ])),
                                child: Center(
                                  child: Text(
                                    "Trở về",
                                    style:
                                        TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 70,
                          ),
                          Container(
                              child: Text(
                            "",
                            style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
                          )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
