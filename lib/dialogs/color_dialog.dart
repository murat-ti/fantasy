import 'package:flutter/material.dart';

class ColorDialog extends StatefulWidget {
  const ColorDialog({Key? key}) : super(key: key);
  final _title = 'Brush color';

  @override
  State<StatefulWidget> createState() => ColorDialogState();
}

class ColorDialogState extends State<ColorDialog> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        title: Text(widget._title),
        contentPadding: const EdgeInsets.all(12.0),
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
            buildColorButton(context, Colors.pink[500]),
            buildColorButton(context, Colors.red[500]),
            buildColorButton(context, Colors.deepOrange[500]),
            buildColorButton(context, Colors.orange[500]),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
            buildColorButton(context, Colors.amber[500]),
            buildColorButton(context, Colors.yellow[500]),
            buildColorButton(context, Colors.lightGreen[500]),
            buildColorButton(context, Colors.green[500]),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
            buildColorButton(context, Colors.teal[500]),
            buildColorButton(context, Colors.cyan[500]),
            buildColorButton(context, Colors.lightBlue[500]),
            buildColorButton(context, Colors.blue[500]),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
            buildColorButton(context, Colors.indigo[500]),
            buildColorButton(context, Colors.purple[500]),
            buildColorButton(context, Colors.deepPurple[500]),
            buildColorButton(context, Colors.blueGrey[500]),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
            buildColorButton(context, Colors.brown[500]),
            buildColorButton(context, Colors.grey[500]),
            buildColorButton(context, Colors.black),
            buildColorButton(context, Colors.white),
          ]),
        ]);
  }

  FloatingActionButton buildColorButton(BuildContext context, Color? color) {
    return FloatingActionButton(
      mini: true,
      backgroundColor: color,
      elevation: 1.0,
      onPressed: () {
        Navigator.pop(context, color);
      },
    );
  }
}
