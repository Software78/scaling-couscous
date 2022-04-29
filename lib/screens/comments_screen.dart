import 'package:flutter/material.dart';
import 'package:instagram/resources/firestore_methods.dart';
import 'package:instagram/utils/colors.dart';
import 'package:instagram/widgets/comment_card.dart';
import 'package:provider/provider.dart';

import '../models/user_model.dart';
import '../providers/user_providers.dart';

class CommentScreen extends StatefulWidget {
  final snap;

  const CommentScreen({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    final User? user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Text('Comments'),
      ),
      body: CommentCard(),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: kToolbarHeight,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: primaryColor,
                radius: 16,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 8,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Comment as ${user!.username}',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await FireStoreMethods().postComment(
                    widget.snap['postId'],
                    widget.snap['text'],
                    user.uid,
                    user.photoUrl,
                    user.username,
                  );
                },
                child: Container(
                  child: Text(
                    'Post',
                    style: TextStyle(
                      color: blueColor,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 8,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
