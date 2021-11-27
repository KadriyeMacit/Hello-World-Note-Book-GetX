import 'package:get/get.dart';
import 'package:my_note_book/views/add_notes/add_notes_controller.dart';
import 'package:my_note_book/views/home/home_controller.dart';
import 'package:my_note_book/views/login/login_controller.dart';
import 'package:my_note_book/views/register/register_controller.dart';

Future getControllers() async {
  Get.create(() => LoginController(), permanent: false);
  Get.create(() => RegisterController(), permanent: false);
  Get.create(() => HomeController(), permanent: false);
  Get.create(() => AddNotesController(), permanent: false);
}
