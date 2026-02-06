import 'package:flutter/material.dart';

class Jogar extends StatefulWidget {
  final String sorteado;

  const Jogar({
    super.key,
    required this.sorteado,
  }); //passa o parametro pra classe

  @override
  State<Jogar> createState() => _JogarState();
}

class _JogarState extends State<Jogar> {
  @override
  Widget build(BuildContext context) {
    late String caminhoImagem;

    //define qual imagem vai ser exibida de acordo com o resultado do sorteio, ou seja, se for cara exibe a imagem de cara, se for coroa exibe a imagem de coroa
    if (widget.sorteado == 'cara') {
      caminhoImagem = 'moeda_cara.jpg';
    } else {
      caminhoImagem = 'moeda_coroa.jpg';
    }

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('images/${caminhoImagem}'),
            ElevatedButton(
              onPressed: () => Navigator.pop(context), //sempre função anonima
              child: Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
