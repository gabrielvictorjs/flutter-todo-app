import 'package:flutter/material.dart';

class NewTodoScreen extends StatefulWidget {

  @override
  _NewTodoScreenState createState() => _NewTodoScreenState();
}

class _NewTodoScreenState extends State<NewTodoScreen> {
  
  TextEditingController todoInputController = TextEditingController();

  void _saveTodo() {
    if(todoInputController.text.isNotEmpty)
      Navigator.of(context).pop(todoInputController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New", style: TextStyle(
          fontWeight: FontWeight.bold
        ))
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            TextField(
              controller: todoInputController,
              onEditingComplete: () {}, 
            ),

            SizedBox(height: 20),

            RaisedButton(
              color: Colors.yellow,
              onPressed: _saveTodo,
              child: Text("Save Todo", style: TextStyle(
                fontSize: 18,
              ))
            )
          ],

        ),
      )
    );
  }
}