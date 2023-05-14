// import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'myWidget.dart';

class PostScreen extends StatefulWidget {
  static const String screenRoute = 'postscreen';

  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<PostScreen> {

  File? _image;
  //String? _imageUrl;
  File? _videoUrl;


  // code to upload the image
  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      // final bytes = await pickedImage.readAsBytes();
      //  final base64 = base64Encode(bytes);
      setState(() {
        _image = File(pickedImage.path);
        //_imageUrl = 'data:image/png;base64,$base64';
      });
    }
  }

  // code to upload the video
  Future<void> _uploadVideo() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.video);

    if (result == null) return;

    final videoFile = File(result.files.single.path!);

    setState(() {
      _videoUrl = videoFile.path as File?;
    });
  }



  @override
  Widget build(BuildContext context) {
    MyWidget rv;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            //---------------------------------
            //PostBar
            //---------------------------------
            Container(
              color: Colors.yellow[200],
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
                    child: Icon(
                      // 'images/withoutBG.png',
                      Icons.person,
                      //weight: 100,
                      size: 30,
                      color: Colors.blue[400],
                    ),
                  ),
                  Text(
                    "askme",
                    style: TextStyle(
                      color: Colors.indigo,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  Container(
                    // padding: EdgeInsets.all(1),
                    width: 90,
                    height: 30,
                    alignment: AlignmentDirectional.center,
                    //color: Colors.cyan,
                    decoration: BoxDecoration(
                      color: Colors.blue[400],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PostScreen()));
                      },
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Post',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),


            //space between appBar and textField
            SizedBox(
              height: 20,
            ),


            //---------------------------------
            //textfield
            //---------------------------------
            SizedBox(
              height: 200,
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(15),
                child: TextField(
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Entertext',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),



            //---------------------------------
            //buttons to choose image or video
            //---------------------------------

            Row(

              children: [
                //space 20 from the left
                SizedBox(
                  width: 30,
                ),

                //show the image
                SizedBox(
                  child: rv = new MyWidget(200,200,imageUrl: _image),
                ),

                //show the video
                SizedBox(
                  child: rv = new MyWidget(200,200,videoUrl: _videoUrl),
                ),

                Spacer(),

                Column(
                  children: [
                    //image uploading
                    Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(right: 20),
                      width: 100,
                      child: IconButton(
                        onPressed: _pickImage,
                        icon: Icon(
                          color: Colors.blue,
                          Icons.image_outlined,
                          size: 50,
                        ),
                      ),
                    ),

                    //video uploading
                    Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(right: 20),
                      width: 100,
                      child: IconButton(
                        onPressed: _uploadVideo,
                        icon: Icon(
                          color: Colors.blue,
                          Icons.video_library_outlined,
                          size: 50,
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }



}
