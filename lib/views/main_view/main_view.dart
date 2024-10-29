import 'package:flutter/material.dart';
import 'package:movie_app_with_hive/core/base/base_view.dart';
import 'package:movie_app_with_hive/core/components/global_widgets/bottom_bar.dart';
import 'package:movie_app_with_hive/views/main_view/main_view_model.dart';
import 'package:provider/provider.dart';


class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<MainViewModel>(
      viewModel: Provider.of<MainViewModel>(context, listen: false),
      onModelReady: (model) async {
        model.setContext(context);
        await model.init();
      },
      pageBuilder: (context, viewModel, _) => Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: viewModel.widgetOptions.elementAt(viewModel.currentIndex),
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: viewModel.currentIndex,
          onTap: (index) {
            viewModel.navigateTo(index);
          },
        ),
      ),
    );
  }
}