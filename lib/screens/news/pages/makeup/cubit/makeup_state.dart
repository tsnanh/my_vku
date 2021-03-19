import 'package:equatable/equatable.dart';
import 'package:myvku/models/makeup_class.dart';

abstract class MakeupState extends Equatable {}

class MakeupLoading extends MakeupState {
  MakeupLoading();

  @override
  List<Object?> get props => [];
}

class MakeupError extends MakeupState {
  MakeupError();

  @override
  List<Object?> get props => [];
}

class MakeupSuccess extends MakeupState {
  final List<MakeupClass> makeupClasses;

  MakeupSuccess(this.makeupClasses);

  @override
  List<Object?> get props => [makeupClasses];
}
