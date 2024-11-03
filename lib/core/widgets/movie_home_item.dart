import 'package:flutter/material.dart';
import 'package:movies/core/helpers/extentions.dart';
import 'package:movies/core/helpers/spacing.dart';
import 'package:movies/core/models/data_model.dart';
import 'package:movies/core/routing/app_routes.dart';
import 'package:movies/core/widgets/custom_image.dart';

class MovieHomeItem extends StatelessWidget {
  const MovieHomeItem({
    super.key,
    required this.dataModelList,
  });

  final DataModelList dataModelList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dataModelList.list.length,
        itemBuilder: (context, index) {
          return item(context,
              data: dataModelList.list[index],
              dataModelList: dataModelList,
              index: index);
        },
      ),
    );
  }

  Padding item(BuildContext context,
      {required DataModel data,
      required DataModelList dataModelList,
      required int index}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0,
      ), //const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          context.pushNamed(AppRoutes.movieInfo, arguments: {
            'data': data,
            'list': dataModelList,
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 250,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      foregroundDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.8)
                            ],
                          )),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: CustomImage(
                            url: dataModelList.list[index].image,
                            width: double.infinity,
                            height: 200,
                          )),
                    ),
                    Positioned(
                      bottom: 5,
                      left: 5,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 65,
                            height: 80,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: CustomImage(
                                  url: dataModelList.list[index].image,
                                  width: double.infinity,
                                  height: 100,
                                )),
                          ),
                          horizontalSpace(5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 150,
                                child: Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  dataModelList.list[index].title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                  horizontalSpace(1),
                                  Text(
                                    '(${dataModelList.list[index].voteAverage})',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300),
                                  ),
                                  horizontalSpace(5),
                                  Text(
                                    '${dataModelList.list[index].voteCount}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
