import 'package:google_sign_in/google_sign_in.dart';
import 'package:join/model/account_model.dart';
import 'package:join/repository/userRepository.dart';

class Repository {
  final userRepository = UserRepository();

  Future<AccountModel> fetchUser(GoogleSignInAccount account) =>
      userRepository.getUserInfo(account);
}
