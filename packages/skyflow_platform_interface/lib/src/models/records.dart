class SkyflowRecords<T> {
  SkyflowRecords.fromJson({
    required Map<String, dynamic> json,
    required T Function(Map<String, dynamic>) recordFromJson,
    required this.recordToJson,
  }) : records = {
          'records': (json['records'] as List)
              .map<T>((e) => recordFromJson(e))
              .toList()
        };

  final Map<String, List<T>> records;
  final Map<String, dynamic> Function(T) recordToJson;

  Map<String, List<dynamic>> toJson() => {
        'records':
            (records['records'] as List<T>).map((e) => recordToJson(e)).toList()
      };
}
