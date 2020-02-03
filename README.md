# Atividades-Flutter

Atividades desenvolvidas na matéria "Tópicos de linguagem de programação" no 8º semestre.

Professor: Kleber Andrade (https://github.com/kleberandrade)

## Aula 1 - Jogo Roguelike
Código Base: (https://github.com/kleberandrade/roguelike-dart)

### Desafios:

* [OK] - Estudar o tutorial do jogo: http://bit.ly/31n2ufY
* [OK] - Instalar as ferramenta e compilar o jogo
* [OK] - Adicionar outros monstros (carneiro [simbolo C] - dócil; lobo [simbolo L] - agressivo)
* [OK] - Criar uma classe Carneiro e criar um movimento para fugir do jogador
* [OK] - Criar uma classe Lobo e criar um movimento para perseguir o jogador
* [OK] - Criar uma classe de Tesouro [simbolo G] ue ao passar por cima, abre o tesouro e ganha X moedas (valor aleatório entre 50 e 100)
* [OK] - Exibir na tela a quantidade de moedas do jogador
* [OK] - Testar o jogo


## Aula 2 - Calculadora de IMC

Aplicativo desenvolvido em aula + desafios completados como atividade.

### Desafios:

*   [OK] - Adicionar botões (Toggle ouRadio button) para escolha de gênero ([masculino](https://indicedemassacorporal.com/movel/calculo-imc-masculino.html) / [feminino](https://indicedemassacorporal.com/movel/calculo-imc-feminino.html));
*   [OK] - Corrigir o calculo de acordo com o gênero (masculino e feminino);
*   [OK] - Criar um classe Pessoa com os atributos (peso, altura e gênero), criar métodos para calcular IMC e classificar;
*   [OK] - Refatorar o código do aplicativo para utilizar a classe Pessoa;
*   [OK] - Aplicar uma escala de cores para o resultado da classificação do IMC;
*   [OK] - Aumentar o texto do resultado do IMC (número) e também colocar em negrito.


## Aula 3 - Consulta de CEP

Aplicativo para consultar CEP através da API do VIA CEP

## Desafios

-   [OK] Criar e usar temas Light e Dart (para saber mais sobre temas [clique aqui](https://flutter.dev/docs/cookbook/design/themes), e se você quiser usar um editor de temas [clique aqui](https://rxlabz.github.io/panache/#/))
-   [OK] Criar um IconButton na AppBar para alternar entre os temas (dica: use o [plugin dynamic_theme](https://pub.dev/packages/dynamic_theme))
-   [OK] Criar um formulário para adicionar todas os campos do JSON ([formulários](https://flutter.dev/docs/cookbook/forms))
-   [OK] Validar o campo de digitação de CEP ([validações em flutter](https://medium.com/@nitishk72/form-validation-in-flutter-d762fbc9212c))
-   [OK] Tratar todas [exceções](https://www.youtube.com/watch?v=qAzxZJ8NRwI) e utilize [Flushbar](https://pub.dev/packages/flushbar) para exibir os erros para o usuário
-   Adicionar um IconButton na AppBar para compartilhar o CEP (utilize o [plugin share](https://pub.dev/packages/share))


## Aula 4 - Lista de Tarefas

## Desafios

- [OK] - Na lista de tarefas, adicionar divisões entre as linhas (use [ListView.separated](https://api.flutter.dev/flutter/widgets/ListView/ListView.separated.html))
- [OK] - Adicionar validações no cadastro de uma atividade (lembre-se que é preciso utilizar o widget [TextFormField](https://api.flutter.dev/flutter/material/TextFormField-class.html) para isso)
- [OK] - Campo descrição precisar aceitar múltiplas linhas
- [OK] [Lógica pronta - faltando uso do componente (Perguntar o nome)] - Criar um campo para nível de prioridades que aceita valores entre 1 (baixa prioridade) e 5 (alta prioridade). Representar isso no card da forma como achar mais interessante.
- [OK] - Adicionar um [PercentIndicator](https://pub.dev/packages/percent_indicator) circular na barra de navegação para indicar a porcentagem de tarefas concluídas

## Aula 5 - Chatbot

## Desafios

- [OK] Melhorar a exibição das mensagens, aplicando um Clippy no estilo Whatsapp (se quiser, pode utilizar o [clippy_flutter](https://pub.dev/packages/clippy_flutter))
- [OK] Adicionar data/hora de recebimento ou envio das mensagens ([DateTime class](https://api.flutter.dev/flutter/dart-core/DateTime-class.html))
- [OK] Fazer o TextField de envio de mensagens ser igual ao do Whatsapp (borda redonda)
- [OK] Criar um novo projeto de chatbot para um problema que deseja resolver e adicionar pelo menos 10 Intents
- [OK] Utilizar pelo menos 1 Entities no DialogFlow ([tutorial de como usar](https://www.youtube.com/watch?v=3ePcMGW5cjo))

## Pojeto - Marcador Online
