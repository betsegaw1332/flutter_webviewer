// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

import 'package:flutter_webviewer/src/utils/export.dart';

@Entity(tableName: AppStrings.webPagesTableName)
class WebPageModel extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String? sourceUrl;
  const WebPageModel({
    this.id,
    this.sourceUrl,
  });

  

  

  factory WebPageModel.fromMap(Map<String, dynamic> map) {
    return WebPageModel(
      id: map['id'] != null ? map['id'] as int : null,
      sourceUrl: map['sourceUrl'] != null ? map['sourceUrl'] as String : null,
    );
  }



  factory WebPageModel.fromJson(String source) =>
      WebPageModel.fromMap(json.decode(source) as Map<String, dynamic>);


  @override
  List<Object> get props => [id!, sourceUrl!];
}
