import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Speciality extends StatefulWidget {
  @override
  _SpecialityState createState() => _SpecialityState();
}

List data = [];

class _SpecialityState extends State<Speciality> {
  Future getUsers() async {
    var url = 'http://10.0.3.119/chabchoub/index.php/speciality/list';
    http.Response response =
        await http.get(Uri.parse(url), headers: {"accept": "application/json"});
    setState(() {
      data = jsonDecode(response.body);
    });

    print(data.toString());
    return (data);
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(
          scrollbarTheme: ScrollbarThemeData(
              thumbColor: MaterialStateProperty.all(Colors.blueGrey),
              trackColor: MaterialStateProperty.all(Colors.blue)),
        ),
        child: Scrollbar(
          isAlwaysShown: true,
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(data[index]['f_id'].toString()),
                  title: Text(data[index]['designation']),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    child: Text('Del'),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
