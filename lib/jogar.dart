import 'package:cara_ou_coroa/theme/app_colors.dart';
import 'package:flutter/material.dart';

class Jogar extends StatefulWidget {
  final String sorteado;

  const Jogar({
    super.key,
    required this.sorteado, //obriga a passar um valor
  }); //passa o parametro pra classe

  @override
  State<Jogar> createState() => _JogarState();
}

class _JogarState extends State<Jogar> {
  @override
  Widget build(BuildContext context) {
    final String caminhoImagem;
    final String textoResultado;

    //define qual imagem vai ser exibida de acordo com o resultado do sorteio, ou seja, se for cara exibe a imagem de cara, se for coroa exibe a imagem de coroa
    if (widget.sorteado == 'cara') {
      caminhoImagem = 'moeda_cara.jpg';
      textoResultado = 'Deu CARA!';
    } else {
      caminhoImagem = 'moeda_coroa.jpg';
      textoResultado = 'Deu COROA!';
    }

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            Stack(
              //permite sobrepor widgets
              alignment: Alignment.center,
              children: [
                Container(
                  //constainer da sombra
                  width: 260,
                  height: 260,
                  decoration: BoxDecoration(
                    shape: BoxShape
                        .circle, //define o formato circular para a sombra
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.pinkBaby.withAlpha(
                          160,
                        ), //escolhe cor e transparencia
                        blurRadius: 35, //quao espalhada a luz fica
                        //offset: const Offset(0, 5),
                        spreadRadius: 12, //quao grande a sombra fica
                      ),
                      BoxShadow(
                        //cria uma camada mais suave
                        color: AppColors.pinkBaby.withAlpha(90),
                        blurRadius: 70,
                        //offset: const Offset(0, -5),
                        spreadRadius: 30,
                      ),
                    ],
                  ),
                ),
                ClipOval(
                  //recorta a imagem em formato circular
                  child: SizedBox(
                    width: 190, //tamanho da moeda
                    height: 190,
                    child: Image.asset(
                      "images/$caminhoImagem",
                      fit: BoxFit
                          .cover, //faz a imagem preenchertodo o espaço disponível, ou seja, a imagem se ajusta ao tamanho do container
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              textoResultado,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: AppColors.blueDark,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.pop(context), //sempre função anonima
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blueDark,
                foregroundColor: Colors.white,
                elevation: 6, //cria sombra no botao
                padding: const EdgeInsets.symmetric(
                  horizontal: 42,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Voltar',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
