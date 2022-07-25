import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:the_unknowns/utils/theme.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Future sendMessage(String message, String time) async {
    await FirebaseFirestore.instance.collection('messages').add({
      'messagebody': message,
      'Time': time,
    });
  }

  @override
  Widget build(BuildContext context) {
    final time = DateTime.now();
    final _messageController = TextEditingController();
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
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          controller: _messageController,
                          style: TextStyle(
                              fontSize: 20,
                              color: AppColors.darkBack,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              hintText: "Enter your message",
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none),
                        ),
                      ),
                      height: height * 0.04,
                      width: width * 0.7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(CupertinoIcons.add_circled_solid)),
                    IconButton(
                        onPressed: () {
                          sendMessage(_messageController.text.trim(),
                              time.toString().trim());
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
}
