import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myvku/data/remote/news/news_repository.dart';
import 'package:myvku/screens/news/pages/absence/cubit/absence_state.dart';

class AbsenceCubit extends Cubit<AbsenceState> {
  final NewsRepository _repository = NewsRepository();
  AbsenceCubit(AbsenceState initialState) : super(initialState);

  void getAbsences() async {
    try {
      emit(AbsencesSuccess(await _repository.getAbsences()));
    } catch (e) {
      print(e);
      emit(AbsencesError());
    }
  }
}
