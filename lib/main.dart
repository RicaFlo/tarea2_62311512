import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
//comentario extra
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PantallaInicio(),
    );
  }
}

class PantallaInicio extends StatefulWidget {
  const PantallaInicio({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PantallaInicioState createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  final TextEditingController _controladorVar1 = TextEditingController();
  final TextEditingController _controladorVar2 = TextEditingController();
  String _operacionSeleccionada = 'Suma';
  double _resultado = 0;

  void _calcularResultado() {
    double var1 = double.tryParse(_controladorVar1.text) ?? 0;
    double var2 = double.tryParse(_controladorVar2.text) ?? 0;

    setState(() {
      switch (_operacionSeleccionada) {
        case 'Suma':
          _resultado = var1 + var2;
          break;
        case 'Resta':
          _resultado = var1 - var2;
          break;
        case 'Multiplicacion':
          _resultado = var1 * var2;
          break;
        case 'Division':
          _resultado = var2 != 0 ? var1 / var2 : 0;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Operaciones Aritméticas')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextField(
                  controller: _controladorVar1,
                  decoration: const InputDecoration(labelText: 'Primer Valor', hintText: 'Ingrese un número'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _controladorVar2,
                  decoration: const InputDecoration(labelText: 'Segundo Valor', hintText: 'Ingrese un número'),
                  keyboardType: TextInputType.number,
                ),
                DropdownButton<String>(
                  value: _operacionSeleccionada,
                  onChanged: (String? nuevoValor) {
                    setState(() {
                      _operacionSeleccionada = nuevoValor!;
                    });
                  },
                  items: <String>['Suma', 'Resta', 'Multiplicacion', 'Division']
                      .map<DropdownMenuItem<String>>((String valor) {
                    return DropdownMenuItem<String>(
                      value: valor,
                      child: Text(valor),
                    );
                  }).toList(),
                ),
                ElevatedButton(
                  onPressed: _calcularResultado,
                  child: const Text('Calcular'),
                ),
                Text('Resultado: $_resultado'),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                'Ricardo Flores 62311512',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
