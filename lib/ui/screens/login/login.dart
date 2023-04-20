// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/apiHttpService.dart';
import 'package:pokedex/states/user/bloc/user_bloc.dart';
import 'package:pokedex/states/user/model/UserModel.dart';
import '../../../routes.dart';
import '../../widgets/alert.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login> {
  @override
  void initState() {
    super.initState();
  }

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  TextEditingController userNameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  void login(username, password) async {
    if (username == null || username == '') {
      return showAlert.show(context, 'error', 'Thông báo', 'Vui lòng nhập tên đăng nhập');
    }
    if (password == null || password == '') {
      return showAlert.show(context, 'error', 'Thông báo', 'Vui lòng nhập mật khẩu');
    }
    try {
      var res = await APIHTTP.post(
          "core/authentication/login", {'UserName': username, 'PassWord': password}, null);
      if (res["Error"] == null) {
        var user = UserModel();
        user.EmployeeCode = jsonDecode(res["Data"])["Data"]['EmployeeCode'].toString();
        user.EmployeeName = jsonDecode(res["Data"])["Data"]['EmployeeFullName'].toString();
        context.read<UserBloc>().add(SetUser(user));

        await AppNavigator.push(Routes.home);
      }
    } catch (err) {
      print(err);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) => Scaffold(
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
                              // Positioned(
                              //   right: 40,
                              //   top: 40,
                              //   width: 80,
                              //   height: 150,
                              //   child: Container(
                              //       child: Container(
                              //     decoration: BoxDecoration(
                              //         image: DecorationImage(
                              //             image: AssetImage('assets/images/clock.png'))),
                              //   )),
                              // ),
                              Positioned(
                                child: Container(
                                    child: Container(
                                  margin: EdgeInsets.only(top: 50),
                                  child: Center(
                                    child: Text(
                                      "Đăng nhập",
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
                                          border: Border(
                                              bottom: BorderSide(color: (Colors.grey[100])!))),
                                      child: TextFormField(
                                        controller: userNameController,
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Tên đăng nhập",
                                            hintStyle: TextStyle(color: Colors.grey)),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: passWordController,
                                        obscureText: _obscureText,
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Mật khẩu",
                                            hintStyle: TextStyle(color: Colors.grey),
                                            suffixIcon: Padding(
                                              padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                              child: GestureDetector(
                                                onTap: _toggle,
                                                child: Icon(
                                                  _obscureText
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
                                  onTap: () => login(userNameController.text.toString(),
                                      passWordController.text.toString()),
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
                                        "Đăng nhập",
                                        style: TextStyle(
                                            color: Colors.white, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 70,
                              ),
                              Container(
                                  child: Text(
                                "v1.0.0",
                                style: TextStyle(color: Color.fromRGBO(66, 133, 250, 1)),
                              )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ))));
  }
}

class LoginModel {
  String UserName;
  String PassWord;
  LoginModel({
    required this.UserName,
    required this.PassWord,
  });
}
