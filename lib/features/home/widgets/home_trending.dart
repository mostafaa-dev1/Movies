import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/helpers/extentions.dart';
import 'package:movies/core/helpers/spacing.dart';
import 'package:movies/core/models/data_model.dart';
import 'package:movies/core/routing/app_routes.dart';
import 'package:movies/core/theme/colors.dart';
import 'package:movies/core/widgets/custom_image.dart';
import 'package:movies/core/widgets/movie_home_item.dart';

class HomeTrending extends StatefulWidget {
  const HomeTrending({
    super.key,
    required this.data,
    required this.topRated,
  });
  final DataModelList data;
  final DataModelList topRated;

  @override
  State<HomeTrending> createState() => _HomeTrendingState();
}

class _HomeTrendingState extends State<HomeTrending> {
  int index = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    increment();
  }

  void increment() {
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        if (index == widget.data.list.length - 1) {
          index = 0;
        } else {
          index++;
        }
        increment();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: kIsWeb ? MediaQuery.sizeOf(context).height : 500,
        width: double.infinity,
        child: kIsWeb
            ? webVersion(context, index, widget.data, widget.topRated)
            : phoneVersion(context, index, widget.data));
  }
}

Widget webVersion(BuildContext context, index, DataModelList data,
        DataModelList topRated) =>
    GestureDetector(
      onTap: () {
        context.pushNamed(AppRoutes.movieInfo,
            arguments: {'data': data.list[index], 'list': data});
      },
      child: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: CustomImage(
                  url: data.list[index].image,
                  height: MediaQuery.sizeOf(context).height,
                  width: double.infinity)),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.sizeOf(context).height,
            child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                      Colors.transparent,
                      AppColors.mainColor,
                    ])),
                child: Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 500,
                        child: Text(
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          data.list[index].title,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 50),
                        ),
                      ),
                      verticalSpace(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                          horizontalSpace(1),
                          Text(
                            '${data.list[index].voteAverage}',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(color: Colors.grey),
                          ),
                          horizontalSpace(5),
                          Text(
                            ' |  ${data.list[index].date}',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(color: Colors.grey),
                          ),
                          horizontalSpace(5),
                          Text(
                            '|  ${data.list[index].language}',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                      verticalSpace(20),
                      SizedBox(
                        width: 600,
                        child: Text(
                          data.list[index].overview,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                      verticalSpace(80),
                      MovieHomeItem(dataModelList: data)
                    ],
                  ),
                )),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            height: 80,
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.transparent,
                  Colors.black,
                ],
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                horizontalSpace(5),
                const Image(
                  height: 50,
                  width: 100,
                  image: AssetImage('assets/images/logo.png'),
                ),
                horizontalSpace(5),
                Container(
                  height: 30,
                  width: 1,
                  color: Colors.grey[500],
                ),
                horizontalSpace(5),
                Text(
                  'for watching',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.grey[500],
                      ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    context.pushNamed(AppRoutes.search);
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
Widget phoneVersion(BuildContext context, index, data) => Stack(
      children: [
        GestureDetector(
          onTap: () {
            context.pushNamed(AppRoutes.movieInfo,
                arguments: {'data': data.list[index], 'list': data});
          },
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: CustomImage(
                  url: '${data!.list[index].image}',
                  height: 500,
                  width: double.infinity)),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: 100,
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.transparent,
                    Theme.of(context).colorScheme.primary,
                  ])),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      data!.list[index].title,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    verticalSpace(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star,
                          color: AppColors.redColor,
                          size: 20,
                        ),
                        horizontalSpace(1),
                        Text(
                          '${data!.list[index].voteAverage}',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: Colors.grey),
                        ),
                        horizontalSpace(5),
                        Text(
                          ' |  ${data!.list[index].date}',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: Colors.grey),
                        ),
                        horizontalSpace(5),
                        Text(
                          '|  ${data!.list[index].language}',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          height: 80,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.transparent,
                Theme.of(context).colorScheme.primary,
              ],
            )),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          height: 80,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.transparent,
                Theme.of(context).colorScheme.primary,
              ],
            )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
          child: Row(
            children: [
              horizontalSpace(5),
              const Image(
                height: 50,
                width: 100,
                image: AssetImage('assets/images/logo.png'),
              ),
              horizontalSpace(5),
              Container(
                height: 30,
                width: 1,
                color: Colors.grey[500],
              ),
              horizontalSpace(5),
              Text(
                'for watching',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.grey[500],
                    ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  context.pushNamed(AppRoutes.search);
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
