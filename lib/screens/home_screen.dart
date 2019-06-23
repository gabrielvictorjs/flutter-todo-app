import 'package:flutter/material.dart';
import 'package:todoapp/models/todo_model.dart';
import 'package:todoapp/screens/new_todo_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Todo> _todos = List<Todo>();

  @override
  void initState() {
    super.initState();
  }

  void _setCompleteness(Todo item) {
    setState(() {
      item.complete = !item.complete;
    });
  }

  void _removeTodo(Todo item) {
    setState(() {
      _todos.remove(item);
    });
  }

  void _addTodo(Todo item) {
    setState(() {
      _todos.add(item);
    });
  }

  void _goToNewItemView() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => NewTodoScreen()
    )).then((title) {
      if(title != null) _addTodo(Todo(title: title));
    });
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

      body: _todos.isEmpty 
      
      ? Center(child: Text(
          "Todo list is empty!",
          style: TextStyle(fontSize: 16),       
        )) 
      
      : ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) => buildTodoItem(_todos[index])
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: _goToNewItemView,
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