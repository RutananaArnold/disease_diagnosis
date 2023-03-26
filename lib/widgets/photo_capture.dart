import 'package:flutter/material.dart';

class PhotoCapture extends StatelessWidget {
  const PhotoCapture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            color: const Color.fromARGB(179, 241, 237, 237),
            border: Border.all(style: BorderStyle.none),
            borderRadius: BorderRadius.circular(30)),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: const CircleAvatar(
            backgroundColor: Color(0xffFECE00),
          ),
        ));
  }
}
