import 'package:flutter/material.dart';
import 'custom_text.dart';
import 'package:quizz_challenge/models/question.dart';

class PageQuizz extends StatefulWidget {

  @override
  _PageQuizzState createState() => _PageQuizzState();

}

class _PageQuizzState extends State<PageQuizz> {

  Question question;

  List<Question> listeQuestions = [
    Question('La devise de la Belgique est l\'union fait la force', true, '',
        'belgique.JPG'),
    Question('La lune va finir par tomber sur terre à cause de la gravité',
        false, 'Au contraire la lune s\'éloigne', 'lune.jpg'),
    Question('La Russie est plus grande en superficie que Pluton', true, '',
        'russie.jpg'),
    Question('Nyctalope est une race naine d\'antilope', false,
        'C’est une aptitude à voir dans le noir', 'nyctalope.jpg'),
    Question('Le Commodore 64 est l\’oridnateur de bureau le plus vendu', true,
        '', 'commodore.jpg'),
    Question('Le nom du drapeau des pirates es black skull', false,
        'Il est appelé Jolly Roger', 'pirate.png'),
    Question('Haddock est le nom du chien Tintin', false, 'C\'est Milou',
        'tintin.jpg'),
    Question('La barbe des pharaons était fausse', true,
        'A l\'époque déjà ils utilisaient des postiches', 'pharaon.jpg'),
    Question('Au Québec tire toi une bûche veut dire viens viens t\'asseoir',
        true, 'La bûche, fameuse chaise de bucheron', 'buche.jpg'),
    Question('Le module lunaire Eagle de possédait de 4Ko de Ram', true,
        'Dire que je me plains avec mes 8GO de ram sur mon mac', 'eagle.jpg'),
  ];

  int index = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    question = listeQuestions[index];
  }

  @override
  Widget build(BuildContext context) {
    double taille = MediaQuery
        .of(context)
        .size
        .width * 0.75;
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: CustomText('Le Quizz',),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CustomText(
                "Question numéro: ${index + 1}", color: Colors.grey[900]),
            CustomText("Score: $score / $index", color: Colors.grey[900]),
            Card(
              elevation: 10.0,
              child: Container(
                height: taille,
                width: taille,
                child: Image.asset("assets/${question.imagePath}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            CustomText(question.title, color: Colors.grey[900], factor: 1.3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buttonBool(true),
                buttonBool(false),
              ],
            ),
          ],
        ),
      ),
    );
  }

  RaisedButton buttonBool (bool b) {
    return RaisedButton(
      onPressed: (() => dialogue(b)),
      elevation: 10.0,
      color: Colors.blue,
      child: CustomText((b)? "Vrai" : "Faux", factor: 1.25,),
    );
  }

  Future dialogue(bool b) async {
    bool answer = (b == question.response);
    String vrai = "assets/vrai.jpg";
    String faux = "assets/faux.jpg";
    if (answer) {
      score++;
    }

    return showDialog(
        context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: CustomText((answer)? "C'est gagné" : "Oups ! Perdu...", factor: 1.4, color: (answer)? Colors.green : Colors.red,),
          contentPadding: EdgeInsets.all(20.0),
          children: <Widget>[
            Image.asset((answer)? vrai : faux, fit: BoxFit.cover,),
            Container(height: 25.0,),
            CustomText(question.explanation, factor: 1.25, color: Colors.grey[900]),
            Container(height: 25.0,),
            RaisedButton(onPressed: () {
              Navigator.pop(context);
              nextQuestion();
            },
              child: CustomText("Question suivante", factor: 1.25,
              ),
            ),
          ],
        );
      },
    );
  }

  Future alerte() async {
    return showDialog(context: context,
      barrierDismissible: false,
      builder: (BuildContext buildContext) {
        return AlertDialog(
          title: CustomText("C'est fini", color: Colors.blue, factor: 1.25,),
          contentPadding: EdgeInsets.all(10.0),
          content: CustomText("Votre score : $score / $index", color: Colors.grey[900],),
          actions: <Widget>[
            FlatButton(
              onPressed: (() {
                Navigator.pop(buildContext);
                Navigator.pop(context);
              }),
              child: CustomText("OK", factor: 1.25, color: Colors.blue,)
            ),
          ],
        );
      },
    );
  }

  void nextQuestion() {
    if (index < listeQuestions.length - 1) {
      index++;
      setState(() {
        question = listeQuestions[index];
      });
    } else {
      alerte();
    }
  }
}