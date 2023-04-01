class HttpResponse {
  final int? statusCode;
  final String? statusMessage;
  final dynamic data;
  final String? error;
  final bool isSuccess;

  HttpResponse({this.statusCode, this.data, this.error, this.statusMessage, this.isSuccess = true});

  bool isResponseSuccess() {
    return isSuccess;
  }
}