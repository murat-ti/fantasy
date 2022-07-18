part of 'painter_bloc.dart';

abstract class BlocBase {
  void dispose();
}

// Flutter BLoC provider
class BlocProvider<T extends BlocBase> extends StatefulWidget {
  const BlocProvider({
    Key? key,
    required this.child,
    required this.bloc,
  }) : super(key: key);

  final T bloc;
  final Widget child;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T of<T extends BlocBase>(BuildContext context) {
    //final type = _typeOf<BlocProvider<T>>();
    final BlocProvider<T>? provider = context.findAncestorWidgetOfExactType<BlocProvider<T>>();
    return provider!.bloc;
  }

  //static Type _typeOf<T>() => T;
}

class _BlocProviderState<T> extends State<BlocProvider<BlocBase>> {
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}