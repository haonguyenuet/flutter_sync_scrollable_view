import 'package:flutter/material.dart';

/// Use this widget to get a widget`s rectangle information.
class RectGetter extends StatefulWidget {
  final GlobalKey globalKey;
  final Widget child;

  const RectGetter({
    required this.globalKey,
    required this.child,
  }) : super(key: globalKey);

  static Rect? getRectFromKey(GlobalKey globalKey) {
    var object = globalKey.currentContext?.findRenderObject();
    var translation = object?.getTransformTo(null).getTranslation();
    var size = object?.semanticBounds.size;

    if (translation == null || size == null) {
      return null;
    }

    return Rect.fromLTWH(
      translation.x,
      translation.y,
      size.width,
      size.height,
    );
  }

  static Offset? getOffsetFromKey(GlobalKey globalKey) {
    final box = globalKey.currentContext?.findRenderObject() as RenderBox;
    return box.localToGlobal(Offset.zero);
  }

  @override
  RectGetterState createState() => RectGetterState();
}

class RectGetterState extends State<RectGetter> {
  @override
  Widget build(BuildContext context) => widget.child;
}
