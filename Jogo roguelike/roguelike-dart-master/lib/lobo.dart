import 'package:roguelike/mundo.dart';
import 'package:roguelike/personagem.dart';
import 'package:roguelike/ponto_2d.dart';

class Lobo extends Personagem{

  static final String SIMBOLO_CRIATURA = "L";

  // Construtor
  Lobo(Ponto2D posicao, String simbolo) : super(posicao, simbolo);

  @override
  void atualizar(Mundo mundo) {

    // Mover na direção do jogador
    int deltaX = mundo.jogador.posicao.x - posicao.x > 0 ? 1 : -1;
    int deltaY = mundo.jogador.posicao.y - posicao.y > 0 ? 1 : -1;
    
    mover(mundo,deltaX,deltaY);
  }

}