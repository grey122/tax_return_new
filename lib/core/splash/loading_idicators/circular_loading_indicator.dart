import 'package:flutter/material.dart';
import 'package:tax_return/feature/tax_return/presentation/logic/constants/colors_constant.dart';

class CircularLoadingIndactor extends StatelessWidget {
  // final Animation<Color> _color = ColorTween(begin: darkColor, end: Colors.grey).animate(parent)

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 50,
        width: 50,
        child: CircularProgressIndicator(
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
