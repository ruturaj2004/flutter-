import 'package:baap_trasport_app/constants/app_enum.dart';
import 'package:baap_trasport_app/constants/app_images.dart';

String fetchIconFromAsset(assetName) {
  if (assetName == AppIcons.logo.name) {
    return AppImages.logo;
  } else if (assetName == AppIcons.forward.name) {
    return AppImages.forward;
  } else if (assetName == AppIcons.bus.name) {
    return AppImages.bus;
  } else if (assetName == AppIcons.car.name) {
    return AppImages.car;
  }else if (assetName == AppIcons.notification.name) {
    return AppImages.notification;
  } else if(assetName==AppIcons.user.name){
    return AppImages.user;
  } else if (assetName==AppIcons.dropdown.name){
    return AppImages.dropdown;
  } else if(assetName==AppIcons.profile.name){
    return AppImages.profile;
  } else if(assetName==AppIcons.check.name){
    return AppImages.check;
  }
  return '';
}
