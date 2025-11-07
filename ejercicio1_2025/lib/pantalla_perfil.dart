import 'package:flutter/material.dart';

class PantallaPerfil extends StatelessWidget {
  const PantallaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi Perfil"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          // Ícono de perfil (simple y funcional)
          Container(
            margin: const EdgeInsets.all(20),
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green[100],
              border: Border.all(color: Colors.green, width: 2),
            ),
            child: Icon(
              Icons.person,
              size: 50,
              color: Colors.green,
            ),
          ),

          // Nombre
          Text(
            "Renzo Murillo Alvarez",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.green[800],
            ),
          ),

          // Edad
          Text(
            "Edad: 20",
            style: TextStyle(
                fontSize: 16,
                color: Colors.green
            ),
          ),

          // Descripción
          Container(
            margin: const EdgeInsets.all(15),
            child: Text(
              "Estudiante de Ingenieria de Software",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
          ),

          // Información de contacto
          Container(
            margin: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              "Información de contacto",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green[700],
              ),
            ),
          ),

          // Línea divisoria
          Container(
            height: 1,
            color: Colors.grey[300],
            margin: const EdgeInsets.symmetric(horizontal: 20),
          ),

          // Información de contacto
          Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Email
                Row(
                  children: [
                    Icon(Icons.email, color: Colors.green),
                    SizedBox(width: 10),
                    Text("renzo.murillo@email.com"),
                  ],
                ),

                SizedBox(height: 15),

                // Teléfono
                Row(
                  children: [
                    Icon(Icons.phone, color: Colors.green),
                    SizedBox(width: 10),
                    Text("+51 987 654 321"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}