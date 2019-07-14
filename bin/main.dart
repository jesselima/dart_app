import 'package:sqljocky5/constants.dart';
import 'package:sqljocky5/sqljocky.dart';
import 'package:sqljocky5/utils/buffer.dart';
import 'dart:io';

main(List<String> arguments) async {

  var s = ConnectionSettings(
    user: "root",
    //password: "",
    host: "127.0.0.1",
    port: 3306,
    db: "school",
  );
  var conn = await MySqlConnection.connect(s);
  
  var results = await conn.execute('SELECT * FROM school.teachers');
  print("Results: ${await results.length} rows.");

  // SELECT TEACHERS
//  await results.forEach((row) {
//    print('Name: ${row[0]}');
//  });


  // INSERT
//  var query = await conn.prepare("insert into teachers (name, topic) values (?, ?)");
//  insert(query, "Joe", "Astronomy");
//  insert(query, "Bil", "Coding");


//  await conn.prepared('insert into users (name, email, age) values (?, ?, ?)',
//      ['Bill', 'bill@microsoft.com', 50]);
//
//  var results = await conn.execute('SELECT * FROM school.users');
//  print("Results: ${await results.length} rows.");
//
//  await results.forEach((Row row) {
//    print('Name: ${row[0]}, email: ${row[0]}');
//  });


  await conn.close();
  exit(0);

}


// INSERT FUNCTION
void insert(var query, String name, String topic) async {
  var result = await query.execute([name, topic]);
  print("New user id: ${result.insertId}");
}

