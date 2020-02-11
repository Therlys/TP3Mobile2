import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool isDisabled;

  const ChoiceButton(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.isDisabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: new OutlineButton(
          disabledTextColor: Colors.redAccent,
          disabledBorderColor: Colors.redAccent,
          onPressed: isDisabled ? null : onPressed,
          child: new Text(
            text,
            textScaleFactor: 1.5,
          ),
        ),
      ),
    );
  }
}
