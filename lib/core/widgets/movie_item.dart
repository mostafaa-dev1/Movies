import 'package:flutter/material.dart';
import 'package:movies/core/helpers/extentions.dart';
import 'package:movies/core/helpers/spacing.dart';
import 'package:movies/core/models/data_model.dart';
import 'package:movies/core/routing/app_routes.dart';
import 'package:movies/core/theme/colors.dart';
import 'package:movies/core/widgets/custom_image.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.data});
  final DataModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          clipBehavior: Clip.none,
          width: double.infinity,
          height: 150,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            horizontalSpace(120),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    data.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  verticalSpace(5),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      horizontalSpace(5),
                      Text(
                        data.voteAverage.toString(),
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      horizontalSpace(5),
                      Text(
                        '(${data.voteCount})',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                  verticalSpace(5),
                  Text(
                    '${data.language} | ${data.date}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  verticalSpace(5),
                  Row(
                    children: [
                      const Icon(
                        Icons.person,
                        size: 15,
                      ),
                      horizontalSpace(5),
                      Text(
                        data.popularity.toString(),
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  )
                ],
              ),
            ),
            TextButton(
                style: ButtonStyle(
                  minimumSize: WidgetStateProperty.all(
                    Size(MediaQuery.sizeOf(context).width > 500 ? 100 : 80,
                        MediaQuery.sizeOf(context).width > 800 ? 50 : 30),
                  ),
                  backgroundColor: WidgetStateProperty.all(AppColors.redColor),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                  ),
                ),
                onPressed: () {
                  context.pushNamed(AppRoutes.movieInfo, arguments: {
                    'data': data,
                    'list': DataModelList(list: []),
                  });
                },
                child: Text(
                  'View',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.white),
                )),
            horizontalSpace(10),
          ]),
        ),
        Positioned(
          left: 10,
          top: -35,
          height: 150,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: CustomImage(
                url: data.image,
                width: 100,
                height: 150,
              )),
        ),
      ]),
    );
  }
}
