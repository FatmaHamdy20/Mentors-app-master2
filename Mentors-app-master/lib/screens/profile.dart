// import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth_app/screens/home_screen.dart';
import 'package:firebase_auth_app/screens/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'chat_screen.dart';
import 'myWidget.dart';

class ProfileScreen extends StatefulWidget {
  static const String screenRoute = 'profilescreen';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _profileState();
}

class _profileState extends State<ProfileScreen> {
  late MyWidget rv;

  String? name;
  File? _image;

  // code to upload the image
  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  // code to upload the video

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            //Bar
            Container(
              color: Colors.yellow[200],
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Perform action when the image is tapped
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PostScreen()));
                    },
                    child: Image.asset(
                      'images/withoutBG.png',
                      height: 60,
                      width: 60,
                    ),
                  ),
                  Text(
                    "askme",
                    style: TextStyle(
                        color: Colors.indigo,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        shadows: [
                          Shadow(
                            color: Colors.black26,
                            blurRadius: 2.0,
                            offset: Offset(1.0, 1.0),
                          )
                        ]),
                  ),
                  Spacer(),
                  IconButton(
                    color: Colors.indigo,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ChatScreen()));
                    },
                    icon: Icon(Icons.chat),
                  ),
                ],
              ),
            ),

            //picture and name
            Container(
              color: Colors.blueGrey[50],
              child: SizedBox(
                height: 220,
                width: double.infinity,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      
                      Container(
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: _image == null
                            ? Icon(
                          Icons.person,
                          size: 140,
                        )
                            : SizedBox(
                          child: rv = new MyWidget(
                            140,
                            140,
                            imageUrl: _image,
                          ),
                        ),
                      ),
                      
                      Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.all(20),
                        child: Text(
                          name != null? name!:'askme',
                        ),
                      )
                      
                    ],
                  ),
                ),

              ),
            ),


            //username text
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  'User name : ',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.indigo,
                  ),
                ),
              ),
            ),
            //username textField
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    //email = value;
                  },
                  // controller: _emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email',
                  ),
                ),
              ),
            ),

            //profile pic
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  'profile picture :',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.indigo,
                  ),
                ),
              ),
            ),
            //profile pic getter
            Container(
              height: 120,
              // alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),

              child: GestureDetector(
                onTap: _pickImage,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.image_outlined,
                    size: 60,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
