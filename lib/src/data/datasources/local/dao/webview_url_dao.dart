import 'package:floor/floor.dart';
import 'package:flutter_webviewer/src/domain/models/export.dart';
import 'package:flutter_webviewer/src/utils/export.dart';

@dao
abstract class WebPagesDao{

  @Query('SELECT * FROM ${AppStrings.webPagesTableName}')
  Future<List<WebPageModel>> getAllWebPages();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertWebPage(WebPageModel webPage);

  @delete
  Future<void> deleteWebPage(WebPageModel webPage);
}