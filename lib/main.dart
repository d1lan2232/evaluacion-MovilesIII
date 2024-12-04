import 'package:evaluacion1/navegadores/drawer.dart';
import 'package:evaluacion1/screens/screen2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Evaluacion());
}

class Evaluacion extends StatelessWidget {
  const Evaluacion({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Cuerpo(),
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Evaluacion 1"),
      ),
      body: Stack(
        children: [
          
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://thumbs.dreamstime.com/b/el-perro-de-perrito-havanese-rojizo-feliz-hermoso-est%C3%A1-sentando-el-frontal-46868560.jpg"),
                fit: BoxFit.cover, 
              ),
            ),
          ),
          
          Column(
            children: [
              Center(child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Dilan Torres", style: TextStyle(fontSize: 34, color: const Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold)),
              )),
              Center(child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("d1lan2232", style: TextStyle(fontSize: 24, color: const Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold)),
              )),
              Center(child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: boton_alerta(context),
              )),
            ],
          ),
        ],
      ),
      drawer: MiDrawer(),
    );
  }
}


Widget boton_alerta(context) {
  return ElevatedButton.icon(
    onPressed: () => navegar02(context),
    label: Text("Ir a la pagina2"),
  );
}

void navegar02(context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Screen2()));
}
