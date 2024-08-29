import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/Database/ToDoDatabase.dart';
import 'package:todo_app/utils/TodoDialogBox.dart';
import 'package:todo_app/utils/TodoTiles.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final taskTxtController = TextEditingController();
  ToDODatabase mydb = ToDODatabase();
  var box = Hive.box("MyBox");

  @override
  void initState() {
    if(box.get("MYLIST") == null){
      mydb.createInitData();
    }else{
      mydb.getDataDB();
    }
    super.initState();
  }

  void onSave(){
    setState(() {
      mydb.myList.add([taskTxtController.text,false]);
      taskTxtController.clear();
      Navigator.of(context).pop();
    });
    mydb.updateDataDB();
  }

  void onExit(){
    Navigator.of(context).pop();
  }

  void openDilog(){
    showDialog(context: context, builder: (context) {
      return TodoDialogBox(taskTxtController: taskTxtController,onSave: onSave,onExit: onExit,);
    },);
  }

  void onChangeTaskCheck(value,index){
     setState(() {
       mydb.myList[index][1] = !mydb.myList[index][1];
     });
     mydb.updateDataDB();
  }

  void onDelete(int index){
    setState(() {
      mydb.myList.removeAt(index);
    });
    mydb.updateDataDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        elevation: 0,
        centerTitle: true,
        title: Text("TO-DO"),
      ),

      floatingActionButton: FloatingActionButton(

        onPressed: (){openDilog();},
        child: Icon(Icons.add),
        backgroundColor: Colors.yellow,
        shape: CircleBorder(), 

      ),

      body: ListView.builder(itemCount: mydb.myList.length,
      itemBuilder: (context, index) {
        return TodoTiles(
          onDelete: (context) {
            onDelete(index);
          },
          taskName: mydb.myList[index][0],
          istaskCheck: mydb.myList[index][1], 
          onChanged: (value){
            onChangeTaskCheck(value,index);
          } 
          );
      },)
    );
  }
}