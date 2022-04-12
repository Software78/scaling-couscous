import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram/resources/auth_methods.dart';
import 'package:instagram/screens/add_post.dart';
import 'package:instagram/screens/feed_screen.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  FeedScreen(),
  Text('search'),
  AddPost(),
  Text('notifications'),
  Text('profile'),
];
