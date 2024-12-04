import 'package:evaluacion1/main.dart';
import 'package:evaluacion1/screens/screen2.dart';
import 'package:evaluacion1/screens/screen3.dart';
import 'package:flutter/material.dart';

class MiDrawer extends StatelessWidget {
  const MiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("Pantalla 1"),
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> Evaluacion())),
          ),
          ListTile(
            title: Text("Pantalla 2"),
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> Screen2())),
          ),
          ListTile(
            title: Text("Pantalla 3"),
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> Screen3())),
          ),
        ],
      ),
    );
  }
}