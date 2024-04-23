import 'package:drinkalot/database_values.dart';
import 'package:drinkalot/mockup.dart';
import 'package:sqflite/sqflite.dart';

const dbVersion = 1;
const dbPath = 'drinkalot.db';

Future<Database> getDatabase(String path) async {
  final db = await openDatabase(path, version: dbVersion,
      onCreate: (Database db, int version) async {
    for (final updateVersion in databaseUpdates) {
      for (final update in updateVersion) {
        await db.execute(update);
      }
    }
    for (final deck in decks) {
      await db.insert('deck', deck.toJson());
    }
    for (final card in cards) {
      await db.insert('card', card.toJson());
    }
  });
  return db;
}

Future<List<int>> insertOrUpdate(
    String table, List<Map<String, dynamic>> maps) async {
  final db = await getDatabase(dbPath);
  final List<int> ids = [];
  for (final map in maps) {
    final id = await db.insert(table, map,
        conflictAlgorithm: ConflictAlgorithm.replace);
    ids.add(id);
  }
  await db.close();
  return ids;
}

Future<List<Map<String, dynamic>>> getData(String table,
    {String? where, List<dynamic>? whereArgs}) async {
  final db = await getDatabase(dbPath);
  List<Map<String, dynamic>> maps =
      await db.query(table, where: where, whereArgs: whereArgs);
  await db.close();
  return maps;
}

Future<int> update(String table, Map<String, dynamic> map,
    {String? where, List<dynamic>? whereArgs}) async {
  final db = await getDatabase(dbPath);
  final updated =
      await db.update(table, map, where: where, whereArgs: whereArgs);
  await db.close();
  return updated;
}

Future<int> delete(String table,
    {String? where, List<dynamic>? whereArgs}) async {
  final db = await getDatabase(dbPath);
  final deleted = await db.delete(table, where: where, whereArgs: whereArgs);
  await db.close();
  return deleted;
}

Future<List<Map<String, Object?>>> rawQuery(String table, String query) async {
  final db = await getDatabase(dbPath);
  final result = await db.rawQuery(query);
  await db.close();
  return result;
}
