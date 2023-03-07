import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_project/data/models/api/response/TokenResponse.dart';
import '../data/models/api/request/set_user.dart';
import '../data/models/api/response/Products/Products.dart';

part 'server_api.g.dart';

@RestApi(baseUrl: "https://fakestoreapi.com")
abstract class RestClient {
  factory RestClient({required String baseUrl}) {
    Dio dio = Dio();

    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));

    ///TODO: Add interceptors
    // dio.interceptors.add(OauthInterceptor());

    dio.options = BaseOptions(receiveTimeout: const Duration(seconds: 3), connectTimeout: const Duration(seconds: 3));
    return _RestClient(dio, baseUrl: baseUrl);
  }

  @POST("/auth/login")
  Future<TokenResponse> authUser(@Body() SetUserRequest authRequest);


  @GET("/products")
  Future<List<Products>> getProducts();

}