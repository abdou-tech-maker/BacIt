import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Views/Welcome.dart';
//import 'package:myapp/Views/Choose.dart';
import '../Constantes.dart';
import 'package:http/http.dart' as http;

class Signup extends StatefulWidget {
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController bacidctl = TextEditingController();
  TextEditingController dbacctl = TextEditingController();
  TextEditingController nameectl = TextEditingController();
  TextEditingController familynamectl = TextEditingController();
  TextEditingController emailctl = TextEditingController();
  TextEditingController passctl = TextEditingController();
  int id;

  Future register(BuildContext cont) async {
    if (bacidctl.text == "" ||
        dbacctl.text == "" ||
        nameectl.text == "" ||
        familynamectl.text == "" ||
        emailctl.text == "" ||
        passctl.text == "") {
      Fluttertoast.showToast(
          msg: 'All fields Must Be Filled ! ',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          fontSize: 16.0);
    } else {
      var response = await http
          .post(Uri.http('10.0.3.119', '/Apriori_app/signup.php'), body: {
        "BacId": bacidctl.text,
        "D_Bac": dbacctl.text,
        "Namee": nameectl.text,
        "family_name": familynamectl.text,
        "email": emailctl.text,
        "pass": passctl.text,
        "typee": "2",
      });
      id = int.parse(dbacctl.text);
      print(id);

      var data = jsonDecode(response.body);
      if (data == "success") {
        Fluttertoast.showToast(
            msg: 'Signup succeded',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            fontSize: 16.0);
        Navigator.push(
            cont, MaterialPageRoute(builder: (context) => Welcome()));
      } else {
        Fluttertoast.showToast(
            msg: 'Signup Failed',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            fontSize: 16.0);
      }
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
        title: Text(
          ' Signup : ',
          style: GoogleFonts.pacifico(textStyle: style),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
          bottom: 70,
        ),
        child: SingleChildScrollView(
          reverse: true,
          padding: EdgeInsets.only(top: 20, left: 5, right: 5, bottom: 30),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.white38,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: nameectl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: "Enter student Name",
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.white38,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: familynamectl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'FamilyName',
                    hintText: "Enter student Family Name",
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.white38,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: bacidctl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Bac_Id',
                    hintText: "Enter student Bac ID",
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.white38,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: dbacctl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Bac_Domain',
                    hintText: "Enter student Bac domain",
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.white38,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: emailctl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: "Enter student Email",
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.white38,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: passctl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: hidePassword
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                      onPressed: hideMyPass,
                    ),
                    labelText: 'Password',
                    hintText: "Enter student  Password",
                  ),
                  obscureText: hidePassword ? true : false,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      register(context);
                    },
                    child: Text(
                      "Sign Up ",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
