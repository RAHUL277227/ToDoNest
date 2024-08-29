import 'package:hive_flutter/hive_flutter.dart';

class ToDODatabase{

List myList  = [];
final box = Hive.box("myBox");

void createInitData(){
  myList =[
    ["Use My App",false],
    ["Add New task",false],
  ];
}

void getDataDB(){
  myList = box.get("MYLIST");
}

void updateDataDB(){
  box.put("MYLIST", myList);
}


}