// import 'package:json_annotation/json_annotation.dart';
//
// part 'todos_response.g.dart';
//
// @JsonSerializable()
// class TodosResponse {
//   late int? limit;
//
//   late int? skip;
//
//   late int? total;
//   @JsonKey(name: 'todos')
//   late List<TodoData>? data;
//
//   TodosResponse({
//      this.limit,
//      this.skip,
//      this.total,
//      this.data,
//   });
//
//   factory TodosResponse.fromJson(Map<String, dynamic> json) {
//
//     print(json);
//     return _$TodosResponseFromJson(json);
//   }
//
//   Map<String, dynamic> toJson() => _$TodosResponseToJson(this);
// }
//
// @JsonSerializable()
// class TodoData {
//   int? id;
//   String? todo;
//   bool? completed;
//   int? userId;
//
//   TodoData({this.id, this.todo, this.completed, this.userId});
//
//
//   factory TodoData.fromJson(Map<String, dynamic> json) =>
//       _$TodoDataFromJson(json);
//
//   Map<String, dynamic> toJson() => _$TodoDataToJson(this);
// }
