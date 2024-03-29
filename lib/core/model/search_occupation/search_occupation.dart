import 'package:json_annotation/json_annotation.dart';

part 'search_occupation.g.dart'; // This file will be generated by build_runner

@JsonSerializable()
class SearchOccupation {
  int? status;
  int? count;
  String? message;
  List<OccupationData>? data;

  SearchOccupation({this.status, this.count, this.message, this.data});

  factory SearchOccupation.fromJson(Map<String, dynamic> json) =>
      _$SearchOccupationFromJson(json);

  Map<String, dynamic> toJson() => _$SearchOccupationToJson(this);
}

@JsonSerializable()
class OccupationData {
  int? id;
  String? name;
  int? active;
  dynamic deleted_at; // This can be DateTime if it represents a date

  OccupationData({this.id, this.name, this.active, this.deleted_at});

  factory OccupationData.fromJson(Map<String, dynamic> json) =>
      _$OccupationDataFromJson(json);

  Map<String, dynamic> toJson() => _$OccupationDataToJson(this);
}
