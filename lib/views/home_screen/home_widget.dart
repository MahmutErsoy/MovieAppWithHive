import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_with_hive/core/models/popular_movie_response_model.dart';
import 'package:movie_app_with_hive/views/home_screen/home_view_model.dart';

class ItemListWidget extends StatelessWidget {
  const ItemListWidget({
    super.key,
    required this.viewModel,
    required this.list,
  });
  final HomeViewModel viewModel;
  final List<Results>? list;

  @override
  Widget build(
    BuildContext context,
  ) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 20.h),
      itemCount: list?.length ?? 0,
      itemBuilder: (context, index) {
        return InkWell(
          key: const Key("goDetailPageButton"),
          onTap: () {
            //viewModel.goToDetail(list![index]);
          },
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w500${list![index].posterPath}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                  flex: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        list![index].title!,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            list![index].releaseDate!,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                list![index].originalTitle!,
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              Text(
                                list![index].originalLanguage!,
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  )),
              const Expanded(flex: 2, child: Icon(Icons.chevron_right)),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 20.h,
        );
      },
    );
  }
}