import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
//import 'package:myapp/Algorithme/Apriori.dart';
import 'package:myapp/Constantes.dart';

class Essay extends StatefulWidget {
  @override
  _EssayState createState() => _EssayState();
}

class _EssayState extends State<Essay> {
  final _formkey = GlobalKey<FormState>();
  List selectedData = [];

  bool selected = false;

  /* Future<List> getData() async {
    var url = Uri.parse('https://192.168.1.36/chabchoub/index.php/field/list');
    var response = await http.get(url, headers: {"accept": "application/json"});
    var jsonBody = response.body;
    var jsonData = jsonDecode(jsonBody);

    return jsonData;
  }*/
  /* Future<List> getData() async {
    var url = Uri.parse("https://192.168.1.36/chabchoub/index.php/field/list");
    http.Response response =
        await http.get(url, headers: {"accept": "application/json"});
    return json.decode(response.body);
  }*/

  Future getData() async {
    var url = 'http://10.0.3.119/chabchoub/index.php/field/list';
    http.Response response =
        await http.get(Uri.parse(url), headers: {"accept": "application/json"});
    var data = jsonDecode(response.body);
    print(data.toString());
    return (data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Choose your field : ",
          style: GoogleFonts.pacifico(textStyle: style),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          scrollbarTheme: ScrollbarThemeData(
              thumbColor: MaterialStateProperty.all(Colors.blueGrey),
              trackColor: MaterialStateProperty.all(Colors.blue)),
        ),
        child: Scrollbar(
          isAlwaysShown: true,
          thickness: 10,
          child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  new Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(children: [
                          Text(
                            'Choose Your fields ',
                            style: GoogleFonts.pacifico(textStyle: style),
                          )
                        ]),
                      ),
                      new FutureBuilder<dynamic>(
                          future: getData(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) print(snapshot.error);
                            return snapshot.hasData
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, index) {
                                      //List list = snapshot.data;
                                      return CheckboxListTile(
                                        isThreeLine: true,
                                        title: Text(
                                          snapshot.data[index]['f_name'],
                                          style: style3,
                                        ),
                                        subtitle: Text(
                                          snapshot.data[index]['designation'],
                                          style: style3,
                                        ),
                                        value: selected,
                                        onChanged: (bool newSelected) {
                                          //    apriori_reel('I', 'D');
                                          setState(() {
                                            selected = newSelected;
                                          });
                                        },
                                        dense: true,
                                      );
                                    })
                                : new Center(
                                    child: new CircularProgressIndicator());
                          }),
                      new ElevatedButton(
                          child: new Text(
                            "Submit",
                            style: GoogleFonts.pacifico(textStyle: style2),
                          ),
                          onPressed: () {
                            showAlertDialog(context);
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
