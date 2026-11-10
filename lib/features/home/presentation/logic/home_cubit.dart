import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_hub/features/home/domain/use_cases/get_posts_use_case.dart';
import 'package:social_hub/features/home/presentation/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.getPostsUseCase,
  }) : super(const HomeInitial());

  final GetPostsUseCase getPostsUseCase;

  Future<void> loadPosts() async {
    emit(const HomeLoading());

    try {
      final posts = await getPostsUseCase();

      if (posts.isEmpty) {
        emit(const HomeSuccess([]));
        return;
      }

      emit(HomeSuccess(posts));
    } catch (_) {
      emit(const HomeFailure());
    }
  }

  Future<void> refreshPosts() async {
    await loadPosts();
  }
}