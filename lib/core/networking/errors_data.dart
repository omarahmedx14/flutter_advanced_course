final errorsData = {
  'noContent': {'code': 201, 'message': 'No Content'},
  'badRequest': {'code': 400, 'message': 'Bad Request'},
  'unAuthorized': {'code': 401, 'message': 'UnAuthorized'},
  'forbidden': {'code': 403, 'message': 'Forbidden'},
  'notFound': {'code': 404, 'message': 'Not Found'},
  'internalServerError': {'code': 500, 'message': 'Internal Server Error'},
  'apiLogicError': {'code': 422, 'message': 'Api Logic Error'},

  'connenctionTimeOut': {'code': -1, 'message': 'Connection Timeout'},
  'cancel': {'code': -2, 'message': 'Cancel'},
  'recieveTimeout': {'code': -3, 'message': 'Recieve Timeout'},
  'sendTimeout': {'code': -4, 'message': 'Send Timeout'},
  'cacheError': {'code': -5, 'message': 'Cache Error'},
  'noInternetConnection': {'code': -6, 'message': 'No Internet Connection'},

  'defaultError': {'code': -7, 'message': 'Default Error'},

  // Add your custom errors here
};
