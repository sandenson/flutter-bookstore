import 'package:flutter/material.dart';

class StarDisplayWidget extends StatelessWidget {
  final double value;

  const StarDisplayWidget({Key? key, this.value = 0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (value == 0) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(5, (index) {
          return IconTheme(
            data: IconThemeData(
              color: Colors.amber,
              size: 20,
            ),
            child: Icon(Icons.star_border),
          );
        }),
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(5, (index) {
          if (index < value && value >= index.toDouble() + 0.75)
            return IconTheme(
              data: IconThemeData(
                color: Colors.amber,
                size: 20,
              ),
              child: Icon(Icons.star),
            );
          else if (index < value && value <= index.toDouble() + 0.25)
            return IconTheme(
              data: IconThemeData(
                color: Colors.grey[500],
                size: 20,
              ),
              child: Icon(Icons.star_border),
            );
          else
            return IconTheme(
              data: IconThemeData(
                color: Colors.amber,
                size: 20,
              ),
              child: Icon(Icons.star_half),
            );
        }),
      );
    }
  }
}
