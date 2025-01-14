import 'package:flutter/material.dart';

class RegistroNotificacionCortes extends StatefulWidget {
  @override
  _RegistroNotificacionCortesState createState() =>
      _RegistroNotificacionCortesState();
}

class _RegistroNotificacionCortesState
    extends State<RegistroNotificacionCortes> {
  final _formKey = GlobalKey<FormState>();
  String? _tipoCorte;
  String? _interrupcion;
  String? _descripcion;
  DateTime? _fechaInicio;
  DateTime? _fechaFin;

  // Función para mostrar un selector de fecha
  Future<void> _selectDate(BuildContext context, bool isInicio) async {
    DateTime initialDate = DateTime.now();
    DateTime firstDate = DateTime(2020);
    DateTime lastDate = DateTime(2100);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null && picked != (isInicio ? _fechaInicio : _fechaFin)) {
      setState(() {
        if (isInicio) {
          _fechaInicio = picked;
        } else {
          _fechaFin = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Notificación de Cortes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Tipo de corte
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Tipo de Corte',
                  border: OutlineInputBorder(),
                ),
                value: _tipoCorte,
                onChanged: (String? newValue) {
                  setState(() {
                    _tipoCorte = newValue;
                  });
                },
                items: ['Luz', 'Agua']
                    .map((tipo) => DropdownMenuItem<String>(
                  value: tipo,
                  child: Text(tipo),
                ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Por favor, seleccione un tipo de corte';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Interrupción
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Interrupción',
                  border: OutlineInputBorder(),
                ),
                value: _interrupcion,
                onChanged: (String? newValue) {
                  setState(() {
                    _interrupcion = newValue;
                  });
                },
                items: ['Programada', 'No Programada']
                    .map((tipo) => DropdownMenuItem<String>(
                  value: tipo,
                  child: Text(tipo),
                ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Por favor, seleccione el tipo de interrupción';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Descripción
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Descripción',
                  border: OutlineInputBorder(),
                ),
                maxLines: 4,
                onChanged: (value) {
                  setState(() {
                    _descripcion = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese una descripción';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Fecha de inicio
              GestureDetector(
                onTap: () => _selectDate(context, true),
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Fecha de Inicio',
                      border: OutlineInputBorder(),
                      hintText: _fechaInicio == null
                          ? 'Seleccione una fecha'
                          : _fechaInicio!.toLocal().toString().split(' ')[0],
                    ),
                    validator: (value) {
                      if (_fechaInicio == null) {
                        return 'Por favor seleccione una fecha de inicio';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Fecha de fin
              GestureDetector(
                onTap: () => _selectDate(context, false),
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Fecha de Fin',
                      border: OutlineInputBorder(),
                      hintText: _fechaFin == null
                          ? 'Seleccione una fecha'
                          : _fechaFin!.toLocal().toString().split(' ')[0],
                    ),
                    validator: (value) {
                      if (_fechaFin == null) {
                        return 'Por favor seleccione una fecha de fin';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Botón de envío
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Aquí puedes manejar el envío del formulario
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Formulario Enviado')));
                  }
                },
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
