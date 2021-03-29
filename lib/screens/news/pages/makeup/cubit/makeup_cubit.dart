import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myvku/repository/news/news_repository.dart';
import 'package:myvku/screens/main/main.dart';
import 'package:myvku/screens/news/pages/news_state.dart';

class MakeupCubit extends Cubit<NewsState> {
  final NewsRepository _repository = getIt.get<NewsRepository>();
  MakeupCubit(NewsState initialState) : super(initialState);

  void getMakeupClasses() async {
    try {
      emit(NewsSuccess(await _repository.getMakeupClasses()));
    } catch (e) {
      emit(NewsError());
    }
  }
}
