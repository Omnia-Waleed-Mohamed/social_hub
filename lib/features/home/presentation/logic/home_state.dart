import 'package:social_hub/features/home/domain/entities/post_entity.dart';

sealed class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeSuccess extends HomeState {
  const HomeSuccess(this.posts);

  final List<PostEntity> posts;
}

class HomeFailure extends HomeState {
  const HomeFailure();
}