import 'package:flutter/material.dart';
import 'package:flutter_sqlite_tutorial/database/database_sqf.dart';

class HomePage extends StatefulWidget {

  const HomePage({ super.key });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

@override
  void initState() {

    super.initState();

    _database();

  }

  void _database() async {
    final database = await DatabaseSqlite().openConnection();

    //database.insert('teste', {'nome': 'Cidinei Inacio'});
    //database.delete('teste', where: 'nome = ?', whereArgs: ['Cidinei Inacio']);
    //database.update('teste', {'nome': 'Academia do Flutter'},
    //where: 'nome = ?', whereArgs: ['Cidinei Inacio']);
    
    //var result = await database.query('teste');
    //print(result);

    //---------------------------

    //database.rawInsert('insert into teste valeus(null, ?)', ['Cidinei Inacio']);
    //database.rawUpdate('update teste set nome = ?', ['Cidinei Academia do Flutter', 2]);
    //database.rawDelete('delete teste where id = ?', [2]);
    
    //var result = await database.rawQuery('select * from teste');
    //print(result);
    //-----------------------------------------
    
  }

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Home Page'),),
           body: Container(),
       );
  }
}