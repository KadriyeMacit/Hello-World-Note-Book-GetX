import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_note_book/data/services/login/login_service.dart';
import 'package:my_note_book/data/services/login/model/login_request_model.dart';
import 'package:my_note_book/data/services/login/model/login_response_model.dart';
import 'package:my_note_book/data/src/strings.dart';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();

  final Rx<bool> isLoading = RxBool(false);
  final Rxn<dynamic> error = Rxn<dynamic>();
  final RxBool isLogin = RxBool(true);
  final RxnString errorTexts = RxnString();

  final Rxn<LoginResponseModel> user = Rxn();

  final LoginService _loginService;

  LoginController(this._loginService);

  void callingLoginService(String username, String password) {
    final LoginRequestModel requestModel =
        LoginRequestModel(username: username, password: password);

    isLoading.call(true);
    _loginService.login(requestModel).then((user) {
      if (user.statu == 2) isLogin.call(true);
      if (user.statu == 1) errorTexts.value = wrongPasswordText;
      if (user.statu == 0) errorTexts.value = noUserText;
    }).catchError((dynamic error) {
      this.error.trigger(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }
}
