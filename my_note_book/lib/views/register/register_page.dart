import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_note_book/data/src/colors.dart';
import 'package:my_note_book/data/src/strings.dart';
import 'package:my_note_book/views/login/login_page.dart';
import 'package:my_note_book/views/register/register_controller.dart';

class RegisterPage extends GetWidget<RegisterController> {
  static const String routeName = '/views/register/register_page';

  @override
  Widget build(BuildContext context) {
    controller.isRegister.listen((isRegister) {
      if (isRegister) _goToLogin();
    });

    controller.error.listen((error) => _errorDialog());

    return Scaffold(
        appBar: AppBar(
          title: Text(registerAppBarText),
          backgroundColor: mainColor,
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSpace(),
            _buildUsernameTextField(),
            _buildSpace(),
            _buildEmailTextField(),
            _buildSpace(),
            _buildBookTextField(),
            _buildSpace(),
            _buildPasswordTextField(),
            _buildSpace(),
            _buildPasswordVerifyTextField(),
            _buildSpace(),
            _buildButton()
          ],
        ),
      ),
    );
  }

  Widget _buildUsernameTextField() {
    return Material(
      elevation: 10,
      color: white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(300),
          topRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 8, 2),
        child: TextField(
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: usernameText,
          ),
          controller: controller.usernameController,
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return Material(
      elevation: 10,
      color: white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 8, 2),
        child: TextField(
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: emailText,
          ),
          controller: controller.emailController,
        ),
      ),
    );
  }

  Widget _buildBookTextField() {
    return Material(
      elevation: 10,
      color: white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 8, 2),
        child: TextField(
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: bookText,
          ),
          controller: controller.bookController,
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Material(
      elevation: 10,
      color: white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 8, 2),
        child: TextField(
          textInputAction: TextInputAction.next,
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: passwordText,
          ),
          controller: controller.passwordController,
        ),
      ),
    );
  }

  Widget _buildPasswordVerifyTextField() {
    return Material(
      elevation: 10,
      color: white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(300),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 8, 2),
        child: TextField(
          textInputAction: TextInputAction.done,
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: passwordVerifyText,
          ),
          controller: controller.passwordVerifyController,
        ),
      ),
    );
  }

  Widget _buildButton() {
    final double size = 40;
    return SizedBox(
      height: size,
      child: ElevatedButton(
          onPressed: () => _onTap(),
          child: Text(registerText),
          style: ElevatedButton.styleFrom(
            primary: mainColor,
          )),
    );
  }

  void _onTap() {
    if (controller.usernameController.text.isNotEmpty &&
        controller.emailController.text.isNotEmpty &&
        controller.bookController.text.isNotEmpty &&
        controller.passwordController.text.isNotEmpty) {
      controller.callingRegisterService(
        controller.usernameController.text,
        controller.emailController.text,
        controller.bookController.text,
        controller.passwordController.text,
      );
    } else {
      _emptyDialog();
    }
  }

  Widget _buildSpace() {
    return SizedBox(
      height: 30,
    );
  }

  void _goToLogin() {
    Get.toNamed(LoginPage.routeName);
  }

  void _errorDialog() {
    Get.snackbar(
      errorTitle,
      errorDescription,
      colorText: white,
      backgroundColor: red,
    );
  }

  void _emptyDialog() {
    Get.snackbar(
      errorTitle,
      emptyText,
      colorText: white,
      backgroundColor: red,
    );
  }
}
