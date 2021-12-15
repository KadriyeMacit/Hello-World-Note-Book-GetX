import 'package:dio/dio.dart';
import 'package:my_note_book/data/services/dio_manager.dart';
import 'package:my_note_book/data/services/register/model/register_request_model.dart';
import 'package:my_note_book/data/services/register/model/register_response_model.dart';
import 'package:http/http.dart' as http;

abstract class RegisterService {
  Future register(RegisterRequestModel registerRequestModel);
}

class RegisterServiceImp extends RegisterService {
  final Dio _dio;

  RegisterServiceImp(DioManager _dioManager) : _dio = _dioManager.dio;

  @override
  Future register(RegisterRequestModel registerRequestModel) async {
    // return await _dio
    //     .post(
    //       "notebook/register.php",
    //       data: registerRequestModel.toJson(),
    //     )
    //     .then((response) => registerResponseModelFromJson(response.data));

    const String _baseUrl = 'http://kadriyemacit.com/notebook/register.php';
    var _url = Uri.parse(_baseUrl);

    final response = await http.post(_url, body: registerRequestModel.toJson());

    if (response.statusCode == 200) {
      print('Kayıt başarılı');
      return registerResponseModelFromJson(response.body);
    } else {
      return '';
    }
  }
}
