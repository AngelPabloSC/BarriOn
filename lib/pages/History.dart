import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final List<Map<String, String>> cutHistory = [
    {
      'type': 'Electricidad',
      'interruption': 'Programado',
      'description': 'Mantenimiento programado en la zona norte',
      'startDate': '2025-01-01',
      'endDate': '2025-01-01',
    },
    {
      'type': 'Electricidad',
      'interruption': 'Imprevisto',
      'description': 'Falla en el transformador',
      'startDate': '2025-01-05',
      'endDate': '2025-01-05',
    },
    {
      'type': 'Electricidad',
      'interruption': 'Programado',
      'description': 'Reemplazo de cables de alta tensión',
      'startDate': '2025-01-10',
      'endDate': '2025-01-10',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Historial de Cortes de Luz"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Hacer scroll cuando el contenido no cabe
          child: FittedBox( // Ajusta la tabla al tamaño de la pantalla
            fit: BoxFit.scaleDown, // Hace que la tabla se ajuste sin desbordar
            child: DataTable(
              columns: [
                DataColumn(label: Text('Tipo de Corte')),
                DataColumn(label: Text('Interrupción')),
                DataColumn(label: Text('Descripción')),
                DataColumn(label: Text('Fecha de Inicio')),
                DataColumn(label: Text('Fecha de Fin')),
              ],
              rows: cutHistory
                  .map(
                    (cut) => DataRow(
                  cells: [
                    DataCell(Text(cut['type']!)),
                    DataCell(Text(cut['interruption']!)),
                    DataCell(Text(cut['description']!)),
                    DataCell(Text(cut['startDate']!)),
                    DataCell(Text(cut['endDate']!)),
                  ],
                ),
              )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}