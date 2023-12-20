import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class edit_profile extends StatefulWidget {
  const edit_profile({Key? key}) : super(key: key);

  @override
  State<edit_profile> createState() => _edit_profileState();
}

class _edit_profileState extends State<edit_profile> {
  PickedFile? _imageFile;
  bool isExpanded = false;
  final ImagePicker _picker = ImagePicker();
  Widget bottomSheet() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.06,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            // ignore: deprecated_member_use
            TextButton.icon(
              style: TextButton.styleFrom(
                primary: Theme.of(context).primaryColor,
              ),
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            SizedBox(
              width: 20,
            ),
            // ignore: deprecated_member_use
            TextButton.icon(
              style: TextButton.styleFrom(
                primary: Theme.of(context).primaryColor,
              ),
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    // ignore: deprecated_member_use
    final pickedFile = await _picker.pickImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile as PickedFile?;
    });
  }

  void toggle_expanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Edit Profile',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w600, letterSpacing: 1.0),
          ),
        ),
        elevation: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          top: 12.0,
                          bottom: 10,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              height: 130,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(29),
                                  shape: BoxShape.rectangle,
                                  color: Colors.transparent),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(29),
                                child: _imageFile == null
                                    ? Image.asset(
                                        'assets/images/kanoza.jpg',
                                        height: 60,
                                        width: 100,
                                        fit: BoxFit.scaleDown,
                                      )
                                    : Image.file(
                                        File(_imageFile!.path),
                                        width: 100,
                                        height: 60,
                                      ),
                              ),
                            ),
                            Positioned(
                              right:
                                  MediaQuery.of(context).size.height * 0.00009,
                              bottom:
                                  MediaQuery.of(context).size.height * 0.001,
                              // left: MediaQuery.of(context).size.height *0.2,
                              child: Container(
                                //  height: MediaQuery.of(context).size.height*0.2,\
                                // width:MediaQuery.of(context).size.width *0.8,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(25.0))),
                                      context: context,
                                      builder: ((builder) => bottomSheet()),
                                    );
                                  },
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color: Theme.of(context).primaryColor,
                                    size: MediaQuery.of(context).size.height *
                                        0.06,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'kenzy kazak',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'kenzy@yahoo.com',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Name',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.person_outline_outlined,
                                color: Theme.of(context).primaryColor,
                                size: 28,
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration.collapsed(
                                      hintText: 'Enter your name'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Email',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.email_outlined,
                                color: Theme.of(context).primaryColor,
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration.collapsed(
                                      hintText: 'Enter your email address'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Phone number',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.phone_in_talk_outlined,
                                color: Theme.of(context).primaryColor,
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              Expanded(
                                child: TextField(
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration.collapsed(
                                    hintText: 'Enter your phone number',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Date of Birth',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                              // color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                width: 100,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey.shade200),
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 10.0, top: 6.0),
                                  child: Center(
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration.collapsed(
                                          hintText: 'day',
                                          hintStyle: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.5)),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey.shade200),
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 10.0, top: 6.0),
                                  child: Center(
                                    child: TextField(
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration.collapsed(
                                          hintText: 'Month',
                                          hintStyle: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.5)),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey.shade200),
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 10.0, top: 6.0),
                                  child: Center(
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration.collapsed(
                                          hintText: 'Year',
                                          hintStyle: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.5)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:18,vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                       // width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Save',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.2),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                fixedSize: Size(
                                    MediaQuery.of(context).size.width * 0.4, 52)),
                          ),
                        ),
                      ),
                      Container(
                       // width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Delete',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.2),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              fixedSize: Size(
                                  MediaQuery.of(context).size.width * 0.4, 52)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
