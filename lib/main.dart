import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ));

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightCtrl = TextEditingController();
  TextEditingController heightCtrl = TextEditingController();

  String _infoText = "Informe seus dados!";

  void _resetFields() {
    weightCtrl.clear();
    heightCtrl.clear();
    setState(() {
      _infoText = "Informe seus dados!";
    });
  }

  void calculate() {
    double weight = double.parse(weightCtrl.text);
    double height = double.parse(heightCtrl.text) / 100;

    double imc = weight / (height * height);
    String imcformatted = imc.toStringAsPrecision(4);

    setState(() {
      if (imc < 18.6) _infoText = "Abaixo do peso ($imcformatted)";

      if (imc >= 18.6 && imc < 24.9) _infoText = "Peso ideal ($imcformatted)";

      if (imc >= 24.9 && imc < 29.9)
        _infoText = "Levemente acima do peso ($imcformatted)";

      if (imc >= 29.9 && imc < 34.9)
        _infoText = "Obesidade grau I ($imcformatted)";

      if (imc >= 34.9 && imc < 39.9)
        _infoText = "Abaixo do Peso ($imcformatted)";

      if (imc >= 40) _infoText = "Abaixo do Peso ($imcformatted)";
    });

    print(_infoText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Calculadora de IMC'),
            centerTitle: true,
            backgroundColor: Colors.orange,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: _resetFields,
              )
            ]),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person_outline, size: 120, color: Colors.orange),
              TextField(
                controller: weightCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Peso(Kg)",
                  labelStyle: TextStyle(
                    color: Colors.orange,
                    fontSize: 25,
                  ),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 25,
                ),
              ),
              TextField(
                controller: heightCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Altura(cm)",
                  labelStyle: TextStyle(
                    color: Colors.orange,
                    fontSize: 25,
                  ),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 25,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Container(
                  height: 50,
                  child: RaisedButton(
                    onPressed: calculate,
                    child: Text(
                      "CALCULAR",
                      style: TextStyle(fontSize: 25),
                    ),
                    color: Colors.orange,
                    textColor: Colors.white,
                  ),
                ),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.orange, fontSize: 25.0),
              )
            ],
          ),
        ));
  }
}
