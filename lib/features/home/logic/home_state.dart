part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetHomeTrendingLoading extends HomeState {}

final class GetHomeTrendingSuccess extends HomeState {}

final class GetTopRatedLoading extends HomeState {}

final class GetTopRatedSuccess extends HomeState {}

final class GetHomeDataLoading extends HomeState {}

final class GetHomeDataSuccess extends HomeState {}
