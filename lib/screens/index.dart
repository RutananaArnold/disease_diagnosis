import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:pagination_exp/screens/camera_page.dart';

class Index extends StatefulWidget {
  int currentIndex;
  CameraDescription camera;
  Index({super.key, this.currentIndex = 0, required this.camera});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text("Welcome"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: size.height * 0.03,
          ),
          SizedBox(
            height: size.height * 0.5,
            // child: ,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => CameraPage(
                      camera: widget.camera,
                    ),
                  ),
                );
              },
              child: const Text("Start diagnosis"))
        ],
      ),
    );
  }
}
