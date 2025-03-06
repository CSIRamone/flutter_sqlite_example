
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseSqlite {
  
  //Future<Database> openConnection() async {
    Future<Database> openConnection() async {

    final databasePath = await getDatabasesPath();
    final databasesFinalPath = join(databasePath, 'SQLITE_EXAMPLE');

    return await openDatabase(
      databasesFinalPath,
      version: 3,
      onConfigure: (db) async {
        print('onConfigure sendo chamado');
        await db.execute('PRAGMA foreing_keys = ON');
      },

      // chamada somente no momento de criacao do banco de dados
      // primeira vez que carrega o aplicativo
      onCreate: (Database db, int version){
        print('onCreate chamada....');
        final batch = db.batch();
        batch.execute('''
        create table teste(
          id Integer primary key autoincrement, 
          nome varchar(200)
          )
        ''');
        batch.execute('''
        create table produto
          id Integer primary key autoincrement, 
          nome varchar(200)
          )
        ''');
        batch.execute('''
        create table categoria(
          id Integer primary key autoincrement, 
          nome varchar(200)
          )
        ''');
        batch.commit();
      },

      // será chamado sempre que ouver uma alteracao na version incrementa (1 -> 2)
      onUpgrade: (Database db, int oldVersion, int version){
        print('onUpgrade chamado....');
        final batch = db.batch();
        if(oldVersion == 2){
          batch.execute('''
        create table categoria(
          id Integer primary key autoincrement, 
          nome varchar(200)
          )
        ''');
        }
        batch.commit();

      },

      // será chamado sempre que ouver uma alteracao no version decrementa (2 -> 1)
      onDowngrade: (Database db, int oldVersion, int version){
        print('onDowngrade chamado....');
        final batch = db.batch();
        if(oldVersion == 3){
          batch.execute(
            ''' 
            drop table categoria
            ''',
          );
        }
        batch.commit();
      },
      );
  }
}