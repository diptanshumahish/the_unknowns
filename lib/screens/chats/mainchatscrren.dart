import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:the_unknowns/utils/theme.dart';

// ignore: must_be_immutable
class ChatScreen extends StatefulWidget {
  var user;
  ChatScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _messageController = TextEditingController();
  final database = FirebaseDatabase.instance.ref();
  late StreamSubscription _messageStream;
  // ignore: prefer_typing_uninitialized_variables
  var message;

  @override
  void initState() {
    _activateListeners();
    super.initState();
  }

  void _activateListeners() {
    _messageStream = database.child('messages').onValue.listen((event) {
      database.child('messages').onValue.listen((event) {
        var data = <Map<String, dynamic>>.add(event.snapshot.value);
        setState(() {
          message = messagebody;
        });
      });
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    _activateListeners();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ref = database.child('message/messagebody');
    //set

    var cond = Theme.of(context).brightness;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.back,
              color: cond == Brightness.dark
                  ? AppColors.lightText
                  : AppColors.darkText,
            )),
        title: Text(
          "Chat Room",
          style: TextStyle(
            fontSize: 25,
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
            color: cond == Brightness.dark
                ? AppColors.lightText
                : AppColors.darkText,
          ),
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: LottieBuilder.asset('assets/lottie/moon.json',
                repeat: false, height: height, addRepaintBoundary: false),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: width,
              height: height * 0.08,
              color: cond == Brightness.dark
                  ? AppColors.darkBack
                  : AppColors.secThemeColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      height: height * 0.04,
                      width: width * 0.7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          controller: _messageController,
                          style: TextStyle(
                              fontSize: 20,
                              color: cond == Brightness.dark
                                  ? AppColors.lightBack
                                  : AppColors.darkBack,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold),
                          decoration: const InputDecoration(
                              hintText: "Enter your message",
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none),
                        ),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(CupertinoIcons.add_circled_solid)),
                    IconButton(
                        onPressed: () async {
                          final newMessage = <String, dynamic>{
                            'messagebody': _messageController.text.trim(),
                            'time': DateTime.now().millisecondsSinceEpoch
                          };

                          try {
                            await database
                                .child('messages')
                                .push()
                                .set(newMessage);
                          } catch (e) {
                            print("error $e");
                          }
                        },
                        icon: Icon(CupertinoIcons.share_solid))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void deactivate() {
    _messageStream.cancel();
    super.deactivate();
  }
}
