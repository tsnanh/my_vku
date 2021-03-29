import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:myvku/data/local/database_helper.dart';
import 'package:myvku/data/remote/vku_service.dart';
import 'package:myvku/extension/string.dart';
import 'package:myvku/models/absence.dart';
import 'package:myvku/models/makeup_class.dart';
import 'package:myvku/models/news.dart';
import 'package:myvku/screens/main/main.dart';

class NewsRepository {
  // region singleton stuffs
  static final NewsRepository _repository = NewsRepository._internal();

  factory NewsRepository() => _repository;

  NewsRepository._internal();

  // endregion

  final _service = getIt.get<VKUService>();

  static const platform = const MethodChannel("dev.tsnanh.myvku/news");
  final database = DatabaseHelper();

  Future<List<News>> getNews() async {
    try {
      final String response = await _service.getNews();

      final List<dynamic> list = jsonDecode(response);
      final news = list.map((e) {
        final news = News.fromJson(e);
        news.title = news.title
            .decodeUnicode()!
            .replaceAll("\"", "")
            .replaceAll("\\", "");
        return news;
      }).toList();
      print(await database.getNews());
      // await database.insertAllNews(news);
      return news;
    } on PlatformException catch (e) {
      throw e;
    }
  }

  Future<List<Absence>> getAbsences() async {
    final String response = await _service.getAbsences();
    final List<dynamic> array = jsonDecode(response);

    return array.map((e) => Absence.fromJson(e)).toList();
  }

  Future<List<MakeupClass>> getMakeupClasses() async {
    final String response = await _service.getMakeupClasses();
    final List<dynamic> list = jsonDecode(response);

    return list.map((e) => MakeupClass.fromJson(e)).toList();
  }
}
