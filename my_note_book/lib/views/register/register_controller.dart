import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_note_book/data/services/register/model/register_request_model.dart';
import 'package:my_note_book/data/services/register/model/register_response_model.dart';
import 'package:my_note_book/data/services/register/register_service.dart';

class RegisterController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController bookController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordVerifyController = TextEditingController();

  final Rx<bool> isLoading = RxBool(false);
  final Rxn<dynamic> error = Rxn<dynamic>();
  final RxBool isRegister = RxBool(false);

  final Rxn<RegisterResponseModel> user = Rxn();

  final RegisterService _registerService;

  RegisterController(this._registerService);

  void callingRegisterService(String username, String email, String book, String password) {
    final RegisterRequestModel _userReguest = RegisterRequestModel(
      username: username,
      email: email,
      book: book,
      password: password,
    );

    isLoading.call(true);
    _registerService.register(_userReguest).then((user) {
      isRegister.call(true);
    }).catchError((dynamic error) {
      this.error.trigger(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }
}
