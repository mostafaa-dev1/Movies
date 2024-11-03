import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies/core/models/data_model.dart';
import 'package:movies/core/network/api_services.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  DataModelList search = DataModelList(
    list: [],
  );
  Future<void> getSearch(String query, int page, String language) async {
    emit(GetSearchLoading());
    await ApiServices()
        .post(
            'https://api.themoviedb.org/3/search/multi?query=$query&include_adult=false&language=$language-&page=$page')
        .then((value) {
      search = DataModelList.fromJson(value['results']);
    });
    emit(GetSearchSuccess());
  }
}
