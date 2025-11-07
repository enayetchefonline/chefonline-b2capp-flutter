class BaseResponse<T> {
  final String message;
  final dynamic data;  // Can be a single object or a list of objects
  final int statusCode;

  BaseResponse({
    required this.message,
    required this.data,
    required this.statusCode,
  });
  factory BaseResponse.fromJson(
      Map<String, dynamic> json,
      T Function(dynamic)? fromJsonT,
      ) {
    final data = json['data'];
    final statusCode = json['status_code'] ?? 0;
    final message = json['message'] ?? '';
    dynamic parsedData;
    if (data != null && fromJsonT != null) {
      if (data is List) {
        parsedData = List<T>.from(data.map((item) => fromJsonT(item)));
      } else {
        parsedData = fromJsonT(data);
      }
    }

    return BaseResponse<T>(
      message: message,
      data: parsedData,
      statusCode: statusCode,
    );
  }
}
