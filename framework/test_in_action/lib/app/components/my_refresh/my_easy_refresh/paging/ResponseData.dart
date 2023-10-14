class ResponseData {
  final int page;
  final int pageSize;
  final int total;
  final List<String> data;

  ResponseData({
    required this.page,
    required this.pageSize,
    required this.total,
    required this.data,
  });
}
