import 'package:google_sign_in/google_sign_in.dart';
import 'package:join/blocs/base.dart';
import 'package:join/model/account_model.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc extends BaseBloc<AccountModel> {
  Observable<AccountModel> get userInfo => fetcher.stream;

  fetchUser(GoogleSignInAccount account) async {
    AccountModel model = await repository.fetchUser(account);
    fetcher.sink.add(model);
  }

  Future<AccountModel> isSignUpUser(GoogleSignInAccount account) {
    return repository.fetchUser(account);
  }
}

final userBloc = UserBloc();
