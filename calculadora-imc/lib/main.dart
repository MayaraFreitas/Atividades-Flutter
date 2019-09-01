import 'package:flutter/material.dart';

import 'model/pessoa.dart';

void main() => runApp(MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _result;
  int groupValue;
  Pessoa pessoa;

  @override
  void initState() {
    super.initState();
    resetFields();
  }

  void resetFields() {

    pessoa = new Pessoa();
    setState(() {
      _result = 'Informe seus dados';
    });
  }

  void mudarRadioButton(int value){
    print("V: " + value.toString());
    pessoa.genero = value;
    setState((){
      groupValue = value;
    });
  }

Widget listTest(){
    return Text(
        _result, textAlign: TextAlign.center,
        style: new TextStyle(
          fontSize: 50.00
        ),
      );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculadora de IMC'),
          backgroundColor: Colors.red,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                resetFields();
              },
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Peso (kg)'),
                      controller: pessoa.weightController,
                      validator: (text) {
                        return text.isEmpty ? "Insira seu peso!" : null;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Altura (cm)'),
                      controller: pessoa.heightController,
                      validator: (text) {
                        return text.isEmpty ? "Insira sua altura!" : null;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Radio(
                          value: 1,
                          activeColor: Colors.red,
                          groupValue: groupValue,
                          onChanged: (int e) => mudarRadioButton(e),
                        ),
                        Text("Masculino"),
                        Radio(
                          value: 2,
                          activeColor: Colors.red,
                          groupValue: groupValue,
                          onChanged: (int e) => mudarRadioButton(e),
                        ),
                        Text("Feminino"),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 36.0),
                      child: listTest()
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 36.0),
                        child: Container(
                            height: 50,
                            child: RaisedButton(
                              color: Colors.red,
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  setState(() { _result = pessoa.calculateImc(); });
                                }
                              },
                              child: Text('CALCULAR', style: TextStyle(color: Colors.white)),
                            ))),
                            
                  ],
                ))));
  }
}
