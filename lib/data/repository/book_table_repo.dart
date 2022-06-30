import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_restaurant/data/datasource/remote/dio/dio_client.dart';
import 'package:flutter_restaurant/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_restaurant/data/model/response/base/api_response.dart';
import 'package:flutter_restaurant/data/model/response/booktable_model.dart';
import 'package:flutter_restaurant/utill/app_constants.dart';

class BookTableRepo {
  final DioClient dioClient;

  BookTableRepo({@required this.dioClient});

  Future<ApiResponse> booktable(BookTableModel bookTableModel) async {
    try {
      //print(signUpModel.toJson());
      Response response = await dioClient.post(
        AppConstants.BOOK_TABLE,
        data: bookTableModel.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
