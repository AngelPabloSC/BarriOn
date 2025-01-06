import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';  // Importar el paquete de caché
import 'package:barrion/theme/setting_controller.dart';
import '../components/CustomDrawe.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _cedulaController = TextEditingController();
  final TextEditingController _sectorController = TextEditingController();

  // Simula la consulta de datos
  List<Map<String, String>> _tableData = [];
  bool _dataFetched = false;

  @override
  void initState() {
    super.initState();
    _checkCacheSize();  // Verifica el tamaño de la caché al iniciar la pantalla
  }

  // Función para calcular el tamaño de la caché
  Future<void> _checkCacheSize() async {
    var customCacheManager = DefaultCacheManager(); // Usamos el cache manager predeterminado

    // No hay método directo para obtener los archivos en caché en la versión actual
    // Si tienes archivos almacenados manualmente, puedes obtener sus tamaños aquí.

    int totalCacheSize = 0;

    // Ejemplo de agregar un archivo en caché manualmente y obtener su tamaño
    var file = await customCacheManager.getSingleFile('https://w.wallhaven.cc/full/9d/wallhaven-9dqojx.jpg'); // Reemplaza con una URL real
    totalCacheSize += await file.length(); // Obtiene el tamaño del archivo

    print("Tamaño total de la caché: $totalCacheSize bytes");
  }

  // Simula la consulta de datos
  void _consultar() {
    final cedula = _cedulaController.text;
    final sector = _sectorController.text;

    // Simula la consulta con datos dummy
    if (cedula.isNotEmpty || sector.isNotEmpty) {
      setState(() {
        _tableData = [
          {
            "sector": "Sector 1",
            "servicio": "Agua",
            "motivo": "Mantenimiento",
            "fecha": "16/12/2024",
            "hora_inicio": "08:00 AM",
            "hora_fin": "12:00 PM"
          },
          {
            "sector": "Sector 2",
            "servicio": "Luz",
            "motivo": "Falla técnica",
            "fecha": "16/12/2024",
            "hora_inicio": "01:00 PM",
            "hora_fin": "04:00 PM"
          },
        ];
        _dataFetched = true;
      });
    } else {
      setState(() {
        _dataFetched = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Por favor ingrese cédula o sector para consultar")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Consulta de Servicios"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            TextField(
              controller: _cedulaController,
              decoration: InputDecoration(
                labelText: "Ingrese Cédula",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 40),
            TextField(
              controller: _sectorController,
              decoration: InputDecoration(
                labelText: "Ingrese Sector",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.map),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _consultar,
                child: Text("Consultar"),
              ),
            ),
            SizedBox(height: 20),
            _dataFetched
                ? Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Habilita el desplazamiento horizontal
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text("Sector")),
                    DataColumn(label: Text("Servicio")),
                    DataColumn(label: Text("Motivo")),
                    DataColumn(label: Text("Fecha")),
                    DataColumn(label: Text("Hora Inicio")),
                    DataColumn(label: Text("Hora Fin")),
                  ],
                  rows: _tableData
                      .map(
                        (data) => DataRow(cells: [
                      DataCell(Text(data["sector"] ?? "")),
                      DataCell(Text(data["servicio"] ?? "")),
                      DataCell(Text(data["motivo"] ?? "")),
                      DataCell(Text(data["fecha"] ?? "")),
                      DataCell(Text(data["hora_inicio"] ?? "")),
                      DataCell(Text(data["hora_fin"] ?? "")),
                    ]),
                  )
                      .toList(),
                ),
              ),
            )
                : Center(
              child: Text("No hay datos disponibles."),
            ),
          ],
        ),
      ),
    );
  }
}