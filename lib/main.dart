import 'package:flutter/material.dart';

void main(){
  runApp: (MaterialApp(
  home: Home();
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeSate extends State<Home> {

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<formState>();

  

  String _infoText = "Informe seus dados ";

  void _resetFields() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
       _infoText = "Informe seus dados";
    });
  }

  void _calculate(){
    setState((){
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);

       switch (imc) {
    case < 18.5:
      _infoText = 'Abaixo do peso (${imc.toStringAsPrecision(3)})';
      break;
    case >= 18.5 && < 25:
      _infoText = 'Peso normal (${imc.toStringAsPrecision(3)})';
      break;
    case >= 25 && < 30:
      _infoText = 'Sobrepeso (${imc.toStringAsPrecision(3)})';
      break;
    case >= 30 && < 35:
      _infoText = 'Obesidade Grau I (${imc.toStringAsPrecision(3)})';
      break;
    case >= 35 && < 40:
      _infoText = 'Obesidade Grau II (${imc.toStringAsPrecision(3)})';
      break;
    case >= 40:
      _infoText = 'Obesidade Grau III (Mórbida) (${imc.toStringAsPrecision(3)})';
      break;
    default:
      _infoText = 'IMC inválido'; // Caso o IMC não se encaixe em nenhuma categoria
     }
   });
  }




  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget> [
          IconButton(icon: Icon(Icons.refresh), onPressed: _resetFields,)
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(Icons.person_outline, size: 120.0, color: Colors.green),
          TextField(keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "Peso (kg)",
            labelStyle: TextStyle(color: Colors.green)
          ),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.green, fontSize: 25.0),
          controller: weightController,
          ),

           TextField(keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "Altura (cm)",
            labelStyle: TextStyle(color: Colors.green)
          ),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.green, fontSize: 25.0),
          controller: heightController,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child:Container(
            height: 50.0
            child: MaterialButton(
              onPressed: _calculate,
              child: Text("Calcular",
              style: TextStyle(color: Colors.white, fontSize: 25.0),),
              color: Colors.green
            ),
          ),
          ),
          Text(_infoText,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.green, fontSize: 25.0),)
        ],
      )
    )
    );
  }
}