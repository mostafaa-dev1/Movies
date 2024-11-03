import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/theme/colors.dart';
import 'package:movies/core/widgets/movie_item.dart';
import 'package:movies/features/search/logic/search_cubit.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var data = context.read<SearchCubit>().search;

        return data.list.isEmpty
            ? Container()
            : state is GetSearchLoading
                ? const Center(
                    child: CircularProgressIndicator(
                    color: AppColors.redColor,
                  ))
                : !kIsWeb
                    ? Expanded(
                        child: ListView.builder(
                        itemCount: data.list.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: MovieItem(data: data.list[index]),
                          );
                        },
                      ))
                    : Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 2.5),
                          itemCount: data.list.length,
                          itemBuilder: (context, index) {
                            return MovieItem(data: data.list[index]);
                          },
                        ),
                      );
      },
    );
  }
}
