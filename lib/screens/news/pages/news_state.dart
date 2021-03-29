import 'package:equatable/equatable.dart';

abstract class NewsState extends Equatable {}

class NewsLoading extends NewsState {
  NewsLoading();

  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class NewsError extends NewsState {
  Exception? error;

  NewsError({this.error});

  @override
  List<Object?> get props => [];
}

class NewsSuccess<T> extends NewsState {
  final List<T> data;

  NewsSuccess(this.data);

  @override
  List<Object?> get props => [data];
}
