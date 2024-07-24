import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider_test/data/app_exception.dart';
import 'package:provider_test/data/network/baseapiservices.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';
import 'package:provider_test/utils/constant.dart';

class NetworkApiServices extends BaseApiServices {
  final _dio = Dio(BaseOptions(headers: {'Authorization': 'Bearer $token'}))
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));

  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      Response response = await _dio.get(url);

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await _dio
          .post(url, data: jsonEncode(data))
          .timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getDeleteApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await _dio
          .delete(url, data: jsonEncode(data))
          .timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.data;
        debugPrint("responseJson -----??$responseJson");
        return responseJson;

      case 400:
        throw BadRequestException(response.data.toString());
      case 404:
        throw UnauthorisedException(response.data.toString());
      default:
        throw FetchDataException(
            "Error accured while communicating with server + with status code ${response.statusCode}");
    }
  }
}
