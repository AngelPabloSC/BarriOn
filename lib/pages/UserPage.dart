import 'package:flutter/material.dart';
import '../dataBase/DataBaseHelper.dart'; // Asegúrate de importar la clase DatabaseHelper

class UsuarioPage extends StatefulWidget {
  @override
  _UsuarioPageState createState() => _UsuarioPageState();
}

class _UsuarioPageState extends State<UsuarioPage> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fechaController = TextEditingController();

  // Función para insertar el usuario
  Future<void> _insertarUsuario() async {
    final String nombre = _nombreController.text;
    final String email = _emailController.text;
    final String fechaRegistro = _fechaController.text;

    if (nombre.isNotEmpty && email.isNotEmpty && fechaRegistro.isNotEmpty) {
      // Crear un mapa con los datos del usuario
      Map<String, dynamic> usuario = {
        'nombre': nombre,
        'email': email,
        'fecha_registro': fechaRegistro,
      };

      // Insertar el usuario en la base de datos
      await DatabaseHelper().insertarUsuario(usuario);

      // Mostrar un mensaje de éxito
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Usuario insertado correctamente'),
      ));

      // Limpiar los campos del formulario
      _nombreController.clear();
      _emailController.clear();
      _fechaController.clear();
    } else {
      // Si los campos están vacíos, mostrar un error
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Por favor complete todos los campos'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agregar Usuario')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nombreController,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _fechaController,
              decoration: InputDecoration(labelText: 'Fecha de Registro'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _insertarUsuario,
              child: Text('Guardar Usuario'),
            ),
          ],
        ),
      ),
    );
  }
}