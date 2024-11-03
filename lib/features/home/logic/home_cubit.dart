import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies/core/models/data_model.dart';
import 'package:movies/core/models/people_model.dart';
import 'package:movies/core/network/api_services.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  DataModelList trinding = DataModelList(list: []);
  DataModelList topRated = DataModelList(list: []);
  DataModelList discover = DataModelList(list: []);
  DataModelList series = DataModelList(list: []);

  Future<void> getMovies() async {
    await ApiServices()
        .post('https://api.themoviedb.org/3/trending/all/day?language=en-US')
        .then((value) {
      trinding = DataModelList.fromJson(value['results']);
    });
  }

  Future<void> getTopRated() async {
    await ApiServices()
        .post(
            'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1')
        .then((value) {
      topRated = DataModelList.fromJson(value['results']);
    });
  }

  Future<void> getDiscover() async {
    await ApiServices()
        .post(
            'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc')
        .then((value) {
      discover = DataModelList.fromJson(value['results']);
    });
  }

  Future<void> getSeries() async {
    await ApiServices()
        .post(
            'https://api.themoviedb.org/3/tv/airing_today?language=en-US&page=1')
        .then((value) {
      series = DataModelList.fromJson(value['results']);
    });
  }

  PeopleModelList peopleModelList = PeopleModelList(list: []);
  Future<void> getPeople() async {
    await ApiServices()
        .post(
            'https://api.themoviedb.org/3/person/popular?language=en-US&page=1')
        .then((value) {
      peopleModelList = PeopleModelList.fromJson(value['results']);
      print(peopleModelList.list);
    });
  }

  Future<void> getHomeData() async {
    emit(GetHomeDataLoading());
    await getMovies();
    await getTopRated();
    await getDiscover();
    await getPeople();
    await getSeries();
    emit(GetHomeDataSuccess());
  }
}
