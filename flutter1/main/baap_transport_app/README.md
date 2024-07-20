# To generate Models

dart run build_runner build --delete-conflicting-outputs

# for env deployment commands as per env

# qa

flutter run -t lib/env/main_qa.dart

# dev

flutter run -t lib/env/main_dev.dart

# Uat

flutter run -t lib/env/main_uat.dart
