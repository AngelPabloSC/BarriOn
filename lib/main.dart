import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/setting_controller.dart';
import './pages/PerfilScreen.dart';
import './pages/Login.dart';
import './pages/History.dart';
import './pages/RegisterCut.dart';
import './pages/RegisterUser.dart';
import './pages/Home.dart';
import './pages/consultas_screen.dart';
import './pages/UserPage.dart';
import './pages/ListarUsuarios.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SettingController(),
      child: Consumer<SettingController>(
        builder: (context, settingController, child) {
          return MaterialApp(
            themeMode: settingController.themeMode,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            initialRoute: '/',
            routes: {
              '/': (context) => HomeScreen(),
              '/perfil': (context) => PerfilScreen(),
              '/consultas': (context) => ConsultasScreen(),
              '/Login': (context) => LoginPage(),
              '/RegistroCorte': (context) => RegisterCut(),
              '/RegistroUsuario':(context)=>RegisterUser(),
              '/Historial':(context)=>HistoryPage(),
              '/CreateUSer':(context)=> UsuarioPage(),
              '/ListUser':(context)=> ListaUsuariosPage(),
            },
          );

        },
      ),
    );
  }
}
