import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myvku/data/remote/news/news_repository.dart';

import '../../news_state.dart';

class AbsenceCubit extends Cubit<NewsState> {
  final NewsRepository _repository = NewsRepository();
  AbsenceCubit(NewsState initialState) : super(initialState);

  void getAbsences() async {
    try {
      emit(NewsSuccess(await _repository.getAbsences()));
    } catch (e) {
      print(e);
      emit(NewsError());
    }
  }
}
