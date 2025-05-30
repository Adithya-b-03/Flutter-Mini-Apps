import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String inp = "";
  String op = "";
  String calc = "";
  @override
  Widget build(BuildContext context) {
    double wsize = MediaQuery.of(context).size.width / 4.9;
    double hsize = MediaQuery.of(context).size.width / 20;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              child: Text(
                inp,
                style: TextStyle(color: Colors.white, fontSize: 80),
              ),
            ),
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    calcButton("7", Colors.white38, hsize, wsize),
                    calcButton("8", Colors.white38, hsize, wsize),
                    calcButton("9", Colors.white38, hsize, wsize),
                    calcButton("/", Colors.orange, hsize, wsize),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    calcButton("4", Colors.white38, hsize, wsize),
                    calcButton("5", Colors.white38, hsize, wsize),
                    calcButton("6", Colors.white38, hsize, wsize),
                    calcButton("*", Colors.orange, hsize, wsize),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    calcButton("1", Colors.white38, hsize, wsize),
                    calcButton("2", Colors.white38, hsize, wsize),
                    calcButton("3", Colors.white38, hsize, wsize),
                    calcButton("-", Colors.orange, hsize, wsize),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    calcButton("0", Colors.white38, hsize, wsize),
                    calcButton(".", Colors.white38, hsize, wsize),
                    calcButton("=", Colors.white38, hsize, wsize),
                    calcButton("+", Colors.orange, hsize, wsize),
                  ],
                ),
              ],
            ),
            calcButton("clear", Colors.black26, hsize, wsize),
          ],
        ),
      ),
    );
  }

  Widget calcButton(String text, Color bgColor, double hsize, double wsize) {
    return InkWell(
      onTap: () {
        if (text == "clear") {
          setState(() {
            inp = "";
            calc = "";
            op = "";
          });
        } else if (text == "+" || text == "-" || text == "*" || text == "/") {
          setState(() {
            calc = inp;
            inp = "";
            op = text;
          });
        } else if (text == "=") {
          setState(() {
            double n1 = double.parse(calc);
            double n2 = double.parse(inp);
            if (op == "+") {
              inp = (n1 + n2).toString();
            } else if (op == "-") {
              inp = (n1 - n2).toString();
            } else if (op == "*") {
              inp = (n1 * n2).toString();
            } else {
              inp = (n1 / n2).toString();
            }
          });
        } else {
          setState(() {
            inp = inp + text;
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1000),
          color: bgColor,
        ),
        height: hsize,
        width: wsize,
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 30)),
      ),
    );
  }
}
