import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';


import '../Common/show_message.dart';

import 'server_error.dart';
part 'api_client_g.dart';

abstract class ApiClient {
  factory ApiClient(Dio dio) {
    dio.options = BaseOptions(
        receiveTimeout: 300000,
        connectTimeout: 300000,
        headers: ({"Content-Type": "application/json", "Accept": "*/*"}));
    return _ApiClient(dio);
  }

  Future getRequest({
    required String apiUrl,
  });

  Future getRequestHeader({required String apiUrl, required String token});
  Future deleteRequestHeader({required String apiUrl, required String token});

  Future postRequest({
    required String apiUrl,
    var data,
  });

  Future postRequestHeader({required String apiUrl, var data,required String token,});
  Future postRequestBody({required String apiUrl,required String token,});

  Future patchRequestHeader(
      {required String apiUrl, var data, required String token});

  Future putRequest({required String apiUrl, var data});

  Future putRequestHeader({required String apiUrl, var data,required String token,});

  Future profileUpdateMultiPart({required String apiUrl,required FormData formData,required String token});

  Future imagePickerScanData({required String apiUrl,required FormData formData});

}
