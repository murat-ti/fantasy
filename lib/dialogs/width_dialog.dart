import 'package:flutter/material.dart';

class WidthDialog extends StatefulWidget {
  final double strokeWidth;

  const WidthDialog({Key? key, required this.strokeWidth}) : super(key: key);

  @override
  State<StatefulWidget> createState() => WidthDialogState();
}

class WidthDialogState extends State<WidthDialog> {
  late double strokeWidth;
  final _title = 'Brush thickness';
  final _titleAccept = 'Accept';
  final _titleCancel = 'Cancel';

  @override
  void initState() {
    super.initState();
    strokeWidth = widget.strokeWidth;
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        title: Text(_title),
        contentPadding: const EdgeInsets.all(12.0),
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
              child: Container(
                width: strokeWidth,
                height: strokeWidth,
                decoration:
                const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
              )),
          Slider(
            value: strokeWidth,
            min: 1.0,
            max: 20.0,
            onChanged: (d) {
              setState(() {
                strokeWidth = d;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              MaterialButton(
                  child: Text(
                    _titleCancel.toUpperCase(),
                    style: TextStyle(color: ThemeData().colorScheme.secondary),
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  }),
              MaterialButton(
                  child: Text(
                    _titleAccept.toUpperCase(),
                    style: TextStyle(color: ThemeData().colorScheme.secondary),
                  ),
                  onPressed: () async {
                    Navigator.pop(context, strokeWidth);
                  }),
            ],
          )
        ]);
  }
}