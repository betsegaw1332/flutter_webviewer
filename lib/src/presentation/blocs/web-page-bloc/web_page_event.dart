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
  List<Object?> get props => [webPage];
}

class LoadAPage extends WebPageEvent {
  final WebPageModel webpage;

  LoadAPage({required this.webpage});

  @override
  List<Object?> get props => [webpage];
}

class RemoveWebPage extends WebPageEvent {
  final WebPageModel webpage;

  RemoveWebPage({required this.webpage});

  @override
  List<Object?> get props => [webpage];
}
