import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Home.dart'; // Asegúrate de importar la pantalla de Consultas

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Lista simulada de usuarios y contraseñas
  final List<Map<String, String>> users = [
    {"username": "Lanicole", "password": "test123"},
    {"username": "user1", "password": "password1"},
    {"username": "user2", "password": "password2"},
  ];

  bool _isLoading = false; // Variable para controlar el estado de carga

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Nombre de usuario',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading
                  ? null // Deshabilitar el botón mientras se está cargando
                  : () async {
                setState(() {
                  _isLoading = true; // Mostrar indicador de carga
                });

                String username = usernameController.text;
                String password = passwordController.text;

                // Verificar si el usuario y la contraseña coinciden con los datos simulados
                bool isValid = false;
                for (var user in users) {
                  if (user['username'] == username && user['password'] == password) {
                    isValid = true;
                    break;
                  }
                }

                await Future.delayed(Duration(seconds: 2)); // Simular retraso

                setState(() {
                  _isLoading = false; // Ocultar indicador de carga
                });

                if (isValid) {
                  // Redirigir a la página de consultas después de un inicio de sesión exitoso
                  Navigator.pushReplacementNamed(context, '/');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Credenciales inválidas")));
                }
              },
              child: _isLoading
                  ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ) // Mostrar el indicador de carga
                  : Text("Iniciar sesión"),
            ),
          ],
        ),
      ),
    );
  }
}