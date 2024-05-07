import 'package:calendar/models/day_response_model.dart';
import 'package:dio/dio.dart';
import '../models/enum_response_model.dart';

class ApiService {
  final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://www.jsonkeeper.com/b/',
  ));

  Future<Response> get(String path) async {
    try {
      return await dio.get(path);
    } catch (e) {
      rethrow;
    }
  }

  Future<DayResponse> getDays() async {
    try {
      final response = await get(Routes.daysRoute);
      return DayResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<EnumResponse> getEnums() async {
    try {
      final response = await get(Routes.enumsRoute);
      return EnumResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}

class Routes {
  static const String daysRoute = 'IXGR';
  static const String enumsRoute = 'I86U';
}
