import 'package:roguelike/mundo.dart';
import 'package:roguelike/ponto_2d.dart';
import 'personagem.dart';

class Tesouro extends Personagem {

  static final String SIMBOLO_TESOURO = "T";

  Tesouro(Ponto2D posicao, String simbolo) : super(posicao, simbolo);

  @override
  void atualizar(Mundo mundo) {
    // TODO: implement atualizar
  }
}