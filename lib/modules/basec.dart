class GenericResult {
  bool success;
  String? message;
  dynamic data;

  GenericResult(this.success, {this.message, this.data});

  factory GenericResult.fromJson(dynamic json) {
    return GenericResult(
      json?['code'] == 200 ? true : false,
      message: json?['message'],
      data: json?['data'],
    );
  }
}
