import 'dart:convert';

String searchRequestModelToJson(SearchRequestModel data) => json.encode(data.toJson());

class SearchRequestModel {
  final String title;

  SearchRequestModel({
    required this.title,
  });

  Map<String, dynamic> toJson() => {
        "title": title,
      };
}
