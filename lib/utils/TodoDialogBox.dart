import 'package:flutter/material.dart';

class TodoDialogBox extends StatelessWidget {

  TextEditingController taskTxtController;
  Function()? onSave;
  Function()? onExit;

  TodoDialogBox({super.key,required this.taskTxtController,required this.onSave,required this.onExit});

  

  Widget myEditTxt(){
    return TextField(
      controller: taskTxtController,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.text_fields),
        labelText: "Task",
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      ),
    );
  }

  Widget mybtn(void Function()? onPressed, String txt){
    return MaterialButton(
        onPressed: onPressed, 
        child: Text(txt,style: TextStyle(color: Colors.yellow),),
        color: Colors.black,
        );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        padding: EdgeInsets.all(20),
        height: 200,
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            myEditTxt(),

            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                mybtn(onSave, "Save"),
                mybtn(onExit, "Exit")
              ],
            )
          ],
        )
      ),
    );
  }
}