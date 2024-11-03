import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/helpers/spacing.dart';
import 'package:movies/core/models/people_model.dart';
import 'package:movies/core/widgets/custom_image.dart';
import 'package:movies/core/widgets/movie_item.dart';

class PeopleInfo extends StatelessWidget {
  const PeopleInfo({
    super.key,
    required this.data,
  });
  final PeopleModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: CustomImage(
                  url: data.image,
                  width: 45,
                  height: 45,
                )),
            horizontalSpace(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.name,
                    style: Theme.of(context).textTheme.headlineMedium),
                Text(data.knownAs,
                    style: Theme.of(context).textTheme.headlineSmall),
              ],
            )
          ]),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              !kIsWeb
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.knownFor.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return MovieItem(data: data.knownFor[index]);
                      })
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.7),
                      itemCount: data.knownFor.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return MovieItem(data: data.knownFor[index]);
                      },
                    )
            ],
          ),
        ))));
  }
}
