import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/resources/auth_methods.dart';
import 'package:instagram/utils/colors.dart';
import 'package:instagram/utils/image_picker_util.dart';
import 'package:instagram/widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  static const String id = '/signup';
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late TextEditingController _emailController;
  late TextEditingController _bioController;
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _bioController = TextEditingController();
    _emailController = TextEditingController();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void selectImage() async {
    await pickImage(ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              //svg logo
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(
                height: 64,
              ),
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        'https://th.bing.com/th/id/OIP.nThb6IfbNSheNHmgkUJDFAHaJ4?w=186&h=248&c=7&r=0&o=5&pid=1.7'),
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextInputField(
                controller: _usernameController,
                enabledBorder: const OutlineInputBorder(),
                filled: true,
                inputBorder: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(),
                hinTtext: 'username',
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(
                height: 20,
              ),
              TextInputField(
                controller: _emailController,
                enabledBorder: const OutlineInputBorder(),
                filled: true,
                inputBorder: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(),
                hinTtext: 'email',
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(
                height: 20,
              ),
              TextInputField(
                controller: _passwordController,
                enabledBorder: const OutlineInputBorder(),
                filled: true,
                inputBorder: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(),
                hinTtext: 'password',
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              TextInputField(
                controller: _bioController,
                enabledBorder: const OutlineInputBorder(),
                filled: true,
                inputBorder: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(),
                hinTtext: 'enter your bio',
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  String res = await AuthMethods().signUp(
                    email: _emailController.text,
                    password: _passwordController.text,
                    username: _usernameController.text,
                    bio: _bioController.text,
                  );
                  log(res);
                },
                child: Container(
                  child: const Text('Sign Up'),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: blueColor,
                  ),
                ),
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: const Text('Do you have an account? '),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    Container(
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
