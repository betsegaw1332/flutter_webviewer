import 'package:equatable/equatable.dart';
import 'package:flutter_webviewer/src/domain/export.dart';

abstract class WebPageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WebPageInit extends WebPageState {}

class WebPageInProgress extends WebPageState {}

class WebPageSaved extends WebPageState{}

class WebPageLoaded extends WebPageState{}

class WebPageFailed extends WebPageState {
  final String errorMessage;
  WebPageFailed({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class WebPagesLoadedFromLocal extends WebPageState {
  final List<WebPageModel> webPages;
  WebPagesLoadedFromLocal({required this.webPages});

  @override
  List<Object?> get props => [webPages];
}


