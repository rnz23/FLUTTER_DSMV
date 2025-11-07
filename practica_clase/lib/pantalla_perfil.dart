import 'package:flutter/material.dart';
import 'package:practica_clase/pantalla_editar_perfil.dart';


class PantallaPerfil extends StatefulWidget {
  const PantallaPerfil({super.key});

  @override
  State<PantallaPerfil> createState() => _PantallaPerfilState();
}

class _PantallaPerfilState extends State<PantallaPerfil> {
  String _nombreUsuario = "Renzo Murillo"; // Nombre inicial

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Foto de perfil
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue[100],
              border: Border.all(color: Colors.blue, width: 2),
            ),
            child: Icon(
              Icons.person,
              size: 50,
              color: Colors.blue,
            ),
          ),

          const SizedBox(height: 20),

          // Nombre del usuario (se actualiza al editar)
          Text(
            _nombreUsuario,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          Text(
            "Edad: 20",
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),

          const SizedBox(height: 30),

          // BOTÓN PARA EDITAR PERFIL - ACTIVIDAD 2
          ElevatedButton(
            onPressed: () async {
              // Navega a la pantalla de editar perfil y espera el resultado
              final nombre = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PantallaEditarPerfil(),
                ),
              );

              // Si se recibió un nombre, actualiza el estado
              if (nombre != null) {
                setState(() {
                  _nombreUsuario = nombre;
                });
              }
            },
            child: const Text('Editar perfil'),
          ),
        ],
      ),
    );
  }
}