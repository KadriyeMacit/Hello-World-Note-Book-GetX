import 'dart:convert';

List<dynamic> searchResponseModelFromJson(String str) =>
    List<dynamic>.from(json.decode(str)["notes"].map((x) => x).map((x) => SearchResponseModel.fromJson(x)));

class SearchResponseModel {
  SearchResponseModel({
    required this.noteId,
    required this.title,
    required this.description,
    required this.date,
    required this.isRemove,
  });

  final String noteId;
  final String title;
  final String description;
  final DateTime date;
  final String isRemove;

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) => SearchResponseModel(
        noteId: json["noteId"],
        title: json["title"],
        description: json["description"],
        date: DateTime.parse(json["date"]),
        isRemove: json["isRemove"],
      );
}
