import 'dart:math' show Random;
import 'package:cara_ou_coroa/jogar.dart'
    show Jogar; //evita importar coisas que nao usa
import 'package:cara_ou_coroa/theme/app_colors.dart' show AppColors;
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //sorteia o resultado do jogo
  void _exibirResultado() {
    var itens = ['cara', 'coroa'];
    var numero = Random().nextInt(itens.length);
    var resultado = itens[numero];

    Navigator.push(
      //empilha uma nova tela
      context,
      //cria a rota, passa o resultado como parametro para a classe jogar, ou seja, a classe jogar recebe o resultado do sorteio e exibe a imagem correspondente
      MaterialPageRoute(builder: (context) => Jogar(sorteado: resultado)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //centraliza o conteudo da tela
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(
              flex: 2,
            ), //espaço vazio, ou seja, um espaço em branco, para deixar a interface mais bonita
            Image.asset('images/logo.jpg'),
            Spacer(),
            ElevatedButton(
              //botao para sortear o resultado do jogo
              onPressed: _exibirResultado,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.pinkCoral,
                foregroundColor: Colors.white,
                elevation: 6,
                padding: const EdgeInsets.symmetric(
                  //aumenta a area clicavel
                  horizontal: 42,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  //bordas arredondadas
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Sortear',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
