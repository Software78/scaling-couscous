import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/main.dart';
import 'package:instagram/resources/auth_methods.dart';
import 'package:instagram/responsive/mobile_screen_layout.dart';
import 'package:instagram/screens/add_post.dart';
import 'package:instagram/utils/colors.dart';
import 'package:instagram/utils/utils.dart';
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
  Uint8List? _image;

  bool isLoading = false;

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
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void signUpUser() async {
    setState(() {
      isLoading = true;
    });
    String res = await AuthMethods().signUp(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      bio: _bioController.text,
      file: _image!,
    );
    if (res != 'success') {
      showSnackBar(context, res);
    } else {
      showSnackBar(context, res);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const AuthStream(),
        ),
      );
      setState(() {
        isLoading = false;
      });
    }
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
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : const CircleAvatar(
                          radius: 64,
                          child: Icon(
                            Icons.person,
                            color: primaryColor,
                          ),
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      splashRadius: 1,
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
                onTap: signUpUser,
                child: Container(
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        )
                      : const Text('Sign Up'),
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
                      child: const Text('Don"t have an account? '),
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
                    const SizedBox(height: 10),
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
