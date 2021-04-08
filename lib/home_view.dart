import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final _heightController = TextEditingController();

  
  final _weightController = TextEditingController();

  double _bmi;

  String _message = '  ';

  void _calculate() {
    final double height = double.tryParse(_heightController.value.text);
    final double weight = double.tryParse(_weightController.value.text);

    if (height <= 0 || weight <= 0) {
      setState(() {
        _message = "bukan bilangan positif";
      });
      return;
    }

    setState(() {
      _bmi = weight / ((height / 100) * (height/100));
      if (_bmi < 18.5) {
        _message = "Kekurangan berat badan";
      } else if (_bmi < 25) {
        _message = 'Berat badan normal';
      } else if (_bmi < 30) {
        _message = 'Kelebihan berat badan';
      } else {
        _message = 'Kegemukan (obesitas)';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff348f50), Color(0xff56b4d3)]
            )
          ),
        
        child: Center(
          child: Container(
            height: 280,
            width: 320,
            child: Card(
              color: Colors.white,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        _bmi == null ? '  ' : _bmi.toStringAsFixed(2),
                        style: TextStyle(fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        _message,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        labelText: 'Tinggi (cm)'),
                      controller: _heightController,
                      onEditingComplete: _calculate,
                    ),
                    TextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        labelText: 'Berat (kg)',
                      ),
                      controller: _weightController,
                      onEditingComplete: _calculate,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      )
    );
  }
}