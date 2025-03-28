// ignore_for_file: unused_element

import 'dart:io';

import 'package:dio/dio.dart';
// ///package:my_rick_and_morty/
import 'package:logger/logger.dart';
import 'package:shafi/base_injection.dart';
import 'package:shafi/core/utils/constants.dart';

import '../../../../core/services/local/cache_consumer.dart';
import '../../../../core/services/local/storage_keys.dart';
import '../../../../core/utils/logger.dart';
import '../../../app_urls/app_url.dart';
import 'logging_interceptor.dart';

class DioClient {
  final String baseUrl;
  final LoggingInterceptor loggingInterceptor;
  final AppPrefs cacheConsumer;

  Dio? dio;
  String? token;

  _getToken() async {
    if (token == null) {
      token = await cacheConsumer.get(PrefKeys.token);
      if (null != token) {
        dio?.options.headers.addAll({'Authorization': 'Bearer $token'});
      }
    }
  }

  DioClient(
    this.baseUrl,
    Dio? dioC, {
    required this.loggingInterceptor,
    required this.cacheConsumer,
  }) {
    dio = dioC ?? Dio();
    dio!
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = Constants.connectTimeout
      ..options.receiveTimeout = Constants.connectTimeout
      ..httpClientAdapter
      ..options.headers = {
        'Accept': 'application/json; charset=UTF-8',
        'x-api-key': AppURL.kAPIKey,
        // 'Content-Type': 'application/json; charset=UTF-8',
        'Content-Language': 'en',
        // 'Authorization': 'Bearer $token',
      };
    _getToken();
    dio!.interceptors.add(loggingInterceptor);
  }

  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    options ??= await initOptions();
    try {
      var response = await dio!.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String uri, {
    FormData? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? parameters,
    Options? options,
    String? filePath,
    bool ignorePath = false,
    List<String>? filePathList,
    String? filePathListName,
    List<FileModel>? filePathNamedList,
    String? fileName,
    List<FileModel>? filesPath,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    options ??= await initOptions();
    try {
      // if (data != null && data.files.isNotEmpty) {
      //   for (var element in data.files) {
      //     Logger().d(element.value);
      //     kEcho("upl
      //   }
      // }

      // if (!ignorePath) {
      //   data = await _buildFileData(
      //     filePath: filePath,
      //     filesPath: filesPath,
      //     filePathList: filePathList,
      //     filePathListName: filePathListName,
      //     fileName: fileName,
      //   );
      // }

      var response = await dio!.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      Logger().d(response.data);
      return response;
    } on FormatException catch (_) {
      log('post', 'Unable to process the data');
      throw const FormatException("Unable to process the data");
    } catch (e) {
      // log('post::', e.toString());

      rethrow;
    }
  }

  Future<Response> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    options ??= await initOptions();
    try {
      var response = await dio!.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      Logger().d(response.data);
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    options ??= await initOptions();
    try {
      var response = await dio!.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      Logger().d(response.data);
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Options> initOptions() async {
    Options options = Options(
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Accept-Language': 'ar',
        'User-Agents': 'android',
      },
    );
    AppPrefs prefs = getIt();
    String? token = await prefs.getSecuredData(PrefKeys.token);
    token ??= await prefs.get(PrefKeys.token);
    if (token != null) {
      options.headers?.addAll({'Authorization': 'Bearer $token'});
    }
    return options;
  }
}

Future<FormData?> _buildFileData({
  required String? filePath,
  required List<FileModel>? filesPath,
  required List<String>? filePathList,
  required String? filePathListName,
  required String? fileName,
}) async {
  FormData? data;

  if (filePath != null) {
    String fName = filePath.split('/').last;
    Map<String, dynamic> body = {
      fileName ?? "image":
          await MultipartFile.fromFile(filePath, filename: fName),
    };
    data = FormData.fromMap(body);
    log('dio', 'files $body');
  } else if (filePathList != null) {
    for (String path in filePathList) {
      String fileName = path.split('/').last;
      data = FormData.fromMap({
        filePathListName ?? "images[]":
            await MultipartFile.fromFile(path, filename: fileName),
      });
    }
  } else if (filesPath != null) {
    Map<String, dynamic> body = {};
    for (FileModel file in filesPath) {
      if (file.path != null) {
        log('dio', 'file - name: ${file.name} - path: ${file.path}  ');
        String fileName = file.path!.split('/').last;
        body.addAll({
          file.name:
              await MultipartFile.fromFile(file.path!, filename: fileName)
        });
      } else {
        for (var i = 0; i <= (file.paths?.length ?? 0) - 1; i++) {
          String path = file.paths![i];
          // for(String path in file.paths??[]){
          log('dio', 'files name: ${file.name}[$i] - path: $path  ');
          String fileName = path.split('/').last;
          body.addAll({
            '${file.name}[$i]':
                await MultipartFile.fromFile(path, filename: fileName)
          });
        }
      }
    }
    log('dio', 'files $body');
    data = FormData.fromMap(body);
  }
  return data;
}

class FileModel {
  final String name;
  final String? path;
  final List<String>? paths;

  const FileModel({
    required this.name,
    this.path,
    this.paths,
  });
}
