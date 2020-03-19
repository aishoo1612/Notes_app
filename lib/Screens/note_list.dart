import 'package:flutter/material.dart';
import 'package:notes_app/Screens/note_detail.dart';
//import 'dart:async';
import 'package:notes_app/models/model.dart' ;
import 'package:notes_app/utils/database_helper.dart';
//import 'package:sqflite/sqflite.dart' ;


class NoteList extends StatefulWidget {


  @override
  State <StatefulWidget> createState() {

    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList ;
  int count = 0;

  @override
  Widget build(BuildContext context) {

    if(noteList == null){
      noteList = List<Note>() ;
    }



    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB Clicked');
          navigateToDetail('Add note'); },
        tooltip: 'Add Note',

        child: Icon(Icons.add),

      ),
    );
  }

  ListView getNoteListView() {
    TextStyle titleStyle = Theme
        .of(context)
        .textTheme
        .subhead;

    return ListView.builder(
      //itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.yellowAccent,
                child: Icon(Icons.keyboard_arrow_right),
              ),

              title: Text('Dummy Title', style: titleStyle),

              subtitle: Text('Dummy Date'),

              trailing: Icon(Icons.delete, color: Colors.blueGrey,),

              onTap: () {
                debugPrint("List Tapped");
                navigateToDetail('Edit Note');
              }

          ), //ListTitle
        ); //Card
      },
    );
  }

  //Navigator_Router Function

void navigateToDetail(String title){
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return NoteDetail(title);
  }));
}
}