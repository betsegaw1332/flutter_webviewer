import 'package:flutter_webviewer/src/domain/export.dart';

abstract class DatabaseRepository {
  Future<List<WebPageModel>> getSavedWebPages();
  Future<void> saveWebPage(WebPageModel webPage);
  Future<void> removeWebPage(WebPageModel webPage);
}
