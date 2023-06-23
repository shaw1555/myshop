import 'package:myshop/model/user_profile.dart';

class UserService {
  final UserProfile _userProfile =
      UserProfile(userId: '1', userName: 'Moe Phwal', phoneNo: '09 1234 56789');

  UserProfile getUserProfile() {
    return _userProfile;
  }
}
