import 'package:test_project/data/models/api/response/TokenResponse.dart';
import '../../../network/server_api.dart';
import '../../app_data.dart';
import '../api/request/set_user.dart';

class UserRepository {
  final RestClient client;

  UserRepository(this.client);

  Future<String?> getAccessToken() async {
    return AppData.instance.getAccessToken();
  }

  TokenResponse saveAccessToken(TokenResponse response) {
    AppData.instance.saveAccessToken(response);
    return response;
  }

  void removeAccessData() {
    AppData.instance.clearAccessData();
  }

  Future<TokenResponse> postUser(String username, String password) {
    var request = SetUserRequest(
        username: username,
        password: password,
        );
    return client.authUser(request);
  }
}