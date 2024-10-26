import 'package:flutter/material.dart';
import 'package:movie_app_with_hive/core/base/base_view.dart';
import 'package:movie_app_with_hive/core/constants/app_constants.dart';
import 'package:movie_app_with_hive/views/watch_list_screen/watch_list_view_model.dart';
import 'package:provider/provider.dart';

class WatchListView extends StatelessWidget {
  const WatchListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<WatchListViewModel>(
      viewModel: Provider.of<WatchListViewModel>(context, listen: false),
      onModelReady: (model) async {
        model.setContext(context);
        await model.init();
      },
      pageBuilder: (context, viewModel, _) => Scaffold(
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.appPagePadding,
              ),
              child: Center(
                child: Text("WatchList", style: Theme.of(context).textTheme.displayLarge),
              )),
        ),
      ),
    );
  }
}