import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'vku_service.g.dart';

@RestApi(baseUrl: "http://daotao.vku.udn.vn/")
abstract class VKUService {
  factory VKUService(Dio dio, {String baseUrl}) = _VKUService;

  @GET("/baimoinhat")
  Future<String> getNews();

  @GET("/thongbaonghi")
  Future<String> getAbsences();

  @GET("/thongbaobu")
  Future<String> getMakeupClasses();
}
