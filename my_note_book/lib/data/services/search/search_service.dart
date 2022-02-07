import 'package:http/http.dart' as http;
import 'package:my_note_book/data/services/search/model/search_request_model.dart';
import 'package:my_note_book/data/services/search/model/search_response_model.dart';

abstract class SearchService {
  Future search(SearchRequestModel searchRequestModel);
}

class SearchServiceImp extends SearchService {
  @override
  Future search(SearchRequestModel searchRequestModel) async {
    const String _baseUrl = 'http://kadriyemacit.com/notebook/search.php';

    var _url = Uri.parse(_baseUrl);

    final response = await http.post(_url, body: searchRequestModel.toJson());

    var noteListTitle = [];

    if (response.statusCode == 200) {
      var data = searchResponseModelFromJson(response.body);
      for (int i = 0; i < data.length; i++) {
        noteListTitle.add(data[i].title);
      }
      return noteListTitle;
    } else {
      return '';
    }
  }
}
