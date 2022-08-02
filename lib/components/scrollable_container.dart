import 'package:flutter/material.dart';

class ScrollableContainer extends StatelessWidget {
  const ScrollableContainer({Key? key, required this.image, required this.text})
      : super(key: key);

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(alignment: Alignment.center, children: [
          Container(
            decoration: new BoxDecoration(color: Colors.black),
            child: Image.network(image),
          ),
          Text(
            text,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          )
        ]),
      ),
    );
  }
}
