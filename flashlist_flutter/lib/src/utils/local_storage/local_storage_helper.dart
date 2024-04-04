import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

import 'package:flashlist_flutter/src/utils/local_storage/local_storage_state.dart';

part 'local_storage_helper.g.dart';

/// State Notifier class for the local storage
/// Holds [recentColors] = List of 8 colors that the user has recently used
/// Soon: Holds [listCollapseStates] = Map of list id and its collapse state
@riverpod
class LocalStorageHelper extends _$LocalStorageHelper {
  Database? localDatabase;

  @override
  LocalStorageState build() {
    _initializeLocalDatabase();
    return LocalStorageState(
      recentColors: [],
      // listCollapseStates: {},
    );
  }

  Future<void> _initializeLocalDatabase() async {
    localDatabase = await openDatabase(
      'flashlist.db',
      version: 1,
      onCreate: _createLocalDatabase,
    );
    _fetchRecentColors();
  }

  Future<void> _createLocalDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE recentColors(
        id INTEGER PRIMARY KEY,
        value TEXT UNIQUE
      )  
      ''');

    // Uncomment this code to create table tracking collapsed state of flashlist
    // await db.execute('''
    //   CREATE TABLE listState(
    //     id INTEGER PRIMARY KEY,
    //     isCollapsed INTEGER
    //   )
    // ''');
  }

  Future<void> addColor(String colorValue) async {
    if (localDatabase == null) {
      await _initializeLocalDatabase();
    }

    // Check if the color value already exists in the database
    List<Map<String, dynamic>> existingColors = await localDatabase!.query(
      'recentColors',
      where: 'value = ?',
      whereArgs: [colorValue],
    );

    if (existingColors.isEmpty) {
      // Check if the table has more than 8 rows
      int count = Sqflite.firstIntValue(
        await localDatabase!.rawQuery(
          'SELECT COUNT(*) FROM recentColors',
        ),
      )!;
      if (count >= 8) {
        // Remove the oldest color if the list exceeds 8 recentColors
        await localDatabase!.delete(
          'recentColors',
          where: 'id = (SELECT MIN(id) FROM recentColors)',
        );
      }
      // Insert the new color using the correct column name "value"
      await localDatabase!.insert('recentColors', {'value': colorValue});
      _fetchRecentColors();
    }
  }

  Future<void> _fetchRecentColors() async {
    if (localDatabase == null) {
      await _initializeLocalDatabase();
    }

    List<Map<String, dynamic>> colors =
        await localDatabase!.query('recentColors');
    state = state.copyWith(
      recentColors: colors.map((e) => e['value'] as String? ?? '').toList(),
    );
  }
}
