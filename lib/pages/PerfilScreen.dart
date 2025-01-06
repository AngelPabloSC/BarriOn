import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  // Datos de ejemplo para mostrar en la vista
  final Map<String, String> userData = {
    "nombres": "Juan Carlos",
    "apellidos": "Pérez López",
    "sector": "Sector 3",
    "fechaNacimiento": "15/05/1990",
    "correo": "juan.perez@example.com",
    "cedula": "1234567890",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil del Usuario"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView( // Habilitar desplazamiento
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            // Imagen de fondo, opcional
            Positioned.fill(
              child: Container(
                color: Colors.blue[50], // Un color de fondo claro
              ),
            ),
            // Contenido del perfil
            Padding(
              padding: const EdgeInsets.only(top: 100.0), // Para evitar superposición con el ícono
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Foto de perfil
                  Center(
                    child: Icon(
                      Icons.account_circle,
                      size: 120,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Información del perfil en filas
                  _buildInfoRow(Icons.person, "Nombres:", userData["nombres"]!),
                  _buildInfoRow(Icons.person_outline, "Apellidos:", userData["apellidos"]!),
                  _buildInfoRow(Icons.location_on, "Sector:", userData["sector"]!),
                  _buildInfoRow(Icons.calendar_today, "Fecha de Nacimiento:", userData["fechaNacimiento"]!),
                  _buildInfoRow(Icons.email, "Correo Electrónico:", userData["correo"]!),
                  _buildInfoRow(Icons.badge, "Cédula:", userData["cedula"]!),
                  SizedBox(height: 30),
                  // Botón de regresar
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Acción de editar o regresar
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      ),
                      child: Text(
                        "Regresar",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para construir filas de información con Row
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.blueAccent, size: 28),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}