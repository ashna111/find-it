import 'package:flutter/material.dart';
import 'posts.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:url_launcher/url_launcher.dart';

class AllInternships extends StatefulWidget {
  @override
  _AllInternshipsState createState() => _AllInternshipsState();
}

class _AllInternshipsState extends State<AllInternships> {
  List<Post> postList = [];

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

  Widget postsUI(
      String company,
      String position,
      String stipend,
      String description,
      String requirements,
      String link,
      String startDate,
      String duration,
      String eligibility) {
    return new Card(
      elevation: 7.0,
      margin: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 10.0),
      child: new Container(
        padding: const EdgeInsets.all(14.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text(
              company,
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Expanded(
                  flex: 1,
                  child: new Text(
                    position,
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                new Expanded(
                  flex: 1,
                  child: new Text(
                    duration + " months",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Expanded(
                  flex: 1,
                  child: new Text(
                    eligibility,
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                new Expanded(
                  flex: 1,
                  child: new Text(
                    "Stipend: \n" + stipend,
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            new Text(
              "Requirements: \n" + requirements,
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            new Text(
              "Description: \n" + description,
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            new FlatButton(
              child: new Text(
                "Registration: \n" + link,
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueAccent,
                ),
              ),
              onPressed: () => {launch(link)},
            ),
            new Text(
              "Start Date: \n" + startDate,
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
