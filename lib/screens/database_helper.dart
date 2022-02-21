import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = "gemini.db";
  static final _databaseVersion = 1;

  static final table_cart = 'tbl_cart';
  static final table_config = 'tbl_config';

  static final CART_item_id = 'item_id';
  static final CART_quantity = 'quantity';
  static final CART_date_added = 'date_added';
  static final CART_checkout_status = 'checkout_status';

  static final CONFIG_id = 'id';
  static final CONFIG_access_token = 'access_token';
  static final CONFIG_uid = 'uid';
  static final CONFIG_user_role = 'user_role';

  // make this a singleton class
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE $table_cart ( $CART_item_id INTEGER,'
        '$CART_quantity INTEGER,$CART_checkout_status INTEGER,$CART_date_added TEXT)');
    await db.execute('CREATE TABLE $table_config ( $CONFIG_access_token TEXT,$CONFIG_id INTEGER PRIMARY KEY ON CONFLICT REPLACE,$CONFIG_uid INTEGER '
        ',$CONFIG_user_role TEXT)');
  }

  // Helper methods

  Future<List<Map<String, dynamic>>> search_for_cart(int item_id) async {
    // get a reference to the database
    Database db = await DatabaseHelper.instance.database;

    // raw query
    List<Map> result = await db.rawQuery(
        'SELECT * FROM $table_cart  WHERE $CART_item_id =? LIMIT 1', [item_id]);

    // print the results
    result.forEach((row) {});
    // {_id: 2, name: Mary, age: 32}
    return result;
  }

  Future<List<Map<String, dynamic>>> get_unchecked_from_cart() async {
    // get a reference to the database
    Database db = await DatabaseHelper.instance.database;

    // raw query
    List<Map> result = await db
        .rawQuery('SELECT * FROM $table_cart  WHERE $CART_checkout_status =0 ');

    // print the results
    result.forEach((row) {});
    // {_id: 2, name: Mary, age: 32}
    return result;
  }

  Future<List<Map<String, dynamic>>> all_cart() async {
    // get a reference to the database
    Database db = await DatabaseHelper.instance.database;

    // raw query
    List<Map> result = await db.rawQuery('SELECT * FROM $table_cart ');

    // print the results
    result.forEach((row) {});
    // {_id: 2, name: Mary, age: 32}
    return result;
  }

  Future add_symptoms(item, count, date, check_out_status) async {
    Database db = await DatabaseHelper.instance.database;

    final id = await db.rawInsert(
        'INSERT INTO ${table_cart} (${CART_item_id}, ${CART_quantity}, ${CART_date_added}, ${CART_checkout_status}) VALUES(?, ?, ?,?)',
        [item, count, date, check_out_status]);
    print('inserted row id: $id');
  }

  Future add_auth_token(token,uid,role) async {
    Database db = await DatabaseHelper.instance.database;

    final id = await db.rawInsert(
        'INSERT INTO ${table_config} (${CONFIG_access_token},${CONFIG_id},${CONFIG_uid},${CONFIG_user_role}) VALUES(?,?,?,?)',
        [token, 1,uid,role]);
    print('inserted row id: $id');
  }
  Future<String> get_auth_token() async {
    // get a reference to the database
    Database db = await DatabaseHelper.instance.database;

    // raw query
    List<Map> result = await db.rawQuery('SELECT * FROM $table_config LIMIT 1');
    String token='';

    // print the results
    result.forEach((row) {
      token= row['access_token'];
    });
    // {_id: 2, name: Mary, age: 32}
    return token;
  }

  Future<String> get_user_role() async {
    // get a reference to the database
    Database db = await DatabaseHelper.instance.database;

    // raw query
    List<Map> result = await db.rawQuery('SELECT * FROM $table_config LIMIT 1');
    String role='';

    // print the results
    result.forEach((row) {
      role= row['user_role'];
    });
    // {_id: 2, name: Mary, age: 32}
    return role;
  }


  Future<int> update_symptoms(item_id, count) async {
    Database db = await instance.database;

    return await db.rawUpdate(
        'UPDATE $table_cart SET ${CART_quantity}=?, ${CART_checkout_status} =? WHERE ${CART_item_id}=?',
        [count, 0, item_id]);
  }

  Future<int> log_out() async {
    Database db = await instance.database;

    return await db.rawUpdate(
        'Delete from $table_config');
  }

}
