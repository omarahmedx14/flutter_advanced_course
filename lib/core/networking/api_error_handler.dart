import 'package:dio/dio.dart';

import 'api_error_model.dart';
import 'errors_data.dart';

// TODO: wallahy I will refactor this .. Omar Ahmed
// 7asal wana this

// DO NOT edit enum DataSource values without synchronizing data in errors_data.dart
enum DataSource {
  noContent,
  badRequest,
  unAuthorized,
  forbidden,
  internalServerError,
  notFound,

  connenctionTimeOut,
  cancel,
  recieveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,

  // API_LOGIC_ERROR,
  defaultError
}

extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() {
    return ApiErrorModel.fromJson(errorsData[name]!);
  }
}

extension DioErrorExtension on DioExceptionType {
  ApiErrorModel getFailure() {
    try {
      final dataSource = DataSource.values.byName(name);
      return dataSource.getFailure();
    } catch (e) {
      throw Exception('$name is not a valid DataSource enum value.');
    }
  }
}

class ErrorHandler implements Exception {
  late ApiErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      apiErrorModel = _handleError(error);
    } else {
      // default error
      apiErrorModel = DataSource.defaultError.getFailure();
    }
  }

  ApiErrorModel _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.cancel:
        return error.type.getFailure();

      case DioExceptionType.connectionError:
      case DioExceptionType.badCertificate:
        return DataSource.defaultError.getFailure();

      case DioExceptionType.badResponse:
      case DioExceptionType.unknown:
        final response = error.response;

        final hasResponse = response != null;
        final hasStatusCode = response?.statusCode != null;
        final hasStatusMessage = response?.statusMessage != null;

        if (hasResponse && hasStatusCode && hasStatusMessage) {
          return ApiErrorModel.fromJson(response.data);
        }
        return DataSource.defaultError.getFailure();
    }
  }
}
