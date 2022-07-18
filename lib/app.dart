import 'package:fantasy/theme.dart';
import 'package:flutter/material.dart';
import 'bloc/painter_bloc.dart';
import 'draw_page.dart';

class FantasyApp extends StatelessWidget {
  const FantasyApp({Key? key}) : super(key: key);
  final _title = 'Fantasy';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      theme: buildShrineTheme(),
      home: Scaffold(
        body: BlocProvider<PainterBloc>(
          child: const DrawPage(),
          bloc: PainterBloc(),
        ),
      ),
    );
  }
}


