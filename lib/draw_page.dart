import 'dart:io';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'bloc/painter_bloc.dart';
import 'dialogs/color_dialog.dart';
import 'dialogs/width_dialog.dart';
import 'models/clear.dart';
import 'models/color.dart';
import 'models/end_touch.dart';
import 'models/stroke.dart';
import 'models/stroke_width.dart';
import 'models/touch_location.dart';
import 'strokes_painter.dart';
import 'package:flutter/material.dart';

class DrawPage extends StatefulWidget {
  const DrawPage({Key? key}) : super(key: key);

  @override
  DrawPageState createState() => DrawPageState();
}

enum actions {save, delete}

extension ActionsExtension on actions {
  String get rawValue {
    switch(this) {
      case actions.save: return 'Save';
      default: return 'Delete';
    }
  }

  IconData get iconValue {
    switch(this) {
      case actions.save: return Icons.save;
      default: return Icons.delete;
    }
  }
}

class DrawPageState extends State<DrawPage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  late AnimationController _controller;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;
  final StrokeCap _strokeCap = StrokeCap.round;
  final GlobalKey _globalKey = GlobalKey();
  final int _durationAnimation = 500;

  final ImagePicker imgPicker = ImagePicker();
  String imagePath = "";
  late File imageFile;

  final String _savedText = 'Your fantasy successfully saved in gallery';
  final String _deletedText = 'Your fantasy successfully deleted';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _durationAnimation),
    );

    // The widgets returned by build(...) change when animationStatus changes
    _controller.addStatusListener((newAnimationStatus) {
      if (newAnimationStatus != _animationStatus) {
        setState(() {
          _animationStatus = newAnimationStatus;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<PainterBloc>(context);
    const _title = 'Fantasy';

    return ScaffoldMessenger(
      key: scaffoldMessengerKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
          actions: <Widget>[
            PopupMenuButton<String>(
              offset: const Offset(0, 45),
              onSelected: (value) async {
                switch (value) {
                  case 'Save':
                    try {
                      RenderRepaintBoundary boundary =
                      _globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
                      ui.Image image = await boundary.toImage();
                      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
                      if (byteData != null) {
                        Uint8List pngBytes = byteData.buffer.asUint8List();

                        if (!(await Permission.storage.status.isGranted)) {
                          await Permission.storage.request();
                        }

                        var saved = await ImageGallerySaver.saveImage(pngBytes,
                            quality: 100, name: DateTime.now().toIso8601String());
                        //{filePath: file:///storage/emulated/0/Pictures/2021-11-04T07%3A55%3A57.501795.jpg, isSuccess: true, errorMessage: null}
                        if (saved['isSuccess']) {
                          showMessage(_savedText, context);
                        }
                      }
                    } catch (e) {
                      //print(e);
                    }
                    break;
                  case 'Delete':
                    bloc.drawEvent.add(ClearEvent());
                    imagePath = "";
                    showMessage(_deletedText, context);
                    break;
                }

                //show ads
                if (bloc.isInterstitialAdReady) {
                  bloc.interstitialAd?.show();
                } else {
                  //print('_moveToHome');
                }
              },
              itemBuilder: (BuildContext context) {
                return {actions.save.rawValue, actions.delete.rawValue}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Row(
                      children: [
                        Icon((choice == actions.save.rawValue) ? actions.save.iconValue : actions.delete.iconValue),
                        const SizedBox(width: 5),
                        Text(choice),
                      ],
                    ),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: GestureDetector(
          onPanUpdate: (DragUpdateDetails details) {
            setState(() {
              final object = context.findRenderObject() as RenderBox;
              final localPosition = object.globalToLocal(details.globalPosition);

              bloc.drawEvent.add(TouchLocationEvent((builder) {
                builder
                  ..x = localPosition.dx
                  ..y = localPosition.dy - 80;
              }));
            });
          },
          onPanEnd: (DragEndDetails details) => bloc.drawEvent.add(EndTouchEvent()),
          child: RepaintBoundary(
            key: _globalKey,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(4.0),
              color: Colors.white,
              alignment: Alignment.topLeft,
              child: StreamBuilder<BuiltList<Stroke>>(
                stream: bloc.strokes,
                builder: (context, snapshot) {
                  return Stack(
                    children: [
                      imagePath != "" ? Image.file(imageFile) : Container(color: Colors.transparent),
                      CustomPaint(
                        painter: StrokesPainter(strokeCap: _strokeCap, strokes: snapshot.data),
                        size: Size.infinite,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: IconButton(
                  icon: const Icon(Icons.brush),
                  onPressed: () async {
                    final strokeWidth = bloc.width.value;
                    final newWidth =
                        await showDialog(context: context, builder: (context) => WidthDialog(strokeWidth: strokeWidth));
                    if (newWidth != null) {
                      bloc.drawEvent.add(StrokeWidthChangeEvent((builder) {
                        builder.width = newWidth;
                      }));
                    }
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: const Icon(Icons.color_lens),
                  onPressed: () async {
                    final newColor = await showDialog(
                      context: context,
                      builder: (context) => const ColorDialog(),
                    ) as Color?;
                    if (newColor != null) {
                      bloc.drawEvent.add(ColorChangeEvent((builder) {
                        builder
                          ..red = newColor.red
                          ..green = newColor.green
                          ..blue = newColor.blue;
                      }));
                    }
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: const Icon(Icons.image),
                  onPressed: () async {
                    //bloc.drawEvent.add(ClearEvent());
                    //try {
                    final XFile? pickedFile = await imgPicker.pickImage(source: ImageSource.gallery, imageQuality: 100);
                    //you can use ImageCourse.camera for Camera capture
                    if (pickedFile != null) {
                      imagePath = pickedFile.path;
                      imageFile = File(imagePath);
                      setState(() {});
                    } else {
                      //print("No image is selected.");
                    }
                    /*} catch (e) {
                  print("error while picking file.");
                }*/
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showMessage(String text, BuildContext context) {
    scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
      content: Text(
        text,
        style: TextStyle(color: Theme.of(context).colorScheme.primaryVariant),
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: Theme.of(context).colorScheme.primary,
    ));
  }

  Widget buildButton(IconData icon, VoidCallback? pressed) {
    return !_controller.isDismissed
        ? Container(
            height: 70.0,
            width: 56.0,
            alignment: FractionalOffset.topCenter,
            child: ScaleTransition(
              scale: CurvedAnimation(
                parent: _controller,
                curve: const Interval(0.0, 1.0 - 0 / 3 / 2.0, curve: Curves.easeOut),
              ),
              child: FloatingActionButton(
                mini: true,
                child: Icon(icon),
                onPressed: pressed,
              ),
            ),
          )
        : const SizedBox();
  }
}
