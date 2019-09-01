import 'package:flutter/cupertino.dart';

class Pessoa{

  static const _masculino = 1;
  static const _feminino = 2;

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  int genero; // (1) Masculino | (2) Feminino

  Pessoa(){
    weightController.text = '';
    heightController.text = '';
    genero = null;
  }

  String calculateImc() {

    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100.0;
    double imc = weight / (height * height);
    String imcStr = "IMC = ${imc.toStringAsPrecision(2)}\n";
    
    if(genero == _masculino){
      return imcMasculino(imc, imcStr);
    }
    else if(genero == _feminino){
      return imcFeminino(imc, imcStr);
    }
    else{
      return "Ops! Genero Não definido";
    }
  }

  String imcMasculino(double imc, String imcStr){

    if (imc < 20.7)
      return imcStr += "Abaixo do peso";
    else if (imc <= 26.4)
      return imcStr += "Peso ideal";
    else if (imc <= 27.8)
      return imcStr += "Levemente acima do peso";
    else if (imc <= 31.1)
      return imcStr += "Acima do peso";
    else
      return imcStr += "Obesidade";
  }

  String imcFeminino(double imc, String imcStr){
    if (imc < 19.1)
      return imcStr += "Abaixo do peso";
    else if (imc <= 25.8)
      return imcStr += "Peso ideal";
    else if (imc <= 27.3)
      return imcStr += "Levemente acima do peso";
    else if (imc <= 32.3)
      return imcStr += "Acima do peso";
    else
      return imcStr += "Obesidade";
  }
}