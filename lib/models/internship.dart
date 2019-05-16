import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import '../components/posts.dart';
import '../components/posts_ui.dart';

class AllInternships extends StatefulWidget {
  @override
  _AllInternshipsState createState() => _AllInternshipsState();
}

class _AllInternshipsState extends State<AllInternships> {
  List<Post> postList = []; //to store all posts

  @override
  void initState() {
    super.initState();
    DatabaseReference postsRef =
        FirebaseDatabase.instance.reference().child("posts");

    postsRef.once().then((DataSnapshot snap) {
      var KEYS = snap.value.keys;
      var DATA = snap.value;

      postList.clear();

      for (var individualKey in KEYS) {
        //creating post objects
        Post p = new Post(
          DATA[individualKey]['company'],
          DATA[individualKey]['position'],
          DATA[individualKey]['stipend'],
          DATA[individualKey]['description'],
          DATA[individualKey]['requirements'],
          DATA[individualKey]['link'],
          DATA[individualKey]['startDate'],
          DATA[individualKey]['duration'],
          DATA[individualKey]['eligibility'],
        );
        postList.add(p);
      }

      setState(() {
        print("Length=$postList.length");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Internships"),
        ),
        body: new Container(
          child: postList.length == 0
              ? new Center(
                  child: new Text(
                    "Oops! No Internships available :(",
                    style: new TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : new ListView.builder(
                  itemCount: postList.length,
                  itemBuilder: (_, index) {
                    // refer to components.posts_ui.dart
                    return postsUI(
                        postList[index].company,
                        postList[index].position,
                        postList[index].stipend,
                        postList[index].description,
                        postList[index].requirements,
                        postList[index].link,
                        postList[index].startDate,
                        postList[index].duration,
                        postList[index].eligibility);
                  },
                ),
        ));
  }
}
