//======= It's used with g_json 
//// ===== it's optional
/// ==== when you don't use g_json it's not use 
// import 'dart:async';

// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:g_json/g_json.dart';

// class JSONTransformer extends SyncTransformer {
//   JSONTransformer() : super(jsonDecodeCallback: _decodeJson);
// }

// FutureOr<dynamic> _decodeJson(String text) {
//   // Taken from https://github.com/flutter/flutter/blob/135454af32477f815a7525073027a3ff9eff1bfd/packages/flutter/lib/src/services/asset_bundle.dart#L87-L93
//   // 50 KB of data should take 2-3 ms to parse on a Moto G4, and about 400 μs
//   // on a Pixel 4.
//   if (text.codeUnits.length < 50 * 1024) {
//     return JSON.parse(text);
//   }
//   // For strings larger than 50 KB, run the computation in an isolate to
//   // avoid causing main thread jank.
//   return compute(JSON.parse, text);
// }



// import 'dart:async';

// /// If the request data is a `List` type, the [BackgroundTransformer] will send data
// /// by calling its `toString()` method. However, normally the List object is
// /// not expected for request data( mostly need Map ). So we provide a custom
// /// [Transformer] that will throw error when request data is a `List` type.

// class MyTransformer extends BackgroundTransformer {
//   @override
//   Future<String> transformRequest(RequestOptions options) async {
//     if (options.data is List<String>) {
//       throw DioException(
//         error: "Can't send List to sever directly",
//         requestOptions: options,
//       );
//     } else {
//       return super.transformRequest(options);
//     }
//   }

//   /// The [Options] doesn't contain the cookie info. we add the cookie
//   /// info to [Options.extra], and you can retrieve it in [ResponseInterceptor]
//   /// and [Response] with `response.request.extra["cookies"]`.
//   @override
//   Future transformResponse(
//     RequestOptions options,
//     ResponseBody responseBody,
//   ) async {
//     options.extra['self'] = 'XX';
//     return super.transformResponse(options, responseBody);
//   }
// }
//   dio.transformer = MyTransformer();