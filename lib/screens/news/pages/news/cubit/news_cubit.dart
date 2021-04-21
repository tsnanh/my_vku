import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myvku/repository/news/news_repository.dart';
import 'package:myvku/screens/main/main.dart';
import 'package:myvku/screens/news/pages/news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepository _repository = getIt.get<NewsRepository>();
  NewsCubit(NewsState initialState) : super(initialState);

  void getNewsClasses() async {
    try {
      emit(NewsSuccess(await _repository.getNews()));
    } on Exception catch (e) {
      print(e);
      emit(NewsError(error: e));
    }
  }
}
