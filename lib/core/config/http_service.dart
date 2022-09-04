import 'dart:convert';
import 'dart:io';

import 'package:contact_app/core/config/app_globals.dart';
import 'package:contact_app/errors/exceptions.dart';
import 'package:dio/dio.dart';

class HttpService {
  HttpService._();

  static Future<dynamic> get(
    String path, {
    dynamic parameters,
  }) async {
    final options = Options();
    options.headers = {
      "x-apikey": AppGlobals.apiKey,
      HttpHeaders.acceptHeader: 'application/json',
    };
    Response response;
    try {
      response = await Dio().get(
        path,
        queryParameters: parameters ?? {},
        options: options,
      );
    } on DioError catch (_) {
      throw ServerException(null);
    }

    if (response.statusCode == 200) {
      return Future.value(response.data);
    } else {
      if (response.statusCode! ~/ 100 == 4) {
        throw BadRequestException(response.data);
      } else {
        throw ServerException(response.data);
      }
    }
  }

  static Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? formData,
  }) async {
    final options = Options();

    options.headers = {
      "x-apikey": AppGlobals.apiKey,
      HttpHeaders.acceptHeader: 'application/json',
    };

    Response response;
    try {
      response = await Dio().post(
        path,
        data: formData != null ? FormData.fromMap(formData) : data,
        options: options,
      );
    } on DioError catch (_) {
      throw ServerException(null);
    }

    if (response.statusCode! ~/ 100 == 2) {
      return Future.value(response.data);
    } else {
      if (response.data.statusCode! ~/ 100 == 4) {
        throw BadRequestException(response.data);
      } else {
        throw ServerException(response.data);
      }
    }
  }

  static Future<dynamic> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? formData,
  }) async {
    final options = Options();

    options.headers = {
      "x-apikey": AppGlobals.apiKey,
      HttpHeaders.acceptHeader: 'application/json',
    };
    Response response;

    try {
      response = await Dio().put(
        path,
        data: formData != null ? FormData.fromMap(formData) : data,
        options: options,
      );
    } on DioError catch (_) {
      throw ServerException(null);
    }

    if (response.statusCode! ~/ 100 == 2) {
      return Future.value(response.data);
    } else {
      if (response.data.statusCode! ~/ 100 == 4) {
        throw BadRequestException(response.data);
      } else {
        throw ServerException(response.data);
      }
    }
  }
}
