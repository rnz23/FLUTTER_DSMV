import 'package:flutter/material.dart';

class PantallaEditarPerfil extends StatefulWidget {
  const PantallaEditarPerfil({super.key});

  @override
  State<PantallaEditarPerfil> createState() => _PantallaEditarPerfilState(); // NOMBRE CORREGIDO
}

class _PantallaEditarPerfilState extends State<PantallaEditarPerfil> { // NOMBRE CORREGIDO
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campo de texto para capturar el nombre - ACTIVIDAD 3
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // Botón para guardar - ACTIVIDAD 4
            ElevatedButton(
              onPressed: () {
                // Regresa el nombre capturado a la pantalla anterior
                Navigator.pop(context, _controller.text);
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}