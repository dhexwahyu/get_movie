// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      count: json['count'] as int?,
      limit: json['limit'] as int?,
      page: json['page'] as int?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('limit', instance.limit);
  writeNotNull('page', instance.page);
  writeNotNull('total', instance.total);
  return val;
}
