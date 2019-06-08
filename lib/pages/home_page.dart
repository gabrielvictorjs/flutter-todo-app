import 'package:flutter/material.dart';
import 'package:todoapp/models/todo_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Todo> _todos = List<Todo>();

  @override
  void initState() {
    _todos.add(Todo(title: "Make Coffee"));
    _todos.add(Todo(title: "To do the Homework"));
    _todos.add(Todo(title: "Read a book"));
    super.initState();
  }

  void _setCompleteness(Todo item) {
    item.complete = !item.complete;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Todo App", style: TextStyle(
          fontWeight: FontWeight.bold,
        )),
        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () => _setCompleteness(_todos[index]),
            title: Text(_todos[index].title), 
            trailing: Icon(Icons.check_box)
          );
        }
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: Icon(Icons.add),
      ),
    );
  }
}