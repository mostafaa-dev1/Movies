import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/helpers/extentions.dart';
import 'package:movies/core/helpers/spacing.dart';
import 'package:movies/core/models/data_model.dart';
import 'package:movies/core/theme/colors.dart';
import 'package:movies/core/widgets/custom_button.dart';
import 'package:movies/core/widgets/custom_image.dart';
import 'package:movies/core/widgets/movie_item.dart';

class MovieInfo extends StatelessWidget {
  const MovieInfo({super.key, required this.data, required this.dataModelList});
  final DataModel data;
  final DataModelList dataModelList;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: kIsWeb ? MediaQuery.sizeOf(context).height - 50 : 500,
          pinned: true,
          leading: IconButton(
              style: IconButton.styleFrom(backgroundColor: AppColors.redColor),
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.arrow_back,
              )),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              width: double.infinity,
              decoration: const BoxDecoration(),
              child: CustomImage(
                  url: data.image,
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: Container(
                height: 30,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ))),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 10.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Movie',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.redColor),
                ),
                verticalSpace(10),
                Text(data.title, style: Theme.of(context).textTheme.bodyLarge!),
                verticalSpace(10),
                Row(children: [
                  const Icon(
                    Icons.star,
                    color: AppColors.redColor,
                    size: 25,
                  ),
                  horizontalSpace(5),
                  Text(data.voteAverage.toString(),
                      style: Theme.of(context).textTheme.bodyMedium!),
                  const Spacer(),
                  const Icon(
                    Icons.calendar_month,
                    color: AppColors.redColor,
                    size: 25,
                  ),
                  horizontalSpace(5),
                  Text(data.date,
                      style: Theme.of(context).textTheme.bodyMedium!),
                ]),
                verticalSpace(20),
                kIsWeb
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width / 2.5,
                            child: Text(
                              data.overview,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                          verticalSpace(40),
                          Container(
                            height: 200,
                            width: 1,
                            color: AppColors.secodaryColor,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CustomButton(
                                  backgroundColo: AppColors.redColor,
                                  text: 'Play Now',
                                  icon: Icons.play_arrow),
                              verticalSpace(20),
                              const CustomButton(
                                  text: 'Download',
                                  backgroundColo: AppColors.secodaryColor,
                                  icon: Icons.download),
                            ],
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Text(
                            data.overview,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          verticalSpace(40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CustomButton(
                                  backgroundColo: AppColors.redColor,
                                  text: 'Play Now',
                                  icon: Icons.play_arrow),
                              horizontalSpace(20),
                              const CustomButton(
                                  text: 'Download',
                                  backgroundColo: AppColors.secodaryColor,
                                  icon: Icons.ondemand_video),
                            ],
                          ),
                        ],
                      ),
                verticalSpace(100),
                if (dataModelList.list.isNotEmpty)
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Suggested Movies',
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                color: AppColors.redColor,
                              ),
                    ),
                  ),
                verticalSpace(50),
                if (dataModelList.list.isNotEmpty && !kIsWeb)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return MovieItem(data: dataModelList.list[index]);
                    },
                  )
                else if (dataModelList.list.isNotEmpty && kIsWeb)
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 2.5),
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return MovieItem(data: dataModelList.list[index]);
                    },
                  )
              ],
            ),
          ),
        )
      ]),
    ));
  }
}
