import 'package:flutter/material.dart';
import 'package:instagram/models/user_model.dart' as model;
import 'package:instagram/providers/user_providers.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    model.User? user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: Center(
        child: user != null ? Text(user.username) : SpinKitDoubleBounce(),
      ),
    );
  }
}
