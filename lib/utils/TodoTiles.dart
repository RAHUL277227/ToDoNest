import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTiles extends StatelessWidget {
  String taskName;
  bool istaskCheck;
  Function(bool?)? onChanged;
  Function(BuildContext)? onDelete;
  TodoTiles({super.key, required this.taskName, required this.istaskCheck ,required this.onChanged,required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,top: 20,right: 20),
      child: Slidable(
        endActionPane: ActionPane(

          motion: const ScrollMotion(), 
          children: [
             SlidableAction(

            onPressed: onDelete,
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
            borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
          ]
          
          ),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
        
              // check box
              Checkbox(value: istaskCheck, onChanged: onChanged,activeColor: Colors.black,),
        
              // task name 
              Text(taskName,
              style: TextStyle( decoration: istaskCheck ? TextDecoration.lineThrough : TextDecoration.none),),
            ],
          ),
        
          // box dexoration for task
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomRight: Radius.circular(30))
          ),
        ),
      ),
    );
  }
}