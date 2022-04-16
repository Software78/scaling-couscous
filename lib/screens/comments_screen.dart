import 'package:flutter/material.dart';
import 'package:instagram/utils/colors.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({ Key? key }) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
      ),
    );
  }
}