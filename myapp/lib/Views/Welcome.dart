import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Constantes.dart';
import 'package:myapp/Views/Choose.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' Welcome New Bachelors  : ',
          style: GoogleFonts.pacifico(textStyle: style),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 30),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'asset/images/student.png',
            width: 250,
            height: 500,
            fit: BoxFit.cover,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 7.5, right: 7.5, left: 7.5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Choose();
                          },
                        ),
                      );
                    },
                    child: Text(
                      'Get Started ! ',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
