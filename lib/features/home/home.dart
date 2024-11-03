import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/helpers/spacing.dart';
import 'package:movies/core/models/data_model.dart';
import 'package:movies/core/models/people_model.dart';
import 'package:movies/core/theme/colors.dart';
import 'package:movies/features/home/logic/home_cubit.dart';
import 'package:movies/features/home/widgets/home_discover.dart';
import 'package:movies/features/home/widgets/home_toprated.dart';
import 'package:movies/features/home/widgets/home_trending.dart';
import 'package:movies/features/home/widgets/people.dart';
import 'package:movies/features/home/widgets/top_series.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        DataModelList data = context.read<HomeCubit>().trinding;
        DataModelList topRated = context.read<HomeCubit>().topRated;
        DataModelList discover = context.read<HomeCubit>().discover;
        PeopleModelList people = context.read<HomeCubit>().peopleModelList;
        DataModelList series = context.read<HomeCubit>().series;

        return Scaffold(
            body: state is GetHomeDataLoading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        state is GetHomeDataLoading
                            ? const Center(child: CircularProgressIndicator())
                            : HomeTrending(
                                data: data,
                                topRated: topRated,
                              ),
                        SafeArea(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  verticalSpace(40),
                                  Text(
                                    'Discover',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                            color: AppColors.redColor,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w300),
                                  ),
                                  verticalSpace(40),
                                  HomeDiscover(
                                    discover: discover,
                                  ),
                                  verticalSpace(40),
                                  Text(
                                    'Trending Pepole',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                            color: AppColors.redColor,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w300),
                                  ),
                                  verticalSpace(40),
                                  People(
                                    data: people,
                                  ),
                                  verticalSpace(40),
                                  Text(
                                    'Top Rated',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                            color: AppColors.redColor,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w300),
                                  ),
                                  verticalSpace(40),
                                  HomeTopRated(topRated: topRated),
                                  Text(
                                    'Top Series',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                            color: AppColors.redColor,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w300),
                                  ),
                                  verticalSpace(40),
                                  TopSeries(
                                    topSeries: series,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ))
                      ],
                    ),
                  ));
      },
    );
  }
}
