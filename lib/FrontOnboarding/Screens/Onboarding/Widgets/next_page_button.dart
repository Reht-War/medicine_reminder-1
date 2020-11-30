import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:medicine_reminder/FrontOnboarding/Constants.dart';



class NextPageButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextPageButton({
    @required this.onPressed,
  }) : assert(onPressed != null);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: const EdgeInsets.all(kPaddingM),
      elevation: 0.0,
      shape: CircleBorder(),
      fillColor: Color(0xff323232),
      child: Icon(
        Icons.arrow_forward,
        color: Color(0xffbb86fe),
        size: 32.0,
      ),
      onPressed: onPressed,
    );
  }
}