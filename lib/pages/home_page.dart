import 'package:flutter/material.dart';
import 'package:todoapp/models/todo_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Todo> list = List<Todo>();

  @override
  void initState() {
    list.add(Todo(title: "Make Coffee"));
    list.add(Todo(title: "To do the Homework"));
    list.add(Todo(title: "Read a book"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: ListView.separated(
          itemCount: list.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () => print(list[index].title),
              title: Text(list[index].title), 
              trailing: Icon(Icons.check_box)
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: Icon(Icons.add),
      ),
    );
  }
}