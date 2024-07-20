import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageUtils {
  static late final SharedPreferences instance;
  static Future<SharedPreferences> init() async =>
      instance = await SharedPreferences.getInstance();

  static Future<void> saveUserDetails(String token) async {
    await instance.setString("token", token);
    log("Token saved!");
  }

  static Future<void> saveGeoLocation(double lat, double lon) async {
    await instance.setDouble("latitude", lat);
    await instance.setDouble("longitude", lon);
    log("Geo Location Saved");
  }

  static double? getLatitude() {
    final latitude = instance.getDouble('latitude');
    return latitude;
  }

  static double? getLongitude() {
    final latitude = instance.getDouble('longitude');
    return latitude;
  }

  static Future<String?> fetchToken() async {
    final token = instance.getString('token') ?? '';

    if (token.isEmpty) {
      return "";
    }

    return token;
  }

  static Future<void> clear() async {
    await instance.clear();
  }

  // static JwtRefreshToken userData() {
  //   final token = instance.getString('token') ?? '';
  //   var decodedToken = JwtDecoder.decode(token);
  //   String name = decodedToken['name'];
  //   log("name of the user taken from token is $name");
  //   // var userData = JwtDecoder.decode(token);
  //   var userDecoded = JwtRefreshToken.fromJson(decodedToken);
  //   return userDecoded;
  // }
}
