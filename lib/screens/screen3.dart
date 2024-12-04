import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pantalla3"),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://submarinetenerife.com/wp-content/uploads/2024/03/submarino-como-funciona.jpg"),
                fit: BoxFit.cover, 
              ),
            ),
          ),
    
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text("Ejercicio02", 
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: altura(),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: presion_btn(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

TextEditingController _altura = TextEditingController();

Widget altura() {
  return TextField(
    controller: _altura,
    decoration: InputDecoration(
      labelText: "Altura (m)",
      labelStyle: TextStyle(color: Colors.white), 
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white), 
      ),
    ),
    keyboardType: TextInputType.number,
    style: TextStyle(color: Colors.white), 
  );
}

Widget presion_btn(BuildContext context) {
  return ElevatedButton.icon(
    onPressed: () {
      double presionCalculada = presion();
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Presión"),
            content: Text("La presión es: ${presionCalculada.toStringAsFixed(2)}"),
          );
        }
      );
    },
    icon: Icon(Icons.calculate),
    label: Text("Calcular"),
  );
}

double presion() {
  if (_altura.text.isEmpty) {
    return 0.0;
  }
  double densidad = 1025; 
  double gravedad = 9.8; 
  
  double altura = double.parse(_altura.text);

  return densidad * gravedad * altura;
}
