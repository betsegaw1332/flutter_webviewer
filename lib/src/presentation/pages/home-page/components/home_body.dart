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
  late ValueNotifier<int> _progressValueNotifier;

  _updateProgressValue(int value) {
    _progressValueNotifier.value = value;
  }

  @override
  void initState() {
    _progressValueNotifier = ValueNotifier<int>(0);

    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://google.com'))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            _updateProgressValue(progress);
          },
          onPageStarted: (String url) {
            _updateProgressValue(0);
          },
          onPageFinished: (String url) {
            _updateProgressValue(100);
          },
          onWebResourceError: (WebResourceError error) {},
        ),
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final webPageBloc = BlocProvider.of<WebPageBloc>(context);
    return BlocBuilder<WebPageBloc, WebPageState>(builder: ((context, state) {
      if (state is WebPageInProgress || state is WebPageInit) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is WebPageFailed) {
        return Center(
          child: Text("FAILED TO FETCH STORED WEB PAGES ${state.errorMessage}"),
        );
      }
      // if (state is WebPagesLoadedFromLocal && state.webPages.isNotEmpty) {
      //   _webViewController
      //       .loadRequest(Uri.parse(state.webPages.last.sourceUrl!));
      // }
      _webViewController
          .loadRequest(Uri.parse(webPageBloc.currentLoadedPageUrl));

      return Stack(
        children: [
          WebViewWidget(controller: _webViewController),
          ValueListenableBuilder<int>(
              valueListenable: _progressValueNotifier,
              builder: ((context, progressValue, child) {
                if (progressValue < 100) {
                  return LinearProgressIndicator(
                    value: progressValue / 100,
                  );
                }
                return  Container();
              }))
        ],
      );
    }));
  }
}
