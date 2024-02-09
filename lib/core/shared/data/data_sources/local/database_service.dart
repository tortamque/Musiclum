import 'package:hive_flutter/hive_flutter.dart';

abstract class DatabaseService{
  
}

class DatabaseServiceImpl implements DatabaseService{
  DatabaseServiceImpl(this._box);

  final Box<dynamic> _box;
  
  
}