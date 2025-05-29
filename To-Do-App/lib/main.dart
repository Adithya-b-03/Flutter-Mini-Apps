import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String dispText = "no tasks added";
  List<String> tasks = [];
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("To Do App"),
          backgroundColor: Colors.blue,
          centerTitle: false,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Enter a Task"),
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  color: Colors.white,
                  height: 50,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {
                    setState(() {
                      tasks.add(textEditingController.text);
                      textEditingController.clear();
                    });
                  },
                  child: Text("Add Task"),
                ),
              ],
            ),

            Flexible(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return (Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text(tasks[index]),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            tasks.removeAt(index);
                          });
                        },
                        child: Icon(Icons.delete, color: Colors.red),
                      ),
                    ],
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
