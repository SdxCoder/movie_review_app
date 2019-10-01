import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {
  final T model;
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Widget child;
  final Function onReadyModel;
  BaseWidget({Key key, this.model, this.builder, this.child, this.onReadyModel}) : super(key: key);

  _BaseWidgetState createState() => _BaseWidgetState();
}

class _BaseWidgetState<T extends ChangeNotifier> extends State<BaseWidget<T>> {
  T model;


  @override
  void initState() {
    super.initState();
    model = widget.model;

    if(widget.onReadyModel != null){
      widget.onReadyModel(model);
    }
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: model,
      child: Consumer<T>(
        child: widget.child,
        builder: widget.builder,
      ),
    );
  }
}
