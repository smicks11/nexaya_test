import 'package:nexaya/app/app.locator.dart';
import 'package:nexaya/core/payload/base_payload.dart';
import 'package:nexaya/core/payload/signin_payload.dart';
import 'package:nexaya/core/service/base/api_service.dart';

class AuthenticationService {
  final api = locator<ApiService>();

  Future<ApiResponse<SignInPayload>> signInService(Map<String, dynamic> data) {
    return api.postApi('/9858e7e1-968c-432a-a420-d814bb18ac40/user', data, transform: (dynamic res) {
      return SignInPayload.fromJson(res);
    });
  }
}
