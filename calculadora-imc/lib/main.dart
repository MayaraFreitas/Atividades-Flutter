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

  Widget buildImcResult(){
    return Padding(
      padding: EdgeInsets.only(top: 36.0),
      child: Text(
        pessoa.imcText, textAlign: TextAlign.center,
        style: new TextStyle(
          fontSize: 50.00
        ),
      )
    );
}

  Widget buildImcSituationResult(){
    return Padding(
      padding: EdgeInsets.only(top: 1.0),
      child: Text(
        pessoa.imcSituationText, textAlign: TextAlign.center,
        style: new TextStyle(
          fontSize: 20.00
        ),
      )
    );
}

  Widget buildCalculateImcButton(){
  return Padding(
      padding: EdgeInsets.symmetric(vertical: 36.0),
      child: Container(
          height: 50,
          child: RaisedButton(
            color: Colors.red,
            onPressed: () {
              if (_formKey.currentState.validate()) {
                setState(() { pessoa.calculateImc(); });
              }
            },
            child: Text('CALCULAR', style: TextStyle(color: Colors.white)),
          )
      )
  );
}

  Widget buildGenderRadioButton(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text("Masculino"),
      buildRadioButton(value: 1, color: Colors.red),
      Text("Feminino"),
      buildRadioButton(value: 2, color: Colors.red),
    ],
  );
}

  Widget buildRadioButton({int value, Color color}){
  return Radio(
    value: value,
    activeColor: color,
    groupValue: groupValue,
    onChanged: (int e) => mudarRadioButton(e),
  );
}

  Widget buildTextFormField({String labelText, TextEditingController controller, String validatorMessage}){
  return 
    TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: labelText),
      controller: controller,
      validator: (text) {
        return text.isEmpty ? validatorMessage : null;
      },
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
                    buildTextFormField(labelText: 'Peso (kg)', controller: pessoa.weightController, validatorMessage: "Insira seu peso!"),
                    buildTextFormField(labelText: 'Altura (cm)', controller: pessoa.heightController, validatorMessage: "Insira sua altura!"),
                    buildGenderRadioButton(),
                    buildImcResult(),
                    buildImcSituationResult(),
                    buildCalculateImcButton()
                  ],
                ))));
  }
}
