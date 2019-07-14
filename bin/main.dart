import 'dart:async';
import 'dart:async';
import 'package:dart_app/user.dart';
import 'package:mysql1/mysql1.dart';

final String database = "testdb";
final String tableUsers = "users";

final String deleteQuery = "delete from ${tableUsers} where id = ?";
final String insertQuery = "insert into ${tableUsers} (name, email, age) values (?, ?, ?)";
final String selectQuery = 'select id, name, email, age from ${tableUsers} where id = ?';
final String selectAllUsers = 'select * from ${database}.${tableUsers}';

Future main() async {

  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(
      ConnectionSettings(
          host: '127.0.0.1',
          port: 3306,
          user: 'root',
          db: 'testdb')
  );

  // TODO Info ->  CREATE TABLE
  // await conn.query('CREATE TABLE users (id int NOT NULL AUTO_INCREMENT PRIMARY KEY, name varchar(255), email varchar(255), age int)');

  // TODO Info ->  INSERT
  //var result = await insert(conn, "GG", "gg@email.com", 44);
  //print("Inserted row id = ${result.insertId}");

  // TODO Info -> BATH INSERT
  List<User> users = List<User>();
  users.add(User('Bod', 'bob@example.com', 25));
  users.add(User('Bill', 'bill@example.com', 30));
  users.add(User('Jhon', 'jhon@example.com', 22));

  String insertListQuery = "insert into ${tableUsers} (name, email, age) values (?, ?, ?)";
  List<Results> results = await conn.queryMulti(
      insertListQuery,
      [
        ["Bod", "bob@example.com", 35],
        ["Bill", "bill@example.com", 24],
        ["Jhon", "jhon@example.com", 51]
      ]
  );
  print("Inserted List: ${results.length}");


  // Not in use!!!!!
  List objectToArray(User user) {
    List data = List();
    data.add(user.name);
    data.add(user.email);
    data.add(user.age);
    return data;
  }


  // TODO Info ->  DELETE USER BY ID
  int idToDelete = 6;
  Results resultDelete = await delete(conn, idToDelete);
  print("Delete - Effected rows:  ${resultDelete.affectedRows}");

  // TODO Info ->  SELECT USER
  Results resultSelect = await selectById(conn, 5);
  print("Total Rows: ${resultSelect.length}");
  for (var row in resultSelect) {
    print("Selected user data:");
    print('ID: ${row[0]} \nName: ${row[1]}, \nemail: ${row[2]} \nage: ${row[3]}');
    print("");
  }

  // TODO Info ->  SELECT ALL USERS
  Results resultSelectAll = await selectAll(conn);
  print("Total Rows: ${resultSelectAll.length}");
  for (var row in resultSelectAll) {
    print('ID: ${row[0]} \nName: ${row[1]}, \nemail: ${row[2]} \nage: ${row[3]}');
    print("");
  }

  // Finally, close the connection
  await conn.close();
}



Future delete(var conn, int id) async {
  return await conn.query(deleteQuery, [id]);
}

Future insert(var conn, String name, String email, int age) async {
  return await conn.query(insertQuery, [name, email, age]);
}

Future selectById(var conn, int id) async {
  return await conn.query(selectQuery, [id]);
}

Future selectAll(var conn) async {
  return await conn.query(selectAllUsers);
}

/*
    IT'S NOT THE BEST PRACTICE. IT'S JUST A PLAY GROUND.
 */
