import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_webviewer/src/data/datasources/local/export.dart';
import 'package:flutter_webviewer/src/domain/models/export.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'app_database.g.dart';

@Database(version: 1, entities: [WebPageModel])
abstract class AppDatabase extends FloorDatabase {
  WebPagesDao get webPagesDao;
}
