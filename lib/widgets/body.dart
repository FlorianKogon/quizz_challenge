import 'package:flutter/material.dart';
import 'package:quizz_challenge/quizz.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Card(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: 250,
              child: Image.asset("assets/cover.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          RaisedButton(
            onPressed: toNewPage,
            color: Colors.teal,
            child: Text("Start the quizz",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void toNewPage() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return Quizz('Le quizz commence');
    }));
  }
}
