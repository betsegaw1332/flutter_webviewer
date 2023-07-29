import 'package:flutter_webviewer/service_locator.dart';
import 'package:flutter_webviewer/src/data/datasources/local/export.dart';
import 'package:flutter_webviewer/src/domain/export.dart';

class DatabaseRepositoryImpl extends DatabaseRepository {
  final AppDatabase _appDatabase;

  DatabaseRepositoryImpl() : _appDatabase = serviceLocator<AppDatabase>();

  @override
  Future<List<WebPageModel>> getSavedWebPages() async {
    return _appDatabase.webPagesDao.getAllWebPages();
  }

  @override
  Future<void> removeWebPage(WebPageModel webPage) {
    return _appDatabase.webPagesDao.deleteWebPage(webPage);
  }

  @override
  Future<void> saveWebPage(WebPageModel webPage) {
    return _appDatabase.webPagesDao.insertWebPage(webPage);
  }
}
