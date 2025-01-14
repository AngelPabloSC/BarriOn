import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../dataBase/DataBaseHelper.dart';
class ListaUsuariosPage extends StatefulWidget {

  @override
  _ListaUsuariosPageState createState() => _ListaUsuariosPageState();
}

class _ListaUsuariosPageState extends State<ListaUsuariosPage> {
  late Future<List<Map<String, dynamic>>> _usuarios;

  @override
  void initState() {
    super.initState();
    _usuarios = _obtenerUsuarios();
  }

  // Función para obtener todos los usuarios
  Future<List<Map<String, dynamic>>> _obtenerUsuarios() async {
    return await DatabaseHelper().obtenerUsuarios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Usuarios')),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _usuarios,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final usuario = snapshot.data![index];
                return ListTile(
                  title: Text(usuario['nombre']),
                  subtitle: Text(usuario['email']),
                );
              },
            );
          } else {
            return Center(child: Text('No hay usuarios registrados'));
          }
        },
      ),
    );
  }
}