import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Views/Signup.dart';
import 'package:myapp/Views/Welcome.dart';
import '../Constantes.dart';
import 'package:http/http.dart' as http;
//gimport 'dart:convert';
import 'package:myapp/Views/adminpanel/Admin.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String error = '';
  int msg;
  TextEditingController bacidController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future login() async {
    var response = await http
        .post(Uri.http('10.0.3.119', '/chabchoub/index.php/user/login'), body: {
      'BacId': bacidController.text,
      'pass': passwordController.text,
    });
    setState(() {
      print(response.body);
      msg = int.parse(response.body);
      print(response.body);
    });
    switch (msg) {
      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Admin()));
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Welcome()));
        break;
      case 0:
        setState(() {
          error = 'false';
        });
        break;
    }
  }

  bool hidePassword = true;
  void hideMyPass() {
    if (hidePassword) {
      setState(() {
        hidePassword = false;
      });
    } else {
      setState(() {
        hidePassword = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.blueAccent,
          backgroundColor: Colors.bluee[900],
          title: Text(
            ' Login : ',
            style: GoogleFonts.pacifico(textStyle: style),
          ),
        ),
        resizeToAvoidBottomInset: true,
        body: Padding(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 30),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Center(
                      child: Text(
                        'New Bachelors Registration App',
                        style: GoogleFonts.pacifico(
                            textStyle: style, color: Colors.blueGrey),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      child: TextField(
                        controller: bacidController,
                        decoration: InputDecoration(
                            errorText: error == 'null'
                                ? ' Bac_Id Does not exist '
                                : null,
                            border: OutlineInputBorder(),
                            labelText: 'Bac_Id',
                            hintText: 'Enter Your Bac Id '),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            child: TextField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                  errorText: error == 'false'
                                      ? 'incorrect login information '
                                      : null,
                                  border: OutlineInputBorder(),
                                  suffixIcon: IconButton(
                                    icon: hidePassword
                                        ? Icon(Icons.visibility)
                                        : Icon(Icons.visibility_off),
                                    onPressed: hideMyPass,
                                  ),
                                  labelText: 'password',
                                  hintText: 'Enter Your Password'),
                              obscureText: hidePassword ? true : false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 7.5, right: 7.5, left: 7.5),
                            child: ElevatedButton(
                              onPressed: login,
                              child: Text(
                                'Login',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 7.5, right: 7.5, left: 7.5),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Signup();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                'Signup',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ])));
  }
}
