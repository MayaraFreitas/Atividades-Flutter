import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pessoa{

  static const _masculino = 1;
  static const _feminino = 2;

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  int genero; // (1) Masculino | (2) Feminino

  Color color;
  String imcText;
  String imcSituationText;

  Pessoa(){
    weightController.text = '';
    heightController.text = '';
    color = null;
    genero = null;
  }

  void calculateImc() {

    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100.0;
    double imc = weight / (height * height);
    imcText = "IMC = ${imc.toStringAsPrecision(2)}\n";

    if(genero == _masculino){
      imcMasculino(imc);
    }
    else if(genero == _feminino){
      imcFeminino(imc);
    }
    else{
      imcSituationText = "Ops! Genero Não definido";
    }
  }

  void imcMasculino(double imc){

    if (imc < 20.7)
      imcSituationText = "Abaixo do peso";
    else if (imc <= 26.4)
      imcSituationText = "Peso ideal";
    else if (imc <= 27.8)
      imcSituationText = "Levemente acima do peso";
    else if (imc <= 31.1)
      imcSituationText = "Acima do peso";
    else
      imcSituationText = "Obesidade";
  }

  String imcFeminino(double imc){
    if (imc < 19.1)
      imcSituationText = "Abaixo do peso";
    else if (imc <= 25.8)
      imcSituationText = "Peso ideal";
    else if (imc <= 27.3)
    {
      color = Colors.red[300];
      imcSituationText = "Levemente acima do peso";
    }
    else if (imc <= 32.3)
      imcSituationText = "Acima do peso";
    else
      imcSituationText = "Obesidade";
  }
}