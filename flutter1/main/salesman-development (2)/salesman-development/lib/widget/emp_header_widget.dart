import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:salesman_app/constant/app_color.dart';
import 'package:salesman_app/constant/app_string.dart';
import 'package:salesman_app/utils/routes/routes.dart';
import 'package:salesman_app/widget/custom_icon_widget.dart';
import 'package:salesman_app/widget/text_widget.dart';

import '../utils/preferences/local_preferences.dart';

class EmpHeaderWidget extends StatefulWidget {
  const EmpHeaderWidget({super.key});

  @override
  State<EmpHeaderWidget> createState() => _EmpHeaderWidgetState();
}

class _EmpHeaderWidgetState extends State<EmpHeaderWidget> {
  String _userName = '';

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final token = await LocalStorageUtils.fetchToken();
    if (token!.isNotEmpty) {
      final userData = JwtDecoder.decode(token);
      setState(() {
        _userName = userData['name'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
          data: AppString.hello,
          color: AppColors.textGrey,
          fontWeight: FontWeight.bold,
        ),
        Row(
          children: [
            TextWidget(
              data: _userName,
              fontSize: 18.sp,
              fontWeight: FontWeight.w900,
            ),
            const Spacer(),
         
          ],
        ),
        const TextWidget(
          data: "●●●",
          color: AppColors.successColor,
        ),
      ],
    );
  }
}
