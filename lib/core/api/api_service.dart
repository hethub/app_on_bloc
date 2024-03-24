import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../constants/api_constants.dart';

class DioService {
  final Dio _dio;

  DioService() : _dio = Dio() {
    _dio.options.baseUrl = AC.baseUrl;
    _dio.options.headers = {
      'Content-Type': 'application/json',
    };
    _dio.options.contentType = Headers.jsonContentType;
    _dio.options.responseType = ResponseType.json;
    _dio.options.connectTimeout = const Duration(minutes: 5);
    _dio.options.receiveTimeout = const Duration(minutes: 3);

    _dio.interceptors.add(RetryInterceptor(
      dio: _dio,
      logPrint: print,
      retries: 3,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3),
      ],
    ));

    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  Dio get dio => _dio;
}


// import 'package:dio/dio.dart';
// import 'package:dio_smart_retry/dio_smart_retry.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';
// import '../constants/constants.dart';

// class ApiService {
//   final dio = Dio();
//   ApiService() {
//     // // Set default configs
//     // dio.transformer = JSONTransformer();

//     // dio.options.baseUrl = newsAPIBaseURL;
//     dio.options.headers = {};

//     dio.options.contentType = Headers.jsonContentType;
//     dio.options.responseType = ResponseType.json;
//     dio.options.connectTimeout = const Duration(minutes: 5);
//     dio.options.receiveTimeout = const Duration(minutes: 3);

//     // Add the interceptor
//     dio.interceptors.add(RetryInterceptor(
//       dio: dio,
//       logPrint: print, // specify log function (optional)
//       retries: 3, // retry count (optional)
//       retryDelays: const [
//         // set delays between retries (optional)
//         Duration(seconds: 1), // wait 1 sec before first retry
//         Duration(seconds: 2), // wait 2 sec before second retry
//         Duration(seconds: 3), // wait 3 sec before third retry
//       ],
//     ));

//     dio.interceptors.add(
//       PrettyDioLogger(
//         requestHeader: true,
//         requestBody: true,
//         responseBody: true,
//         responseHeader: false,
//         error: true,
//         compact: true,
//         maxWidth: 90,
//       ),
//     );
//     // Add Token
//     dio.interceptors.add(InterceptorsWrapper(
//       onRequest: (options, handler) async {
//         // final preferences = await AS.preferences;
//         // options.headers[DK.Authorization.value] =
//         //     "Bearer ${preferences.getString(AppSharedStorageKeys.authorizationToken) ?? ''}";
//         // handler.next(options);
//       },
//     ));
//   }
// }
