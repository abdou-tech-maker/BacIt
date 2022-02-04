import 'package:flutter/material.dart';
import 'package:myapp/Constantes.dart';
import 'package:google_fonts/google_fonts.dart';

class Result extends StatelessWidget {
  final Function resetHandler;
  final int resultScore;
  String get resultphrase {
    var resultText = '';
    if (resultScore <= 60) {
      resultText =
          'Result: i find you compatible to these domains => 20% Science and technologie, 40 % Doctor, 13% Mathematics ,27% French language ';
    } else if (resultScore <= 80) {
      resultText =
          'Result: i find you compatible to these domains => 33% Science and technologie, 25 % Doctor, 17% Mathematics ,25% English  ';
    } else if (resultScore <= 100) {
      resultText =
          'Result: i find you compatible to these domains => 27% Gestion, 31 % Geologie, 17% Biologie ,25% arabic  ';
    } else if (resultScore > 100) {
      resultText =
          'Result: i find you compatible to these domains => 33% Sports, 45 % gestion, 12% lawSchool ,10% Sociologie  ';
    }
    return resultText;
  }

  Result(this.resultScore, this.resetHandler);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  resultphrase,
                  style: /* TextStyle(fontSize: 22, fontWeight: FontWeight.bold)*/ GoogleFonts
                      .pacifico(textStyle: style),
                ),
                ElevatedButton(
                    onPressed: resetHandler,
                    child: Text(
                      'Restart Test',
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
