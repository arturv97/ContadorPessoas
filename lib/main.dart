import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Contador de Pessoas",
      home: Home()));
}
class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> {

  int _people = 0;
  String _infoText = "Olá!";

  void _changePeople(int delta)
  {
    setState(()
    {
      _people+=delta;

      if(_people < 0)
      {
      _infoText = "Ops!";
      _people = 0;
      }
      else if(_people < 10)
      {
        _infoText = "Seja bem vindo!";
      }
      else
      {
        _infoText = "Lotado, aguarde!";
        _people = 10;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant0.jpg",
          fit: BoxFit.cover,
          height: 10000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_people",
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30.0,),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changePeople(1);
                      },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changePeople(-1);
                      },
                  ),
                ),
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.white,
                  // fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            )
          ],
        )
      ],
    );
  }
}
