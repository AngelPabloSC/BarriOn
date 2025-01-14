import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:barrion/theme/setting_controller.dart';

class HomeScreen extends StatelessWidget {
  // Define una clave global para el Scaffold.
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Asigna la clave al Scaffold.
      appBar: AppBar(
        title: Text("Theme Manager"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer(); // Abre el Drawer usando la clave.
          },
        ),
      ),
      drawer: CustomDrawer(), // Aquí usamos el CustomDrawer.
      body: Center(
        child: Text("Bienvenido, Cambie su tema."),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settingController = context.watch<SettingController>();

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/profile_picture.png'),
                ),
                SizedBox(height: 10),
                Text(
                  "Usuario",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),

          ListTile(
            leading: Icon(Icons.home),
            title: Text("Inicio"),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          // Opciones de navegación
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Perfil"),
            onTap: () {
              Navigator.pushNamed(context, '/perfil');
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("CrearUSuario"),
            onTap: () {
              Navigator.pushNamed(context, '/CreateUSer');
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.search),
          //   title: Text("Consultas"),
          //   onTap: () {
          //     Navigator.pushNamed(context, '/consultas');
          //   },
          // ),
          ListTile(
            leading: Icon(Icons.app_registration),
            title: Text("Lista"),
            onTap: () {
              Navigator.pushNamed(context, '/ListUser');
            },

          ),
          ListTile(
            leading: Icon(Icons.app_registration),
            title: Text("Registro De Corte"),
            onTap: () {
              Navigator.pushNamed(context, '/RegistroCorte');
            },

          ),

          ListTile(
            leading: Icon(Icons.app_registration),
            title: Text("Registro Usuario"),
            onTap: () {
              Navigator.pushNamed(context, '/RegistroUsuario');
            },

          ),
          ListTile(
            leading: Icon(Icons.login_outlined),
            title: Text("Login"),
            onTap: () {
              Navigator.pushNamed(context, '/Login');
            },
          ),

          ListTile(
            leading: Icon(Icons.query_builder),
            title: Text("History"),
            onTap: () {
              Navigator.pushNamed(context, '/Historial');
            },
          ),
          Spacer(), // Empuja los botones hacia la parte inferior del Drawer
          Divider(), // Línea divisoria
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // Botón de cambio de tema
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Modo oscuro"),
                    Switch(
                      value: settingController.themeMode == ThemeMode.dark,
                      onChanged: (value) {
                        settingController.setThemeMode(
                          value ? ThemeMode.dark : ThemeMode.light,
                        );
                      },
                    ),
                  ],
                ),

                SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    // Acción para cerrar sesión
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  icon: Icon(Icons.logout),
                  label: Text("Cerrar sesión"),
                  style: ElevatedButton.styleFrom(
             // Cambiado de primary a backgroundColor
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}