import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServerError implements Exception {
  int _errorCode = 0;
  String _errorMessage = "";
  DioError _error = DioError(requestOptions: RequestOptions(path: ""));
  ServerError.withError({required DioError error}) {
    _error = error;
    _handleError(error);
  }

  getResponseCode() {
    return _error.response!.statusCode;
  }

  getErrorCode() {
    debugPrint("hhhh");
    debugPrint(_errorCode.toString());
    return _errorCode;

  }

  getErrorMessage() {
    return _errorMessage;
  }

  _handleError(error) {


    if(error.type==DioErrorType.other){
      _errorCode = 0;

    }else{
      _errorCode = error.response.statusCode!=null?error.response.statusCode:0;
    }

    switch (error.type) {
      case DioErrorType.cancel:
        _errorMessage = "Request was cancelled";
        break;
      case DioErrorType.connectTimeout:
        _errorMessage = "Connection timeout".tr;
        break;


      case DioErrorType.response:
        _errorMessage = "Something went wrong".tr;
        break;case DioErrorType.other:
      _errorMessage = "Connection failed due to internet connection".tr;

      break;
      case DioErrorType.receiveTimeout:
        _errorMessage = "Receive timeout in connection".tr;
        break;
      case DioErrorType.sendTimeout:
        _errorMessage = "Receive timeout in send request".tr;
        break;
    }
    return _errorMessage;
  }
}
