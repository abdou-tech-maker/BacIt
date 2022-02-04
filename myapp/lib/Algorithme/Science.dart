import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Algorithme/chosen.dart';
import 'package:myapp/Constantes.dart';
import 'checkbox.dart';
//import 'package:myapp/Views/Signup.dart';

class Science extends StatefulWidget {
  @override
  _ScienceState createState() => _ScienceState();
}

class _ScienceState extends State<Science> {
  List<String> selectedData = [];
  bool selected = true;
  List<String> data = [];

  final sfield = [
    CheckBoxState(title: "علوم وتكنولوجيا ", designation: "D01"),
    CheckBoxState(title: "علوم المادة ", designation: "D02"),
    CheckBoxState(title: "رياضيات و إعلام آلي ", designation: "D03"),
    CheckBoxState(title: "علوم الطبيعة والحياة", designation: "D04"),
    CheckBoxState(title: "علوم الأرض والكون ", designation: "D05"),
    CheckBoxState(
        title: "علوم اقتصادية ,والتسيير وعلوم تجارية", designation: "D06"),
    CheckBoxState(title: "حقوق وعلوم سياسية ", designation: "D07"),
    CheckBoxState(title: "آداب ولغات أجنبية ", designation: "D08"),
    CheckBoxState(title: "علوم انسانية واجتماعية ", designation: "D09"),
    CheckBoxState(
        title: "علوم وتقنيات النشاطات البدنية والرياضية ", designation: "D10"),
    CheckBoxState(title: "فنون ", designation: "D11"),
    CheckBoxState(title: "اللغة والأدب العربي  ", designation: "D12"),
    CheckBoxState(title: "لغة وثقافة أمازيغية ", designation: "D13"),
    CheckBoxState(title: "طب و بيطرة", designation: "D14"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose your field : "),
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
          child: ListView(
            padding: EdgeInsets.all(10),
            children: [
              ...sfield.map(buildSingleCheckbox).toList(),
              new ElevatedButton(
                  child: new Text(
                    "Submit",
                    style: GoogleFonts.pacifico(textStyle: style2),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Chosen(data: data);
                        },
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSingleCheckbox(CheckBoxState checkbox) => CheckboxListTile(
        isThreeLine: true,
        activeColor: Colors.purple,
        value: checkbox.value,
        title: Text(
          checkbox.title,
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Text(checkbox.designation, style: TextStyle(fontSize: 18)),
        onChanged: (selected) {
          selectedData.add(checkbox.title);

          showsuggestionSc(context);
          showsuggestionmath(context);
          showsuggestions(context);

          setState(() {
            checkbox.value = !(checkbox.value);
            data += selectedData;
            selectedData = [];
          });
          print(data);
        },
        dense: true,
      );
}
