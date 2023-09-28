part of 'api_client.dart';

class _ApiClient implements ApiClient {
  _ApiClient(
    this._dio,
  );

  final Dio _dio;

  @override
  Future getRequest({required String apiUrl}) async {
    var response = await _dio
        .get(
      apiUrl,
      options: Options(headers: {
        'accept': '*/*',
      }),
    )
        .whenComplete(() {
      debugPrint("Getting Process is Complete:");
    }).catchError((onError) {
      // if (onError is DioError) {
      //     ShowMessage().showErrorMessage("No internet connection!");
      //   }

      debugPrint("GET Error: ${onError.toString()}");
    });

    return response;
  }

  @override
  Future getRequestHeader({required String apiUrl, required String token}) async {
    var response;
    // TODO: implement getRequestHeader
    response = await _dio
        .get(
      apiUrl,
      options: Options(headers: {
        'Accept': '*/*',
        'Content-type': 'application/json',
        "Authorization": "Bearer ${token.toString()}",
      }),
    )
        .whenComplete(() {
      debugPrint("Getting Process is Complete:");
    }).catchError((error) async {

      int result =
      await ServerError.withError(error: error)
          .getErrorCode();
      debugPrint(result.toString());
      debugPrint(response);
      debugPrint("jjjjhjhjhjhjhjhuuhhj");


      if (result == 401) {
        // ShowMessage().onSessionExpirePopUp();
      } else if (result == 400) {
        ShowMessage().showErrorMessage(response.data["message"].join("").toString());
      }else{
        // ShowMessage().showErrorMessage(response.data["message"].join("").toString());
        ShowMessage().showErrorMessage(
            ServerError.withError(error: error)
                .getErrorMessage()
                .toString());
      }
    });

    return response;
  }

  @override
  Future patchRequestHeader(
      {required String apiUrl, data, required String token}) async {
    var response = await _dio.patch(
      apiUrl,
      data: data,
      options: Options(headers: {
        "Accept": 'application/json',
        'Content-type': 'application/json',
        "Authorization": "Bearer ${token.toString()}",
      }),
      onSendProgress: (int sent, int total) {
        debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
      },
    ).whenComplete(() {
      debugPrint("POST Complete:");
    }).catchError((error) async {

      int result =
      await ServerError.withError(error: error)
          .getErrorCode();
      debugPrint(result.toString());

      debugPrint("jjjjhjhjhjhjhjhuuhhj");

      if (result == 401) {
        // ShowMessage().onSessionExpirePopUp();
      } else {
        ShowMessage().showErrorMessage(
            ServerError.withError(error: error)
                .getErrorMessage()
                .toString());
      }
    });
    return response;
  }

  @override
  Future postRequest({required String apiUrl, data}) async {
    var response = await _dio.post(
      apiUrl,
      data: data,
      options: Options(headers: {
        'Accept': '*/*',
        'Content-type': 'application/json',
      }),
      onSendProgress: (int sent, int total) {
        debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
      },
    ).whenComplete(() {
      debugPrint("POST Complete:");
    }).catchError((onError) {
      debugPrint("POST Error: $onError");

      ShowMessage().showErrorMessage(
          ServerError.withError(error: onError).getErrorMessage().toString());
    });

    return response;
  }

  @override
  Future postRequestHeader(
      {required String apiUrl, data, required String token,}) async {
    var response;
     response = await _dio.post(
        apiUrl,
        data: data,
        options: Options(headers: {
          "Accept": 'application/json',
          'Content-type': 'application/json',
          "Authorization": "Bearer ${token.toString()}",
        }),
        onSendProgress: (int sent, int total) {
          debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
        },
      ).whenComplete(() {
        debugPrint("POST Complete:");
      }).catchError((error) async {

        int result =
            await ServerError.withError(error: error)
            .getErrorCode();
        debugPrint(result.toString());

        debugPrint("jjjjhjhjhjhjhjhuuhhj");

        if (result == 401) {
          // ShowMessage().onSessionExpirePopUp();
        }
        else {
          ShowMessage().showErrorMessage(
              ServerError.withError(error: error)
                  .getErrorMessage()
                  .toString());
        }
      });
      return response;



  }

  @override
  Future putRequest({required String apiUrl, data}) {
    // TODO: implement putRequest
    throw UnimplementedError();
  }

  @override
  Future putRequestHeader(
      {required String apiUrl, data, required String token}) async {
    // TODO: implement putRequestHeader
    var response;
    response = await _dio.put(
      apiUrl,
      data: data,
      options: Options(headers: {
        "Accept": 'application/json',
        'Content-type': 'application/json',
        "Authorization": "Bearer ${token.toString()}",
      }),
      onSendProgress: (int sent, int total) {
        debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
      },
    ).whenComplete(() {
      debugPrint("POST Complete:");
    }).catchError((error) async {

      int result =
      await ServerError.withError(error: error)
          .getErrorCode();
      debugPrint(result.toString());

      debugPrint("jjjjhjhjhjhjhjhuuhhj");

      if (result == 401) {
        // ShowMessage().onSessionExpirePopUp();
      }
      else {
        ShowMessage().showErrorMessage(
            ServerError.withError(error: error)
                .getErrorMessage()
                .toString());
      }
    });
    return response;


  }

  @override
  Future profileUpdateMultiPart(
      {required String apiUrl,
      required FormData formData,
      required String token}) async {
    // TODO: implement profileUpdateMultiPart

    var response = await _dio.post(
      apiUrl,
      data: formData,
      options: Options(headers: {
        "Accept": 'application/json',
        'Content-Type': 'multipart/form-data',
        "Authorization": "Bearer ${token.toString()}",
      }),
      onSendProgress: (int sent, int total) {
        debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
      },
    ).whenComplete(() {
      debugPrint("POST Complete:");
    }).catchError((error) async {

      int result =
      await ServerError.withError(error: error)
          .getErrorCode();
      debugPrint(result.toString());

      debugPrint("jjjjhjhjhjhjhjhuuhhj");

      if (result == 401) {
        // ShowMessage().onSessionExpirePopUp();
      } else {
        ShowMessage().showErrorMessage(
            ServerError.withError(error: error)
                .getErrorMessage()
                .toString());
      }
    });
    return response;
  }

  @override
  Future deleteRequestHeader({required String apiUrl, required String token}) async {
    var response = await _dio
        .delete(
      apiUrl,
      options: Options(headers: {
        'Accept': '*/*',
        'Content-type': 'application/json',
        "Authorization": "Bearer ${token.toString()}",
      }),
    )
        .whenComplete(() {
      debugPrint("Getting Process is Complete:");
    }).catchError((error) async {

      int result =
      await ServerError.withError(error: error)
          .getErrorCode();
      debugPrint(result.toString());

      debugPrint("jjjjhjhjhjhjhjhuuhhj");

      if (result == 401) {
        // ShowMessage().onSessionExpirePopUp();
      } else {
        ShowMessage().showErrorMessage(
            ServerError.withError(error: error)
                .getErrorMessage()
                .toString());
      }
    });

    return response;
  }

  @override
  Future imagePickerScanData({required String apiUrl, required FormData formData}) async {
    var response = await _dio.post(
      apiUrl,
      data: formData,
      options: Options(headers: {
        "Accept": 'application/json',
        'Content-Type': 'multipart/form-data',
        "Authorization": "Token 94166b27b1f5dc804ca7668d1aae752c059bf54d",
      }),
      onSendProgress: (int sent, int total) {
        debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
      },
    ).whenComplete(() {
      debugPrint("POST Complete:");
    }).catchError((error) async {

      int result =
      await ServerError.withError(error: error)
          .getErrorCode();
      debugPrint(result.toString());

      debugPrint("jjjjhjhjhjhjhjhuuhhj");

      if (result == 401) {
        // ShowMessage().onSessionExpirePopUp();
      } else {
        ShowMessage().showErrorMessage(
            ServerError.withError(error: error)
                .getErrorMessage()
                .toString());
      }
    });
    return response;
  }

  @override
  Future postRequestBody({required String apiUrl, required String token}) async {
    var response;
    response = await _dio.post(
      apiUrl,
      options: Options(headers: {
        "Accept": 'application/json',
        'Content-type': 'application/json',
        "Authorization": "Bearer ${token.toString()}",
      }),
      onSendProgress: (int sent, int total) {
        debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
      },
    ).whenComplete(() {
      debugPrint("POST Complete:");
    }).catchError((error) async {

      int result =
      await ServerError.withError(error: error)
          .getErrorCode();
      debugPrint(result.toString());

      debugPrint("jjjjhjhjhjhjhjhuuhhj");

      if (result == 401) {
        // ShowMessage().onSessionExpirePopUp();
      }
      else {
        ShowMessage().showErrorMessage(
            ServerError.withError(error: error)
                .getErrorMessage()
                .toString());
      }
    });
    return response;

  }
}
