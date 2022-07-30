import 'package:flutter/material.dart';

class SliderView extends StatelessWidget {
  final String option;
  final bool isSelected;
  final VoidCallback onTap;

  const SliderView(
      {Key? key,
      required this.option,
      required this.isSelected,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Text(
              option,
              style: TextStyle(
                color: isSelected ? Colors.orange : Colors.black,
              ),
            ),
          ],
        ));
  }
}
