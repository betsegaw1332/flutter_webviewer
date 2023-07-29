import 'package:equatable/equatable.dart';
import 'package:flutter_webviewer/src/domain/export.dart';

abstract class WebPageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchStoredWebPages extends WebPageEvent {}

class SaveWebPage extends WebPageEvent {
  final WebPageModel webPage;

  SaveWebPage({required this.webPage});

  @override
  // TODO: implement props
  List<Object?> get props => [webPage];
}
