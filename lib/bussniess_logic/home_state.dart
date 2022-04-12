part of 'home_cubit.dart';

@immutable
abstract class HomeState {}
class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final HomeResponse? homeModel;
  HomeLoaded(this.homeModel);
}

class HomeLoading extends HomeState {
  final bool? isLoading;
  HomeLoading(this.isLoading);
}
