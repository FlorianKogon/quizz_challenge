import 'package:flutter/material.dart';
import 'question.dart';

class Quizz extends StatefulWidget {
  String title;

  Quizz(this.title);

  @override
  _QuizzState createState() => _QuizzState();
}

class _QuizzState extends State<Quizz> {
  int index = 0;
  bool answer;
  int count = 0;

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Card(
              elevation: 15.0,
              child: Container(
                height: 250,
                width: MediaQuery.of(context).size.height / 2,
                child: Image.asset(
                  'assets/' + listeQuestions[index].imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              'Question numéro : ${index + 1} / ${listeQuestions.length}',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              listeQuestions[index].title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  color: Colors.green,
                  onPressed: () {
                    alert();
                    answer = true;
                    index++;
                  },
                  child: Text(
                    'Vrai',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                RaisedButton(
                  color: Colors.red,
                  onPressed: () {
                    alert();
                    answer = false;
                    index++;
                  },
                  child: Text(
                    'Faux',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future alert() async {
    checkingAnswer() ? count ++ : count = count;
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: checkingAnswer() ? Text('Bonne réponse', textScaleFactor: 1.5,) : Text('Mauvaise Réponse', textScaleFactor: 1.5,),
          content: Text(listeQuestions[index - 1].explanation,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          contentPadding: EdgeInsets.all(10.0),
          actions: <Widget>[
            RaisedButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Question suivante",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
  checkingAnswer() {
    return (answer == listeQuestions[index].response);
  }
}
