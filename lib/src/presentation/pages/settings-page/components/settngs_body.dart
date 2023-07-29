import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_webviewer/src/domain/models/web_page_model.dart';
import 'package:flutter_webviewer/src/presentation/blocs/export.dart';
import 'package:flutter_webviewer/src/presentation/pages/settings-page/components/bookmarked_url_widget.dart';
import 'package:flutter_webviewer/src/utils/export.dart';
import 'package:go_router/go_router.dart';

class SettingsBody extends StatefulWidget {
  const SettingsBody({super.key});

  @override
  State<SettingsBody> createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final webPagBloc = BlocProvider.of<WebPageBloc>(context);

    return BlocBuilder<WebPageBloc, WebPageState>(builder: ((context, state) {
      return Column(
        children: [
          SizedBox(
            height: 5.h,
          ),
          SizedBox(
            height: 5.h,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _textEditingController,
            style: const TextStyle(color: Colors.black),
            validator: HelperFunctions.validateTextField,
            decoration: InputDecoration(
                hintText: AppStrings.insertLink,
                suffixIcon: state is WebPageInProgress
                    ? SizedBox(
                        height: 10.h,
                        width: 10.w,
                        child: const Center(child: CircularProgressIndicator()))
                    : IconButton(
                        onPressed: () {
                          final validator = HelperFunctions.validateTextField(
                              _textEditingController.text);

                          if (validator == null) {
                            webPagBloc.add(SaveWebPage(
                                webPage: WebPageModel(
                                    sourceUrl: _textEditingController.text)));
                            context.goNamed(AppRoutes.homeRoute);
                          }
                        },
                        icon: const Icon(Icons.arrow_forward)),
                prefixIcon: const Icon(Icons.link),
                hintStyle: const TextStyle(color: Colors.black),
                fillColor: AppColors.textFieldFillColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(
                    5.sp,
                  ),
                )),
          ),
          SizedBox(
            height: 20.h,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.browsingHistory,
                style: TextStyle(color: Colors.black, fontSize: 16.sp),
              )),
          SizedBox(
            height: 10.h,
          ),
          webPagBloc.savedWebPagesCache.isEmpty
              ? Expanded(
                child: Center(
                    child: Text(AppStrings.noHistory,
                        style: TextStyle(color: AppColors.appPrimaryColor, fontSize: 15.sp)),
                  ),
              )
              : Expanded(
                  child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                        webPagBloc.savedWebPagesCache.length,
                        (index) => BookmarkedUrlWidget(
                            webPageModel:
                                webPagBloc.savedWebPagesCache[index])),
                  ),
                ))
        ],
      );
    }));
  }
}
