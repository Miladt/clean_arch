import 'package:clean_arch_2024/core/constants/constants.dart';
import 'package:dio/dio.dart';

class DioProvider {
  Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {'Content-Type': 'Application/json'},
        //   connectTimeout: const Duration(seconds: 11),
      ),
    );
    //dio.transformer = BackgroundTransformer()..jsonDecodeCallback = parseJson;
    return dio;
  }
}
