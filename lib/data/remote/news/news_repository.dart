import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:myvku/data/remote/vku_service.dart';
import 'package:myvku/models/absence.dart';
import 'package:myvku/models/makeup_class.dart';

class NewsRepository {
  // region singleton stuffs
  static final NewsRepository _repository = NewsRepository._internal();

  factory NewsRepository() => _repository;

  NewsRepository._internal();
  // endregion

  final _service = VKUService(Dio());

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
