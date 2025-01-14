import 'package:flutter/material.dart';
import 'package:intl/intl.dart';  // Importa intl

class RegisterCut extends StatefulWidget {
  @override
  _RegisterCutState createState() => _RegisterCutState();
}

class _RegisterCutState extends State<RegisterCut> {
  final _formKey = GlobalKey<FormState>();
  String? _cutType;
  String? _interruption;
  String? _description;
  DateTime? _startDate;
  DateTime? _endDate;

  // Formato de la fecha
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  Future<void> _selectDate(BuildContext context, bool isStart) async {
    DateTime initialDate = DateTime.now();
    DateTime firstDate = DateTime(2020);
    DateTime lastDate = DateTime(2100);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null && picked != (isStart ? _startDate : _endDate)) {
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,  // No permitir cerrar el cuadro de carga
      builder: (context) {
        return AlertDialog(
          title: Text('Enviando...'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Estamos procesando tu solicitud...'),
            ],
          ),
        );
      },
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _showLoadingDialog();

      // Simulamos el proceso de envío de datos con un retraso
      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context).pop(); // Cerrar el cuadro de carga
        _showSuccessDialog();
      });
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Éxito'),
          content: Text('El corte ha sido registrado exitosamente.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();  // Cerrar el cuadro de éxito

                // Limpiar los datos del formulario
                setState(() {
                  _cutType = null;
                  _interruption = null;
                  _description = '';
                  _startDate = null;
                  _endDate = null;
                });
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Corte'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Tipo de Corte',
                  border: OutlineInputBorder(),
                ),
                value: _cutType,
                onChanged: (String? newValue) {
                  setState(() {
                    _cutType = newValue;
                  });
                },
                items: ['Electricidad', 'Agua']
                    .map((type) => DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Por favor selecciona un tipo de corte';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Interrupción',
                  border: OutlineInputBorder(),
                ),
                value: _interruption,
                onChanged: (String? newValue) {
                  setState(() {
                    _interruption = newValue;
                  });
                },
                items: ['Programado', 'Imprevisto']
                    .map((type) => DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Por favor selecciona el tipo de interrupción';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Descripción',
                  border: OutlineInputBorder(),
                ),
                maxLines: 4,
                onChanged: (value) {
                  setState(() {
                    _description = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa una descripción';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () => _selectDate(context, true),
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Fecha de Inicio',
                      border: OutlineInputBorder(),
                      hintText: _startDate == null
                          ? 'Selecciona una fecha'
                          : dateFormat.format(_startDate!),
                    ),
                    validator: (value) {
                      if (_startDate == null) {
                        return 'Por favor selecciona una fecha de inicio';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () => _selectDate(context, false),
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Fecha de Fin',
                      border: OutlineInputBorder(),
                      hintText: _endDate == null
                          ? 'Selecciona una fecha'
                          : dateFormat.format(_endDate!),
                    ),
                    validator: (value) {
                      if (_endDate == null) {
                        return 'Por favor selecciona una fecha de fin';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Registrar Corte'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}