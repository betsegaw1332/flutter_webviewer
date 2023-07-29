import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webviewer/service_locator.dart';
import 'package:flutter_webviewer/src/data/export.dart';
import 'package:flutter_webviewer/src/domain/export.dart';
import 'package:flutter_webviewer/src/presentation/blocs/web-page-bloc/export.dart';

class WebPageBloc extends Bloc<WebPageEvent, WebPageState> {
  final DatabaseRepository _databaseRepository;

  WebPageBloc()
      : _databaseRepository = serviceLocator<DatabaseRepositoryImpl>(),
        super(WebPageInit()) {
    on<FetchStoredWebPages>(_fetchStoredWebPages);
    on<SaveWebPage>(_saveWebPage);
  }

  Future<void> _fetchStoredWebPages(FetchStoredWebPages fetchStoredWebPages,
      Emitter<WebPageState> emit) async {
    emit(WebPageInProgress());

    try {
      final storedWebPages = await _databaseRepository.getSavedWebPages();

      emit(WebPagesLoadedFromLocal(webPages: storedWebPages));
    } catch (e) {
      emit(WebPageFailed(errorMessage: e.toString()));
    }
  }

  Future<void> _saveWebPage(
      SaveWebPage saveWebPage, Emitter<WebPageState> emit) async {
    emit(WebPageInProgress());

    try {
      await _databaseRepository.saveWebPage(saveWebPage.webPage);

      emit(WebPageSaved());
    } catch (e) {
      emit(WebPageFailed(errorMessage: e.toString()));
    }
  }
}
