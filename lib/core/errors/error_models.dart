class ErrorModel {
  final dynamic message;

  ErrorModel({required this.message});
  factory ErrorModel.fromJson(dynamic data) {
    return ErrorModel(message: data);
  }
}
