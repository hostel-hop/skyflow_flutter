class SkyflowRecords<T extends SkyflowRecord> {
  SkyflowRecords.fromJson({
    required Map<String, dynamic> json,
    required T Function(Map<String, dynamic>) recordFromJson,
    required this.recordToJson,
  }) : records = {
          'records': (json['records'] as List<dynamic>)
              .map((e) => recordFromJson(e['fields'] as Map<String, dynamic>))
              .toList(),
        };

  SkyflowRecords.fromList({
    required List<T> records,
    required T Function(Map<String, dynamic>) recordFromJson,
    required this.recordToJson,
  }) : records = {
          'records': records,
        };

  final Map<String, List<T>> records;
  final Map<String, dynamic> Function(T) recordToJson;

  Map<String, List<dynamic>> toJson() => {
        'records': (records['records'] as List<T>).map((e) {
          return {
            'table': e.table,
            'fields': recordToJson(e),
          };
        }).toList()
      };
}

abstract class SkyflowRecord {
  String get table;
}
