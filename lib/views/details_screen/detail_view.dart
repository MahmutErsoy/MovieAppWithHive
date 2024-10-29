import 'package:flutter/material.dart';
import 'package:movie_app_with_hive/core/base/base_view.dart';
import 'package:movie_app_with_hive/core/components/global_widgets/app_bar.dart';
import 'package:movie_app_with_hive/core/constants/app_constants.dart';
import 'package:movie_app_with_hive/core/constants/string_constants.dart';
import 'package:movie_app_with_hive/views/details_screen/detail_view_model.dart';
import 'package:provider/provider.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key, required this.previousPage}) : super(key: key);

    final String previousPage;


  @override
  Widget build(BuildContext context) {
    return BaseView<DetailViewModel>(
      viewModel: Provider.of<DetailViewModel>(context, listen: false),
      onModelReady: (model) async {
        model.setContext(context);
        await model.init();
      },
      pageBuilder: (context, viewModel, _) => Scaffold(
        appBar: CustomAppBar(
          title: StringConstants.ok, 
          showBackButton: true, 
          showBookmark: true, 
          isBookmarked: viewModel.isBookmarked,
          onBackButtonPressed: () {
          Navigator.of(context).pop(previousPage);
          },
          onBookmarkPressed: () {
            viewModel.toggleBookmark();
          },
        ),
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.appPagePadding,
              ),
              child: Center(
                child: Text("Detail", style: Theme.of(context).textTheme.displayLarge),
              )),
        ),
      ),
    );
  }
}