import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'home.dart';

class AddInternship extends StatefulWidget {
  @override
  _AddInternshipState createState() => _AddInternshipState();
}

class _AddInternshipState extends State<AddInternship> {
  final formKey = new GlobalKey<FormState>();

  String company = "",
      position = "",
      stipend = "",
      description = "",
      requirements = "",
      link = "",
      startDate = "",
      duration = "",
      eligible = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Add a new Internship"),
        ),
        body: new Container(
          margin: const EdgeInsets.all(30.0),
          child: new SingleChildScrollView(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Form(
                  // form to enter internship details
                  key: formKey,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                      ),
                      new CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        radius: 50.0,
                        child: new Icon(
                          Icons.gesture,
                          color: Colors.white,
                          size: 50.0,
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Company Name",
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          return value.isEmpty
                              ? "Company name is required"
                              : null;
                        },
                        onSaved: (value) {
                          return company = value;
                        },
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Position",
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          return value.isEmpty ? "Position is required" : null;
                        },
                        onSaved: (value) {
                          return position = value;
                        },
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Duration in months",
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return value.isEmpty ? "Duration is required" : null;
                        },
                        onSaved: (value) {
                          return duration = value;
                        },
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Eligibility",
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          return value.isEmpty
                              ? "Eligibility is required"
                              : null;
                        },
                        onSaved: (value) {
                          return eligible = value;
                        },
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Stipend",
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          return value.isEmpty ? "Stipend is required" : null;
                        },
                        onSaved: (value) {
                          return stipend = value;
                        },
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Description",
                        ),
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        validator: (value) {
                          return value.isEmpty
                              ? "Description is required"
                              : null;
                        },
                        onSaved: (value) {
                          return description = value;
                        },
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Requirements",
                        ),
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        validator: (value) {
                          return value.isEmpty
                              ? "Requirements are required"
                              : null;
                        },
                        onSaved: (value) {
                          return requirements = value;
                        },
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Registration Link",
                        ),
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        validator: (value) {
                          return value.isEmpty ? "Link is required" : null;
                        },
                        onSaved: (value) {
                          return link = value;
                        },
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Start Date",
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          return value.isEmpty
                              ? "Start Date is required"
                              : null;
                        },
                        onSaved: (value) {
                          return startDate = value;
                        },
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                      ),
                      new RaisedButton(
                        child: new Text("Submit Internship Details"),
                        color: Colors.blueAccent,
                        textColor: Colors.white,
                        onPressed: validateandsubmit,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  bool validateandsave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void validateandsubmit() {
    if (validateandsave()) {
      DatabaseReference ref = FirebaseDatabase.instance.reference();
      var data = {
        "company": company,
        "position": position,
        "stipend": stipend,
        "eligibility": eligible,
        "duration": duration,
        "description": description,
        "requirements": requirements,
        "link": link,
        "startDate": startDate
      };
      ref.child("posts").push().set(data); //add to firebase instance
      Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (BuildContext context) => new HomePage()));
    }
  }
}
