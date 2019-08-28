import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marcador_truco/models/player.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _playerOne = new Player(name: 'Nós', score: 0, victories: 0);
  var _playerTwo = new Player(name: 'Eles', score: 0, victories: 0);

  void _resetScore(Player player, bool resetVictories) {
    setState(() {
      player.score = 0;
      player.victories = resetVictories ? 0 : player.victories;
    });
  }

  void _resetPlayers(bool resetVictories) {
    _resetScore(_playerOne, resetVictories);
    _resetScore(_playerTwo, resetVictories);
  }

  @override
  void initState() {
    super.initState();
    _resetPlayers(true);
  }

  Widget _showPlayerName(String name) {
    return Text(name.toUpperCase(),
        style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w500,
            color: Colors.deepOrange));
  }

  Widget _showPlayerVictories(int victories){
    return Text("vitórias ($victories)",
    style: TextStyle(fontWeight: FontWeight.w300));
  }

  Widget _showPlayerScore(int score){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 52.00),
      child: Text("$score", style: TextStyle(fontSize: 120.0),)
    );
  }

  Widget _buildRoundedButton({String label, Color color, Function onTap, double size = 52.0}){

    return GestureDetector(
      onTap: onTap,
      child: ClipOval(
        child: Container(
          height: size,
          width: size,
          color: color,
          child: Center(
            child: Text(label, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget _showScoreButtons(Player player){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
          _buildRoundedButton(
            label: '-1',
            color: Colors.black.withOpacity(0.1),
            onTap: (){
              setState(() {
                player.score--; 
              });
            }
          ),
          _buildRoundedButton(
            label: '+1',
            color: Colors.deepOrange,
            onTap: (){
              setState(() {
                player.score++; 
              });
              if(player.score == 12){
                _showDialog(
                  title: 'Fim de Jogo',
                  message: '${player.name} ganhou!',
                  cancel: (){
                    setState(() {
                      player.score--;
                    });
                  },
                  confirm: (){
                    setState(() {
                     player.victories++; 
                    });
                    _resetPlayers(false);
                  }
                );
              }
            }
          )
      ],
    );
  }

  Widget _buildAppBar(){
    return AppBar(
      title: Text('Marcador de Truco'),
      actions: <Widget>[
        IconButton(
          onPressed: (){
            _showDialog(
              title: 'Fim :)',
              message: 'Tem certeza que deseja encerrar a partida?',
              confirm: (){
                _resetPlayers(true);
              }
            );
          },
          icon: Icon(Icons.refresh)
        )
      ],
    );
  }

  Widget _buildBoardPlayers(){
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildBoardPlayer(_playerOne),
        _buildBoardPlayer(_playerTwo),
      ],
    );
  }

  Widget _buildBoardPlayer(Player player){
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _showPlayerName(player.name),
          _showPlayerScore(player.score),
          _showPlayerVictories(player.victories),
          _showScoreButtons(player)
        ],
        ),
    );
  }

  void _showDialog({String title, String message, Function confirm, Function cancel}){

    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text(title ?? ""),
          content: Text(message ?? ""),
          actions: <Widget>[
            FlatButton(
              child: Text("CANCEL"),
              onPressed: (){
                Navigator.of(context).pop();
                if(cancel != null) cancel();
              },
            ),
            FlatButton(
              child: Text("OK"),
              onPressed: (){
                Navigator.of(context).pop();
                if(cancel != null) confirm();
              },
            ),
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBoardPlayers()
    ); 
  }
}
