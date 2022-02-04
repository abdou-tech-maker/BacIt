import 'package:flutter/material.dart';
//import 'package:myapp/Algorithme/Essay.dart';
import 'package:myapp/Algorithme/Science.dart';
/*import 'package:myapp/Algorithme/Gestion.dart';

import 'package:myapp/Algorithme/Langue.dart';
import 'package:myapp/Algorithme/lettre.dart';*/

import '../Orientation_test/Orient.dart';
import 'package:myapp/Orientation_test/Orient.dart';
import '../Constantes.dart';
import 'package:google_fonts/google_fonts.dart';

class Choose extends StatefulWidget {
  @override
  _ChooseState createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  /*getlist(id) {
    

    switch (id) {
      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Science()));
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Science()));
        break;
      case 3:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Science()));
        break;
      case 4:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Gestion()));
        break;
      case 5:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Langue()));
        break;
      case 6:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Lettre()));
        break;
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' How we\'re Gonna help you ? : ',
          style: GoogleFonts.pacifico(textStyle: style),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/images/login.png',
              width: 350,
              height: 350,
              fit: BoxFit.cover,
            ),
            // put an image here
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
                              return Science();
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Choose',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 7.5, right: 7.5, left: 7.5),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Orient();
                            },
                          ),
                        );
                      },
                      child: Text(
                        'HelpMe',
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
    );
  }
}
