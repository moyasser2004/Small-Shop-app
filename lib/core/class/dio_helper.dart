import 'package:dio/dio.dart';
import '../utiles_api/links/app_links.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(BaseOptions(
      baseUrl: AppLinks.baserUrl,
      headers: AppLinks.baserHeader,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      AppLinks.lang: lang,
      AppLinks.token: token
    };
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'ar',
    String? token,
  }) async {
    dio!.options.headers = {
      AppLinks.lang: lang,
      AppLinks.token: token
    };
    return await dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
