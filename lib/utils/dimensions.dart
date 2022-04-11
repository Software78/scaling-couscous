import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram/screens/add_post.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  Text('home'),
  Text('search'),
  AddPost(),
  Text('notifications'),
  Text('profile'),
];
