import 'package:flutter/material.dart';
import 'package:evaluacion1/navegadores/drawer.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pantalla2"),
      ),
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://www.tuproyectodevida.pe/wp-content/uploads/2021/10/profesiones-vinculadas-autos-1200x628.jpg"),
                fit: BoxFit.cover, // Asegura que la imagen cubra todo el fondo
              ),
            ),
          ),
          // Contenido encima de la imagen
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "Ejercicio01",
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: velocidad_inicial(),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: velocidad_final(),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: calcular_btn(context),
              ),
            ],
          ),
        ],
      ),
      drawer: MiDrawer(),
    );
  }
}

// IMAGEN
Widget imagenURL() {
  return Image.network(
    "https://www.tuproyectodevida.pe/wp-content/uploads/2021/10/profesiones-vinculadas-autos-1200x628.jpg",
  );
}

TextEditingController _velocidad_inicial = TextEditingController();
Widget velocidad_inicial() {
  return TextField(
    controller: _velocidad_inicial,
    decoration: InputDecoration(
      labelText: "Velocidad inicial (m/s)",
      labelStyle: TextStyle(color: Colors.white), // Color del label
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white), // Color del borde
      ),
    ),
    keyboardType: TextInputType.number,
    style: TextStyle(color: Colors.white), // Color del texto ingresado
  );
}

TextEditingController _velocidad_final = TextEditingController();
Widget velocidad_final() {
  return TextField(
    controller: _velocidad_final,
    decoration: InputDecoration(
      labelText: "Velocidad final (m/s)",
      labelStyle: TextStyle(color: Colors.white), // Color del label
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white), // Color del borde
      ),
    ),
    keyboardType: TextInputType.number,
    style: TextStyle(color: Colors.white), // Color del texto ingresado
  );
}

Widget calcular_btn(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      double tiempo = t(); 

      String resultado = tiempo >= 10 ? 
          '¡El vehículo no aprobó la prueba! El tiempo es: $tiempo segundos' :
          'El vehículo aprobó la prueba. El tiempo es: $tiempo segundos';

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Resultado"),
            content: Text(resultado),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cerrar"),
              ),
            ],
          );
        },
      );
    },
    child: Text("Calcular"),
  );
}

double t() {
  double aceleracion = 10.0;

  double velocidad_inicial = double.parse(_velocidad_inicial.text);
  double velocidad_final = double.parse(_velocidad_final.text);

  return (velocidad_final - velocidad_inicial) / aceleracion;
}
