import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Views/adminpanel/Speciality.dart';
import 'package:myapp/Views/adminpanel/Users.dart';
import 'package:myapp/Views/adminpanel/domain.dart';
import '../../Constantes.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' list ${controller.index + 1} ',
          style: GoogleFonts.pacifico(textStyle: style),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: controller,
          tabs: [
            Tab(text: 'Users', icon: Icon(Icons.person)),
            Tab(text: 'specialities', icon: Icon(Icons.star)),
            Tab(text: 'domains', icon: Icon(Icons.domain)),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          User(),
          Speciality(),
          Domain(),
        ],
      ),
    );
  }
}
