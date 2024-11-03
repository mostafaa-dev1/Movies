import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/helpers/spacing.dart';
import 'package:movies/core/widgets/app_text_form.dart';
import 'package:movies/features/search/logic/search_cubit.dart';
import 'package:movies/features/search/widgets/search_item.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextFrom(
                  controller: controller,
                  keyboardType: TextInputType.text,
                  hintText: 'Search',
                  onChanged: (p0) {
                    context.read<SearchCubit>().getSearch(p0, 1, 'en-US');
                    return null;
                  }),
              verticalSpace(20),
              const SearchItem()
            ],
          ),
        ),
      ),
    );
  }
}
