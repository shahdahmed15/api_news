import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio ; // object from dio
  static init(){ // starting state dio
    dio = Dio(
        BaseOptions(
          baseUrl: 'https://newsapi.org/',
          receiveDataWhenStatusError: true , // to tell if error happens
        )
    );
  }
  static Future<Response> getData({
    required String url ,
    required Map<String,dynamic> query ,
  })async{
    return await dio!.get(
      url ,
      queryParameters: query ,
    );
  }
}