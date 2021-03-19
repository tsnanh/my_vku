import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myvku/data/remote/news/news_repository.dart';
import 'package:myvku/screens/news/pages/news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepository _repository = NewsRepository();
  NewsCubit(NewsState initialState) : super(initialState);

  void getNewsClasses() async {
    try {
      emit(NewsSuccess(await _repository.getNews()));
    } catch (e) {
      emit(NewsError());
    }
  }
}
