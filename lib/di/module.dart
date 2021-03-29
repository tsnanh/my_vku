import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myvku/data/local/database_helper.dart';
import 'package:myvku/data/remote/vku_service.dart';
import 'package:myvku/repository/news/news_repository.dart';

extension GetItExtension on GetIt {
  initDependencyInjection() {
    registerSingleton(Dio());
    registerSingleton(VKUService(get()));
    registerSingleton(NewsRepository());
    registerSingleton(DatabaseHelper());
  }
}
