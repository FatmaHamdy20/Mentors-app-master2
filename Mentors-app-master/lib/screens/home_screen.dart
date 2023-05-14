import 'package:firebase_auth_app/screens/login_screen.dart';
import 'package:firebase_auth_app/screens/chat_screen.dart';
import 'package:firebase_auth_app/screens/post_screen.dart';
import 'package:firebase_auth_app/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatelessWidget {
  static const String screenRoute = 'homescreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            //---------------------------------
            //appBar
            //---------------------------------
            Container(
              color: Colors.yellow[200],
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Image.asset(
                    'images/withoutBG.png',
                    height: 60,
                    width: 60,
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

            //---------------------------------
            //myicon and what i post
            //---------------------------------
            Container(
              color: Colors.yellow[50],
              padding: EdgeInsets.only(left: 24, right: 22),
              child: Row(
                children: [
                  Container(
                      margin: EdgeInsets.all(4),
                      width: 40,
                      height: 40,
                      alignment: AlignmentDirectional.center,
                      //color: Colors.cyan,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),

                      child: Tooltip(
                        message: 'my profile',
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ProfileScreen()));
                          },
                          icon: Icon(
                            // 'images/withoutBG.png',
                            Icons.person,
                            //weight: 100,
                            size: 30,
                            color: Colors.blue[400],
                          ),
                        ),
                      )),

                  Text(
                    "askme",
                    style: TextStyle(
                      color: Colors.indigo,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  Spacer(),
                  Container(
                    // padding: EdgeInsets.all(1),
                    width: 120,
                    height: 30,
                    alignment: AlignmentDirectional.center,
                    //color: Colors.cyan,
                    decoration: BoxDecoration(
                      color: Colors.blue[400],
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PostScreen()));
                      },
                      child: Text(
                        'write something...',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )

            // ---------------------------------
            // listview for recieving posts
            // ---------------------------------
          ],
        ),
      ),
    );
  }
}

// class PostUI extends StatelessWidget {
//   const PostUI({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Post title
//           Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Text(
//               'My Awesome Post',
//               style: Theme.of(context).textTheme.headline6,
//             ),
//           ),
//           // Post image
//           Image.network(
//             'https://example.com/my-awesome-post-image.jpg',
//             fit: BoxFit.cover,
//             width: double.infinity,
//             height: 200.0,
//           ),
//           // Post content
//           Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Text(
//               'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
//               style: Theme.of(context).textTheme.bodyText2,
//             ),
//           ),
//           // Post metadata
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Posted by John Doe',
//                   style: Theme.of(context).textTheme.caption,
//                 ),
//                 Text(
//                   '3 days ago',
//                   style: Theme.of(context).textTheme.caption,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
