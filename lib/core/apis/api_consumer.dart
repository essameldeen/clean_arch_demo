abstract class ApiConsumer {
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParamters});

  Future<dynamic> post(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParamters,
      bool formDataIsEnable = false});
  Future<dynamic> put(String path, Map<String, dynamic>? body,
      Map<String, dynamic>? queryParamters);
}
