import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_testing/app_constants/app_constants.dart';

class DioProvider {
  static Dio? _instance;

  static const int _maxLineWidth = 90;
  static final _prettyDioLogger = PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: _maxLineWidth);

  static final BaseOptions _options = BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: _addHeader());

  static Dio get httpDio {
    if (_instance == null) {
      _instance = Dio(_options);
      _addHeader();
      _instance!.interceptors.add(_prettyDioLogger);
      return _instance!;
    } else {
      _addHeader();
      _instance!.interceptors.clear();
      _instance!.interceptors.add(_prettyDioLogger);
      return _instance!;
    }
  }

  ///returns a Dio client with Access token in header
  ///Also adds a token refresh interceptor which retry the request when it's unauthorized
  static Dio get dioWithHeaderToken {
    _addInterceptors();
    _addHeader();
    return _instance!;
  }

  static _addHeader() {
    String? authToken;
    // var prefData =
    //     Get.find<CacheManager>().getString(CacheManagerKey.loginResponseData) ??
    //         "";
    // if (prefData.isNotEmpty) {
    //   Map<String, dynamic> loginUserData = jsonDecode(prefData);
    //   var user = LoginResponse.fromJson(loginUserData);
    //   authToken = user.token;
    // }

    print("Auth Token is *** $authToken");
    _instance?.options.headers = {
      "Content-Type": Headers.jsonContentType,
    };
  }

  static _addInterceptors() {
    _instance ??= httpDio;
    _instance!.interceptors.clear();
    _instance!.interceptors.add(_prettyDioLogger);
  }
}
