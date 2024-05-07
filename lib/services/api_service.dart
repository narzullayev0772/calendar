import 'package:calendar/models/day_response_model.dart';
import 'package:calendar/utils/constants.dart';
import 'package:dio/dio.dart';
import '../models/enum_response_model.dart';

class ApiService {
  final Dio dio = Dio(BaseOptions(
    baseUrl: Constants.baseUrl,
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
      final response = await get(Constants.daysRoute);
      return DayResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<EnumResponse> getEnums() async {
    try {
      final response = await get(Constants.enumsRoute);
      return EnumResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
