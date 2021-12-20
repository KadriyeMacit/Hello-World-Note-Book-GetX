import 'package:dio/dio.dart';
import 'package:my_note_book/data/services/dio_manager.dart';
import 'package:http/http.dart' as http;
import 'package:my_note_book/data/services/login/model/login_request_model.dart';
import 'package:my_note_book/data/services/login/model/login_response_model.dart';

abstract class LoginService {
  Future login(LoginRequestModel registerRequestModel);
}

class LoginServiceImp extends LoginService {
  final Dio _dio;

  LoginServiceImp(DioManager _dioManager) : _dio = _dioManager.dio;

  @override
  Future login(LoginRequestModel loginRequestModel) async {
    // return await _dio
    //     .post(
    //       "notebook/login.php",
    //       data: loginRequestModel.toJson(),
    //     )
    //     .then((response) => loginResponseModelFromJson(response.data));

    const String _baseUrl = 'http://kadriyemacit.com/notebook/login.php';

    var _url = Uri.parse(_baseUrl);

    final response = await http.post(_url, body: loginRequestModel.toJson());

    if (response.statusCode == 200) {
      return loginResponseModelFromJson(response.body);
    } else {
      return '';
    }
  }
}
