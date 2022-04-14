import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("assets/padrao.png");
  var _placar = "Escolha uma opção abaixo: ";
  var _contApp = 0;
  var _contPlayer = 0;
  var _contEmpate = 0;

  void _opcoes(playerescolha) {
    var imagens = ["pedra", "papel", "tesoura"];
    var alet = Random().nextInt(3);
    var appescolha = imagens[alet];

    switch (appescolha) {
      case "pedra":
        setState(() {
          _imagemApp = AssetImage("assets/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          _imagemApp = AssetImage("assets/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          _imagemApp = AssetImage("assets/tesoura.png");
        });
        break;
      default:
    }
    //Player winner
    if (playerescolha == "pedra" && appescolha == "tesoura" ||
        playerescolha == "tesoura" && appescolha == "papel" ||
        playerescolha == "papel" && appescolha == "pedra") {
      _placar = "Você Ganhou.";
      _contPlayer++;
    }
    //Player lost
    else if (appescolha == "pedra" && playerescolha == "tesoura" ||
        appescolha == "tesoura" && playerescolha == "papel" ||
        appescolha == "papel" && playerescolha == "pedra") {
      _placar = "Você Perdeu.";
      _contApp++;
    }
    //empate
    else {
      _placar = "Deu empate";
      _contEmpate++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokempo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40, bottom: 40),
            child: Text(
              "Escolha do App:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(image: _imagemApp),
          Padding(
            padding: EdgeInsets.only(top: 40, bottom: 40),
            child: Text(
              _placar,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcoes("papel"),
                child: Image.asset("assets/papel.png", height: 95),
              ),
              GestureDetector(
                onTap: () => _opcoes("pedra"),
                child: Image.asset("assets/pedra.png", height: 95),
              ),
              GestureDetector(
                onTap: () => _opcoes("tesoura"),
                child: Image.asset("assets/tesoura.png", height: 95),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 50, bottom: 25),
            child: Text(
              "Placar:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Vitórias: $_contPlayer",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "Derrotas: $_contApp",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "Empate: $_contEmpate",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: ElevatedButton(
              onPressed: () {
                _contPlayer = 0;
                _contApp = 0;
                _contEmpate = 0;
                setState(() {
                  _imagemApp = AssetImage("assets/padrao.png");
                });
              },
                child: Text("Restart.")
              ),
            )
        ],
      ),
    );
  }
}
