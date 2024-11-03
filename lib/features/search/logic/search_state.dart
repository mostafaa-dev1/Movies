part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class GetSearchSuccess extends SearchState {}

final class GetSearchLoading extends SearchState {}
