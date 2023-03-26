import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:pagination_exp/screens/camera_page.dart';
import 'package:pagination_exp/screens/pagination.dart';
import 'package:pagination_exp/screens/stories.dart';

class Index extends StatefulWidget {
  int currentIndex;
  CameraDescription camera;
  Index({super.key, this.currentIndex = 0, required this.camera});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  void initState() {
    super.initState();
    tabs = <Widget>[
      const Pagination(),
      const Stories(),
      CameraPage(
        camera: widget.camera,
      )
    ];
  }

  late List<Widget> tabs;

  void onTapped(int index) {
    setState(() {
      widget.currentIndex = index;
    });
  }

  List<Widget> appText = [
    const Text("Pagination"),
    const Text("Stories"),
    const Text("Camera")
  ];
  // List<Widget> tabs = [
  //   const Pagination(),
  //   const Stories(),
  //   CameraPage(
  //     camera: widget.camera,
  //   )
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: appText[widget.currentIndex],
        centerTitle: true,
      ),
      body: tabs[widget.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: widget.currentIndex,
          onTap: (value) {
            onTapped(value);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.data_exploration_rounded),
                label: "Pagination",
                backgroundColor: Colors.yellow),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "User Stories",
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: "Camera",
              backgroundColor: Colors.blue,
            ),
          ]),
    );
  }
}
