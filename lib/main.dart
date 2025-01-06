import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/setting_controller.dart';
import 'screens/home_screen.dart';
import './pages/PerfilScreen.dart';
import './pages/consultas_screen.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

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
            },
          );
        },
      ),
    );
  }
}

class CacheExample extends StatelessWidget {
  final CacheManager cacheManager = DefaultCacheManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cache Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Ejemplo de guardar un archivo en caché
            final file = await cacheManager.getSingleFile('https://example.com/image.jpg');
            print('Archivo guardado en caché: ${file.path}');
          },
          child: Text('Guardar archivo en caché'),
        ),
      ),
    );
  }
}