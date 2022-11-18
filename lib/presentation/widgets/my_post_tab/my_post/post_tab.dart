import 'package:flutter/material.dart';

class PostTab extends StatelessWidget {
  final String tabText;

  const PostTab({ required this.tabText});

  @override
  Widget build(BuildContext context) {
    return Tab(text: tabText);
  }
}