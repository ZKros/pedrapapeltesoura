import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pedrapapeltesoura/BorderColor/border-color.dart';
import 'package:pedrapapeltesoura/PPT/ppt.dart';
import 'package:pedrapapeltesoura/Placar/placar.dart';

class PPTState extends State<PPT> {
  String _imgUserPlayer = "imagens/indefinido.png";
  String _imgAppPlayer = "imagens/indefinido.png";

  int _userPoints = 0;
  int _appPoints = 0;
  int _tiePoints = 0;

  Color _borderUserColor = Colors.transparent;
  Color _borderAppColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Pedra Papel Tesoura"),
        ),
        body: Column(children: [
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 20),
            child: Text(
              'Disputa',
              style: TextStyle(fontSize: 26),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BorderColor(
                  borderColor: _borderUserColor, imgPlayer: _imgUserPlayer),
              const Text('VS'),
              BorderColor(
                  borderColor: _borderAppColor, imgPlayer: _imgAppPlayer),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 20),
            child: Text(
              'Placar',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Placar(playerName: 'Você', playerPoints: _userPoints),
              Placar(playerName: 'Empate', playerPoints: _tiePoints),
              Placar(playerName: 'App', playerPoints: _appPoints),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 20),
            child: Text(
              'Opções',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _iniciaJogada("pedra"),
                child: Image.asset(
                  'imagens/pedra.png',
                  height: 90,
                ),
              ),
              GestureDetector(
                onTap: () => _iniciaJogada("papel"),
                child: Image.asset(
                  'imagens/papel.png',
                  height: 90,
                ),
              ),
              GestureDetector(
                onTap: () => _iniciaJogada("tesoura"),
                child: Image.asset(
                  'imagens/tesoura.png',
                  height: 90,
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }

  void _iniciaJogada(String opcao) {
    setState(() {
      _imgUserPlayer = "imagens/$opcao.png";
      "";
    });

    String escolhaApp = _obtemEscolhaApp();
    setState(() {
      _imgAppPlayer = "imagens/$escolhaApp.png";
    });

    _terminaJogada(opcao, escolhaApp);
  }

  void _terminaJogada(String escolhaUser, String escolhaApp) {
    var resultado = "indefinido";

    switch (escolhaUser) {
      case "pedra":
        if (escolhaApp == "papel") {
          resultado = "app";
        } else if (escolhaApp == "tesoura") {
          resultado = "user";
        } else {
          resultado = "empate";
        }
        break;
      case "papel":
        if (escolhaApp == "pedra") {
          resultado = "user";
        } else if (escolhaApp == "tesoura") {
          resultado = "app";
        } else {
          resultado = "empate";
        }
        break;
      case "tesoura":
        if (escolhaApp == "papel") {
          resultado = "user";
        } else if (escolhaApp == "pedra") {
          resultado = "app";
        } else {
          resultado = "empate";
        }
        break;
    }

    setState(() {
      if (resultado == "user") {
        _userPoints++;
        _borderUserColor = Colors.green;
        _borderAppColor = Colors.transparent;
      } else if (resultado == "app") {
        _appPoints++;
        _borderUserColor = Colors.transparent;
        _borderAppColor = Colors.green;
      } else {
        _tiePoints++;
        _borderUserColor = Colors.orange;
        _borderAppColor = Colors.orange;
      }
    });
  }

  String _obtemEscolhaApp() {
    var opcoes = ['pedra', 'papel', 'tesoura'];

    String valorEscolhido = opcoes[Random().nextInt(3)];

    return valorEscolhido;
  }
}
