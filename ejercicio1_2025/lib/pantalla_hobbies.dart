import 'package:flutter/material.dart';

class PantallaHobbies extends StatelessWidget {
  const PantallaHobbies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mis Hobbies"),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Mis actividades favoritas:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange[800],
              ),
            ),

            SizedBox(height: 30),

            // Grid de 2 columnas
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // 2 columnas
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  // Hobby 1 - Música
                  _buildHobbyItem(
                    Icons.music_note,
                    "Música",
                    Colors.orange,
                  ),

                  // Hobby 2 - Videojuegos
                  _buildHobbyItem(
                    Icons.sports_esports,
                    "Videojuegos",
                    Colors.blue,
                  ),

                  // Hobby 3 - Handball
                  _buildHobbyItem(
                    Icons.sports_handball,
                    "Handball",
                    Colors.green,
                  ),

                  // Hobby 4 - Viajar
                  _buildHobbyItem(
                    Icons.travel_explore,
                    "Viajar",
                    Colors.purple,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para cada item del hobby
  Widget _buildHobbyItem(IconData icon, String text, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: color,
          ),
          SizedBox(height: 10),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}