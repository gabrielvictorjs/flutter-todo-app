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
    setState(() {
      item.complete = !item.complete;
    });
  }

  void _removeTodo(Todo item) {
    _todos.remove(item);
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
        itemBuilder: (context, index) => buildTodoItem(_todos[index])
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildTodoItem(Todo item) {
    return Dismissible(
      key: Key(item.hashCode.toString()),
      onDismissed: (direction) => _removeTodo(item),
      direction: DismissDirection.startToEnd,
      background: Container(
        color: Colors.red[600],
        child: Icon(Icons.delete, color: Colors.white),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 12),
      ),

      child: ListTile(
        onTap: () => _setCompleteness(item),
        title: Text(item.title), 
        trailing: Checkbox(value: item.complete, onChanged: null)
      ),
    );
  }
}