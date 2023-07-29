import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webviewer/service_locator.dart';
import 'package:flutter_webviewer/src/data/export.dart';
import 'package:flutter_webviewer/src/domain/export.dart';
import 'package:flutter_webviewer/src/presentation/blocs/web-page-bloc/export.dart';
import 'package:flutter_webviewer/src/utils/export.dart';

class WebPageBloc extends Bloc<WebPageEvent, WebPageState> {
  final DatabaseRepository _databaseRepository;

  WebPageBloc()
      : _databaseRepository = serviceLocator<DatabaseRepositoryImpl>(),
        super(WebPageInit()) {
    on<FetchStoredWebPages>(_fetchStoredWebPages);
    on<SaveWebPage>(_saveWebPage);
    on<LoadAPage>(_loadAPage);
    on<RemoveWebPage>(_removeWebPage);
  }
  List<WebPageModel> savedWebPagesCache = [];
  String currentLoadedPageUrl = AppStrings.placeholderUrl;

  Future<void> _fetchStoredWebPages(FetchStoredWebPages fetchStoredWebPages,
      Emitter<WebPageState> emit) async {
    emit(WebPageInProgress());

    try {
      final storedWebPages = await _databaseRepository.getSavedWebPages();
      savedWebPagesCache = storedWebPages;
      if (storedWebPages.isNotEmpty) {
        currentLoadedPageUrl = storedWebPages.last.sourceUrl!;
      } else {
        currentLoadedPageUrl = AppStrings.placeholderUrl;
      }
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

      emit(WebPageInProgress());
      add(FetchStoredWebPages());
    } catch (e) {
      emit(WebPageFailed(errorMessage: e.toString()));
    }
  }

  Future<void> _loadAPage(
      LoadAPage loadAPage, Emitter<WebPageState> emit) async {
    emit(WebPageInProgress());
    currentLoadedPageUrl = loadAPage.webpage.sourceUrl!;
    emit(WebPageLoaded());
  }

  Future<void> _removeWebPage(
      RemoveWebPage removeWebPage, Emitter<WebPageState> emit) async {
    emit(WebPageInProgress());
    await _databaseRepository.removeWebPage(removeWebPage.webpage);

    add(FetchStoredWebPages());
  }
}
