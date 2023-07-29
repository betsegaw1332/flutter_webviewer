import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_webviewer/src/domain/export.dart';
import 'package:flutter_webviewer/src/presentation/blocs/export.dart';
import 'package:flutter_webviewer/src/utils/export.dart';
import 'package:go_router/go_router.dart';

class BookmarkedUrlWidget extends StatelessWidget {
  const BookmarkedUrlWidget({super.key, required this.webPageModel});

  final WebPageModel webPageModel;

  @override
  Widget build(BuildContext context) {
    final webPageBloc = BlocProvider.of<WebPageBloc>(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: GestureDetector(
              onTap: () {
                webPageBloc.add(LoadAPage(webpage: webPageModel));
                context.goNamed(AppRoutes.homeRoute);
              },
              child: Text(
                webPageModel.sourceUrl!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )),
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.grey.shade300,
                    minimumSize: Size(50.w, 20.h),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.sp))),
                onPressed: () {
                  webPageBloc.add(RemoveWebPage(webpage: webPageModel));
                },
                child: Text(
                  'Remove',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400),
                ))
          ],
        ),
        Divider(
          color: AppColors.textFieldFillColor,
          height: 1.h,
        )
      ],
    );
  }
}
