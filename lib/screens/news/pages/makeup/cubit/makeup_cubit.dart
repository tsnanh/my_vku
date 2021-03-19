import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myvku/data/remote/news/news_repository.dart';
import 'package:myvku/screens/news/pages/makeup/cubit/makeup_state.dart';

class MakeupCubit extends Cubit<MakeupState> {
  final NewsRepository _repository = NewsRepository();
  MakeupCubit(MakeupState initialState) : super(initialState);

  void getMakeupClasses() async {
    try {
      emit(MakeupSuccess(await _repository.getMakeupClasses()));
    } catch (e) {
      emit(MakeupError());
    }
  }
}
