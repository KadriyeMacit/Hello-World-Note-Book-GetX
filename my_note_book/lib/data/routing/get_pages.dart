import 'package:get/get.dart';
import 'package:my_note_book/views/add_notes/add_notes_page.dart';
import 'package:my_note_book/views/home/home_page.dart';
import 'package:my_note_book/views/info/info_page.dart';
import 'package:my_note_book/views/login/login_page.dart';
import 'package:my_note_book/views/profile/profile_page.dart';
import 'package:my_note_book/views/register/register_page.dart';

List<GetPage> getPages = [
  GetPage(name: LoginPage.routeName, page: () => LoginPage()),
  GetPage(name: RegisterPage.routeName, page: () => RegisterPage()),
  GetPage(name: HomePage.routeName, page: () => HomePage()),
  GetPage(name: AddNotesPage.routeName, page: () => AddNotesPage()),
  GetPage(name: InfoPage.routeName, page: () => InfoPage()),
  GetPage(name: ProfilePage.routeName, page: () => ProfilePage()),
];
