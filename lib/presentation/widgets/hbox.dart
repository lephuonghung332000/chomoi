import 'package:flutter/widgets.dart';

class HBox extends StatelessWidget {
  final double size;

  const HBox(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(width: size);
}
