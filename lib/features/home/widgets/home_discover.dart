import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/helpers/extentions.dart';
import 'package:movies/core/helpers/spacing.dart';
import 'package:movies/core/models/data_model.dart';
import 'package:movies/core/routing/app_routes.dart';
import 'package:movies/core/widgets/custom_image.dart';

class HomeDiscover extends StatelessWidget {
  const HomeDiscover({super.key, required this.discover});
  final DataModelList discover;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 300,
        child: Swiper(
            scrollDirection: Axis.horizontal,
            itemCount: discover.list.length,
            layout: SwiperLayout.STACK,
            autoplay: true,
            itemWidth: 250.0,
            itemHeight: 280.0,
            viewportFraction: 0.8,
            scale: 0.9,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.pushNamed(AppRoutes.movieInfo, arguments: {
                    'data': discover.list[index],
                    'list': discover
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: CustomImage(
                            url: discover.list[index].image,
                            width: double.infinity,
                            height: 260,
                          )),
                    ),
                    verticalSpace(5),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
