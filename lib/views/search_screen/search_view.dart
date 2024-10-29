import 'package:flutter/material.dart';
import 'package:movie_app_with_hive/core/base/base_view.dart';
import 'package:movie_app_with_hive/core/components/global_widgets/app_bar.dart';
import 'package:movie_app_with_hive/core/constants/app_constants.dart';
import 'package:movie_app_with_hive/core/constants/navigation_constants.dart';
import 'package:movie_app_with_hive/core/constants/string_constants.dart';
import 'package:movie_app_with_hive/core/navigation/navigation_service.dart';
import 'package:movie_app_with_hive/views/search_screen/search_view_model.dart';
import 'package:provider/provider.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SearchViewModel>(
      viewModel: Provider.of<SearchViewModel>(context, listen: false),
      onModelReady: (model) async {
        model.setContext(context);
        await model.init();
      },
      pageBuilder: (context, viewModel, _) => Scaffold(
        appBar: CustomAppBar(
          title: StringConstants.search,     
        ),
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.appPagePadding,
              ),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    NavigationService.instance.navigateToPage(path: NavigationConstants.detailPage, data: NavigationConstants.searchPage);
                  }, 
                  child: const Text('Go to Detail View'),)
              )),
        ),
      ),
    );
  }
}