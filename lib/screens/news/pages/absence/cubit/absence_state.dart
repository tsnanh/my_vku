import 'package:equatable/equatable.dart';
import 'package:myvku/models/absence.dart';

abstract class AbsenceState extends Equatable {}

class AbsencesLoading extends AbsenceState {
  @override
  List<Object?> get props => [];
}

class AbsencesError extends AbsenceState {
  AbsencesError();

  @override
  List<Object?> get props => [];
}

class AbsencesSuccess extends AbsenceState {
  final List<Absence> absences;

  AbsencesSuccess(this.absences);

  @override
  List<Object?> get props => [absences];
}
