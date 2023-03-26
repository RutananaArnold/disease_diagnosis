import 'package:flutter/material.dart';
import 'package:pagination_exp/screens/view_stories.dart';

class Stories extends StatefulWidget {
  const Stories({super.key});

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const ViewStories(),
              ),
            );
          },
          child: const Text("View Stories")),
    );
  }
}
