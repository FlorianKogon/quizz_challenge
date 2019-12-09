import 'package:flutter/material.dart';
import 'package:quizz_challenge/quizz.dart';
import 'package:quizz_challenge/widgets/custom_text.dart';

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
            elevation: 10.0,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.8,
              child: Image.asset("assets/cover.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          RaisedButton(
            onPressed: toNewPage,
            color: Colors.blue,
            child: CustomText("Start the quizz",
              factor: 1.5,
              color: Colors.grey[900]
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
