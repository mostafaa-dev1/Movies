import 'package:flutter/material.dart';
import 'package:movies/core/helpers/extentions.dart';
import 'package:movies/core/helpers/spacing.dart';
import 'package:movies/core/models/people_model.dart';
import 'package:movies/core/routing/app_routes.dart';
import 'package:movies/core/theme/colors.dart';
import 'package:movies/core/widgets/custom_image.dart';

class People extends StatelessWidget {
  const People({
    super.key,
    required this.data,
  });
  final PeopleModelList data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.list.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () {
                context.pushNamed(AppRoutes.peopleInfo,
                    arguments: data.list[index]);

                // showBottomSheet(
                //     context: context,
                //     backgroundColor: AppColors.secodaryColor,
                //     constraints: BoxConstraints(
                //       maxWidth: MediaQuery.of(context).size.width,
                //       maxHeight: MediaQuery.of(context).size.height / 2,
                //     ),
                //     builder: (context) {
                //       return buttonSheet(context, data, index);
                //     });
              },
              child: Stack(
                children: [
                  Container(
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    foregroundDecoration: BoxDecoration(
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
                          url: data.list[index].image,
                          width: double.infinity,
                          height: 220,
                        )),
                  ),
                  Positioned(
                    left: 5,
                    bottom: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 160,
                            child: Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              data.list[index].name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            data.list[index].knownAs,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  color: Colors.grey,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget buttonSheet(
  context,
  data,
  index,
) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      children: [
        Row(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CustomImage(
                url: data!.list[index].image,
                width: 80,
                height: 80,
              )),
          horizontalSpace(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data!.list[index].name),
              Text(
                data!.list[index].knownAs,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.grey,
                    ),
              ),
            ],
          )
        ]),
        verticalSpace(10),
        Text(
          'Known for',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: AppColors.redColor,
                fontSize: 20,
              ),
        ),
        verticalSpace(10),
        SizedBox(
            height: 200,
            child: ListView.builder(
                itemCount: data!.list[index].knownFor.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index2) {
                  return GestureDetector(
                    onTap: () {
                      context.pushNamed(AppRoutes.movieInfo, arguments: {
                        'data': data!.list[index].knownFor[index2],
                        'list': data!.list[index]
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: CustomImage(
                            url: data!.list[index].knownFor[index2].image,
                            width: double.infinity,
                            height: 220,
                          ),
                        ),
                      ),
                    ),
                  );
                }))
      ],
    ),
  );
}
