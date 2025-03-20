import 'package:mentors_service/common/prefs_helper/prefs_helpers.dart';

class UserService{
  static final UserService _instance = UserService._internal();
  String? _userRole;
  factory UserService(){
    return _instance;
  }
  UserService._internal();

  String? get userRole => _userRole;
  fetchRole()async{
    _userRole = await PrefsHelper.getString('userRole');
  }
}