import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webviewer/src/presentation/blocs/export.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late WebViewController _webViewController;

  @override
  void initState() {
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://google.com'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WebPageBloc, WebPageState>(builder: ((context, state) {
      if (state is WebPageInProgress || state is WebPageInit) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is WebPageFailed) {
        return Center(
          child: Text("FAILED TO FETCH STORED WEB PAGES ${state.errorMessage}"),
        );
      }
      final fetchedState = state as WebPagesLoadedFromLocal;
      print("FETCHED URL IS EMPTY ###### ${fetchedState.webPages.isEmpty}");
      if (fetchedState.webPages.isNotEmpty) {
        _webViewController
            .loadRequest(Uri.parse(fetchedState.webPages.last.sourceUrl!));
      }
      return WebViewWidget(controller: _webViewController);
    }));
  }
}
