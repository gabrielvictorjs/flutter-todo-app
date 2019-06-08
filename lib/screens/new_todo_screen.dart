import 'package:flutter/material.dart';

class NewTodoScreen extends StatelessWidget {
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
            TextField(),
            
            SizedBox(height: 20),
            
            RaisedButton(
              color: Colors.yellow,
              onPressed: () => {},
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