import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: myApp()));
}

class myApp extends StatefulWidget {
  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  int _value1 = 0;
  int _value2 = 0;

  TextEditingController text1Controller = TextEditingController();

  //create function to handle the statechange
  void _setvalue1(int value) {
    setState(() {
      _value1 = value;
      print(value);
    });
  }

  void _setvalue2(int value) {
    setState(() {
      _value2 = value;
      print(value);
      _setvalue3(value.toString());
    });
  }

  void _setvalue3(String value) {
    setState(() {
      text1Controller.text = value.toString();
    });
  }

  Widget makeRadioButtons() {
    List<Widget> list = new List<Widget>();

    for (int i = 0; i < 3; i++) {
      list.add(Radio(value: i, groupValue: _value1, onChanged: _setvalue1));
    }

    Column column = Column(children: list);

    return column;
  }




  Widget makeRadioTiles() {
    List<Widget> list = List<Widget>();

    for (int i = 0; i < 4; i++) {
      list.add(RadioListTile(
          value: i,
          groupValue: _value2,
          onChanged: _setvalue2,
          activeColor: Colors.yellow,
          controlAffinity: ListTileControlAffinity.trailing,
          title: Text('Item: ${i}'),
          subtitle: Text('Sub Title ${i}')));
    }

    Column column = Column(children: list);

    return column;
  }

  Widget makeTextBox() {
    List<Widget> list = List<Widget>();

    list.add(Container(
        padding: EdgeInsets.all(20.00),
        alignment: Alignment.centerLeft,
        child: TextField(
          controller: text1Controller,
          onChanged: _setvalue3,
        )));
    Column column = Column(children: list);
    return column;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(title: Text("Radio Buttons")),
        body: Container(
            padding: EdgeInsets.all(20.0),
            child: Center(
                child: Column(children: <Widget>[

                  makeRadioButtons(),
                  makeRadioTiles(),
                  makeTextBox()
                ]))));
  }
}



