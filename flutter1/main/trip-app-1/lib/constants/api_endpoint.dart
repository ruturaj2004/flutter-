class ApiEndPoints {
  // static const int groupId = 1695232348474; //current
  static const int groupId = 1698658253245;
  // static const int groupId = 1697789152088; // for deployement
  static const int roleId = 1703228300417;
  static const String trip = "tripId";
  static const String sendOtpUrl =
      "https://gxppcdmn7h.execute-api.ap-south-1.amazonaws.com/authgw/sendotp";

  static const String verifyOtpUrl =
      "https://4r4iwhot12.execute-api.ap-south-1.amazonaws.com/auth/auth/validateOtp/";
  static const String startTripUrl =
      "https://so1h005xk4.execute-api.ap-south-1.amazonaws.com/peopleManagement/trip/start/trip";
  static const String refreshUserToken =
      "https://gxppcdmn7h.execute-api.ap-south-1.amazonaws.com//authgw/refresh-token";
  static const String updateLocationApi =
      "https://so1h005xk4.execute-api.ap-south-1.amazonaws.com/peopleManagement/trip/update/destinationByTripId";
  static const String getDurationApi =
      "https://so1h005xk4.execute-api.ap-south-1.amazonaws.com/peopleManagement/trip/getDurationByGroupId";
  static const String getgroupdata =
      "https://4r4iwhot12.execute-api.ap-south-1.amazonaws.com/auth/group/getByGroupId";

}
