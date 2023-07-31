import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var stripeDioProvider = Provider((ref) {
  Dio dio = Dio(BaseOptions(
    baseUrl: dotenv.env['STRIPE_BASE_URL']!,
  ));
  dio.interceptors.addAll([
    LogInterceptor(),
  ]);
  return dio;
});
