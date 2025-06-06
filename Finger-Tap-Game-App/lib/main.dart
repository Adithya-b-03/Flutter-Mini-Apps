import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MainPage()));
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Center(
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GamePage()),
                  );
                },
                color: Colors.white,
                height: 150,
                minWidth: 150,
                shape: CircleBorder(),
                child: Text("START"),
              ),
            ),
          ),
          Container(
            color: Colors.red,
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Center(
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GamePage()),
                  );
                },
                color: Colors.white,
                height: 150,
                minWidth: 150,
                shape: CircleBorder(),
                child: Text("START"),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double blueht = 0;

  double redht = 0;

  int score = 0;

  bool i = false;

  @override
  Widget build(BuildContext context) {
    if (i == false) {
      blueht = MediaQuery.of(context).size.height / 2;
      redht = MediaQuery.of(context).size.height / 2;
      i = true;
    }
    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              setState(() {
                blueht += 30;
                redht -= 30;
                score += 5;
              });
              double maxht = MediaQuery.of(context).size.height - 60;
              if (blueht > maxht) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage("Player B", score),
                  ),
                );
              }
            },
            child: Container(
              color: Colors.blue,
              height: blueht,
              width: double.infinity,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Player B",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "score",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          MaterialButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              setState(() {
                redht += 30;
                blueht -= 30;
                score += 5;
              });
              double maxht = MediaQuery.of(context).size.height - 60;
              if (redht > maxht) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage("Player A", score),
                  ),
                );
              }
            },
            child: Container(
              color: Colors.red,
              height: redht,
              width: double.infinity,
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Player A",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "Score",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  String player = "";
  int score = 0;

  ResultPage(this.player, this.score);

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: (player == "Player A") ? Colors.red : Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              (player == "Player A") ? "PLAYER A WONS!!!" : "PLAYER B WONS!!!",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              score.toString(),
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            MaterialButton(
              color: Colors.white,

              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text("Restart Game"),
            ),
          ],
        ),
      ),
    ));
  }
}
