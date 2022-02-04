import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Constantes.dart';

class Chosen extends StatefulWidget {
  List<String> data = [];
  Chosen({this.data});
  @override
  _ChosenState createState() => _ChosenState(data);
}

class _ChosenState extends State<Chosen> {
  List<String> data = [];
  _ChosenState(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chosen fields : ",
            style: GoogleFonts.pacifico(textStyle: style)),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                data[index],
                style: TextStyle(fontSize: 20),
              ),
              trailing: ElevatedButton(
                onPressed: () {},
                child: Text('Del'),
              ),
            );
          },
        ),
      ),
    );
  }
}
