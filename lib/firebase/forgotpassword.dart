import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_unknowns/utils/theme.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _nameController = TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _nameController.text.trim());
      showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
                insetAnimationDuration: const Duration(seconds: 1),
                title: const Text("Success"),
                content: const Text("Password reset link sent!"),
                actions: <Widget>[
                  CupertinoDialogAction(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Done",
                          style: TextStyle(color: AppColors.themeColor)))
                ],
              ));
    } on FirebaseAuthException catch (e) {
      print(e);
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
                              "Forgot your password?,",
                              style: TextStyle(
                                  fontSize: 35,
                                  letterSpacing: 1,
                                  color: cond == Brightness.dark
                                      ? AppColors.tertThemeColor
                                          .withOpacity(0.7)
                                      : AppColors.darkText.withOpacity(0.8)),
                            ),
                            Text(
                              "No issues:)",
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
                              passwordReset();
                            },
                            child: const Text(
                              "Reset password",
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
