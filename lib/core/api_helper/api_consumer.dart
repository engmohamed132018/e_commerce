abstract class ApiConsumer {
  //! get data Abstract
  Future<dynamic> get(String path,
      {Object? data, Map<String, dynamic>? queryParmater});
  //! post data Abstract

  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParmater,
    bool? isDataMap,
  });
  //! get delete Abstract

  Future<dynamic> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParmater,
    bool? isDataMap,
  });
  //! get put Abstract

  Future<dynamic> put(
    String path, {
    dynamic data,
    bool? isDataMap,
    Map<String, dynamic>? queryParmater,
  });
}
