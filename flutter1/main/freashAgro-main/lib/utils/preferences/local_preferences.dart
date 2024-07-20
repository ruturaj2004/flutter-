import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/jwt_token_response_model/jwt_token_response_model.dart';



class LocalStorageUtils {
  static late final SharedPreferences instance;

  static Future<SharedPreferences> init() async =>
      instance = await SharedPreferences.getInstance();
  static JwtTokeResponseModel get tokenResponseModel => userData();

  static Future<void> saveUserDetails(String token) async {
    await instance.setString("token", token);
  }

  static Future<String?> fetchToken() async {
    final token = instance.getString('token') ?? '';
    if (token.isEmpty) {
      return "";
    }
    return token;
  }

  static JwtTokeResponseModel userData() {
    final token = instance.getString('token') ?? '';
    var userData = JwtDecoder.decode(token);
    var userDecoded = JwtTokeResponseModel.fromJson(userData);
    return userDecoded;
  }

  static Future<void> clear() async {
    await instance.clear();
  }
}
