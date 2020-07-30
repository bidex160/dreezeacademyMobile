import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


class DataBaseOpener{

  static const _dbName = 'myDatabase.db';
  static const _version = 1;
  static const _papertable  = "Paper1";
  static final _columId = '_id';
  static final columequestion = 'questions';
  static final columechA= 'chA';
  static final columechB = 'chB';
  static final columechC = 'chC';
  static final columechD = 'chD';
  static final columeAnswer = 'answer';
  static final columeSelected = 'selected';

  DataBaseOpener._privateConstructor();

  static final DataBaseOpener instance = DataBaseOpener._privateConstructor();

  static Database _database;

  Future<Database> get database async{

    if(_database != null) return _database;

    _database = await _initializedDatabase();
    return _database;

  }

  _initializedDatabase() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
     return await openDatabase(path, version: _version, onCreate: _onCreate);

  }
  Future _onCreate(Database db, int version){


    db.execute(
      '''
       CREATE TABLE $_papertable (
       $_columId INTEGER PRIMARY KEY,
       $columequestion TEXT NOT NULL,
       $columechA TEXT, 
       $columechB TEXT, 
       $columechC TEXT,
       $columechD TEXT, 
       $columeAnswer TEXT,
       $columeSelected TEXT
       )
       
       '''
    );


  }

  Future<int> insert(Map<String, dynamic> row) async{
    Database db = await instance.database;
   return await db.insert(_papertable, row);
  }







}
