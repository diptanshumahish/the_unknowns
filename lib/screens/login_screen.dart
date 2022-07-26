import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:the_unknowns/firebase/forgotpassword.dart';
import 'package:the_unknowns/screens/newlogin.dart';

import '../utils/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _nameController.text.trim(),
          password: _passwordController.text.trim());
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //firebase authentication

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
                              onPressed: () {},
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
                              "Welcome to the,",
                              style: TextStyle(
                                  fontSize: 35,
                                  letterSpacing: 1,
                                  color: cond == Brightness.dark
                                      ? AppColors.tertThemeColor
                                          .withOpacity(0.7)
                                      : AppColors.darkText.withOpacity(0.8)),
                            ),
                            Text(
                              "Unknowns",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                  letterSpacing: 1,
                                  color: cond == Brightness.dark
                                      ? AppColors.lightText.withOpacity(0.7)
                                      : AppColors.darkText.withOpacity(0.8)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.16),
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
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.themeColor),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.themeColor),
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
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.themeColor),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.themeColor),
                                ),
                                hintText: "Password here",
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CupertinoButton(
                                padding: EdgeInsets.zero,
                                child: Text(
                                  "Forgot password?",
                                  style: TextStyle(
                                      color: AppColors.secThemeColorDark,
                                      fontSize: 18,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold,
                                      fontFamily:
                                          GoogleFonts.amaticSc().fontFamily),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              ForgotPassword())));
                                }),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: ElevatedButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(1),
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.secThemeColor),
                            ),
                            onPressed: () {
                              signIn();
                            },
                            child: const Text(
                              "Login!",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.darkBack,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      CupertinoButton(
                          child: Text(
                            "Create new account?",
                            style: TextStyle(
                                color: AppColors.secThemeColorDark,
                                fontSize: 25,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontFamily: GoogleFonts.amaticSc().fontFamily),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => NewLogin())));
                          })
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
