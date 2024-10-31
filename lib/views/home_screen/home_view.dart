import 'package:flutter/material.dart';
import 'package:movie_app_with_hive/core/base/base_view.dart';
import 'package:movie_app_with_hive/core/components/global_widgets/app_bar.dart';
import 'package:movie_app_with_hive/core/constants/app_constants.dart';
import 'package:movie_app_with_hive/core/constants/navigation_constants.dart';
import 'package:movie_app_with_hive/core/constants/string_constants.dart';
import 'package:movie_app_with_hive/core/navigation/navigation_service.dart';
import 'package:movie_app_with_hive/views/home_screen/home_view_model.dart';
import 'package:movie_app_with_hive/views/home_screen/home_widget.dart';
import 'package:provider/provider.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: Provider.of<HomeViewModel>(context, listen: false),
      onModelReady: (model) async {
        model.setContext(context);
        await model.init();
      },
      pageBuilder: (context, viewModel, _) => Scaffold(
        appBar: CustomAppBar(
          title: StringConstants.whatDoYouWant,     
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.appPagePadding,
            ),
            child: ItemListWidget(viewModel: viewModel, list: viewModel.PopularList)
          ),
        ),
      ),
    );
  }
}