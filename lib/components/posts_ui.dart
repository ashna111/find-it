import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//posts card UI
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
