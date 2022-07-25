import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:the_unknowns/screens/screens.dart';

import '../utils/theme.dart';

class NewLogin extends StatefulWidget {
  const NewLogin({Key? key}) : super(key: key);

  @override
  State<NewLogin> createState() => _NewLoginState();
}

class _NewLoginState extends State<NewLogin> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _newPasswordController = TextEditingController();

  @override
  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (_nameController.text == "" || _passwordController.text == "") {
      showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
                insetAnimationDuration: const Duration(seconds: 1),
                title: const Text("Wrong credentials"),
                content: const Text("Incorrect password/username"),
                actions: <Widget>[
                  CupertinoDialogAction(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("retry",
                          style: TextStyle(color: AppColors.themeColor)))
                ],
              ));
    } else if (_passwordController.text.trim() !=
        _newPasswordController.text.trim()) {
      showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
                insetAnimationDuration: const Duration(seconds: 1),
                title: const Text("No match"),
                content: const Text("IPassword don't match"),
                actions: <Widget>[
                  CupertinoDialogAction(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("retry",
                          style: TextStyle(color: AppColors.themeColor)))
                ],
              ));
    } else {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _nameController.text.trim(),
          password: _passwordController.text.trim());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    var cond = Theme.of(context).brightness;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
            height: height,
            width: width,
            child: Stack(
              children: [
                // Positioned(
                //     child: LottieBuilder.asset(
                //   'assets/lottie/moon.json',
                // )),
                Center(
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(CupertinoIcons.back)),
                          Spacer()
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "New here ?, a'ight",
                              style: TextStyle(
                                  fontSize: 35,
                                  letterSpacing: 1,
                                  color: cond == Brightness.dark
                                      ? AppColors.tertThemeColor
                                          .withOpacity(0.7)
                                      : AppColors.darkText.withOpacity(0.8)),
                            ),
                            Text(
                              "Don't worry , your data will be anonymous :),",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28,
                                  letterSpacing: 1,
                                  color: cond == Brightness.dark
                                      ? AppColors.lightText.withOpacity(0.7)
                                      : AppColors.darkText.withOpacity(0.8)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.07),
                      Padding(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Enter your Email ",
                              style: TextStyle(
                                  fontSize: 35,
                                  letterSpacing: 1,
                                  color: cond == Brightness.dark
                                      ? AppColors.lightText.withOpacity(0.7)
                                      : AppColors.darkText.withOpacity(0.8)),
                            ),
                            TextField(
                              cursorColor: AppColors.themeColor,
                              controller: _nameController,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: cond == Brightness.dark
                                      ? AppColors.lightBack
                                      : AppColors.darkBack,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.themeColor),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: cond == Brightness.dark
                                          ? AppColors.lightBack
                                          : AppColors.darkBack),
                                ),
                                hintText: "Email here",
                              ),
                              textCapitalization: TextCapitalization.words,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Padding(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "password",
                              style: TextStyle(
                                  fontSize: 35,
                                  letterSpacing: 1,
                                  color: cond == Brightness.dark
                                      ? AppColors.lightText.withOpacity(0.7)
                                      : AppColors.darkText.withOpacity(0.8)),
                            ),
                            TextField(
                              obscureText: true,
                              cursorColor: AppColors.themeColor,
                              controller: _passwordController,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: cond == Brightness.dark
                                      ? AppColors.lightBack
                                      : AppColors.darkBack,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.themeColor),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: cond == Brightness.dark
                                          ? AppColors.lightBack
                                          : AppColors.darkBack),
                                ),
                                hintText: "Password here",
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Padding(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Confirm Password",
                              style: TextStyle(
                                  fontSize: 35,
                                  letterSpacing: 1,
                                  color: cond == Brightness.dark
                                      ? AppColors.lightText.withOpacity(0.7)
                                      : AppColors.darkText.withOpacity(0.8)),
                            ),
                            TextField(
                              obscureText: true,
                              cursorColor: AppColors.themeColor,
                              controller: _newPasswordController,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: cond == Brightness.dark
                                      ? AppColors.lightBack
                                      : AppColors.darkBack,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.themeColor),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: cond == Brightness.dark
                                          ? AppColors.lightBack
                                          : AppColors.darkBack),
                                ),
                                hintText: "Password again",
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.06),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: ElevatedButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(1),
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.secThemeColor),
                            ),
                            onPressed: () {
                              signUp();
                            },
                            child: Text(
                              "Sign Up!",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.darkBack,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
