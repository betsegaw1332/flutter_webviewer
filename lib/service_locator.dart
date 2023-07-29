
import 'package:flutter_webviewer/src/data/datasources/local/export.dart';
import 'package:flutter_webviewer/src/data/export.dart';
import 'package:flutter_webviewer/src/presentation/blocs/export.dart';
import 'package:flutter_webviewer/src/utils/export.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

Future<void> serviceLocatorInit() async {
  final db =
      await $FloorAppDatabase.databaseBuilder(AppStrings.databaseName).build();
  serviceLocator.registerSingleton<AppDatabase>(db);
  serviceLocator.registerFactory<DatabaseRepositoryImpl>(() => DatabaseRepositoryImpl());
  serviceLocator.registerSingleton<WebPageBloc>(WebPageBloc());
}
