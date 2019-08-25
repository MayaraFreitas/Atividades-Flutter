import 'package:roguelike/mundo.dart';
import 'package:roguelike/personagem.dart';
import 'package:roguelike/ponto_2d.dart';

class Carneiro extends Personagem{

  static final String SIMBOLO_CRIATURA = "C";

  // Construtor
  Carneiro(Ponto2D posicao, String simbolo) : super(posicao, simbolo);

  @override
  void atualizar(Mundo mundo) {
    
    // Mover na direção oposta do jogador
    int deltaX = mundo.jogador.posicao.x - posicao.x > 0 ? -1 : 1; // Andar na direção oposta do jogaror
    int deltaY = mundo.jogador.posicao.y - posicao.y > 0 ? -1 : 1; // Andar na direção oposta do jogaror
    
    mover(mundo,deltaX,deltaY);
  }
}