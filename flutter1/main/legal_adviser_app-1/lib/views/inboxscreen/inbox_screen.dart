import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:legal_adviser/const/app_color.dart';
import 'package:legal_adviser/const/app_sizes.dart';
import 'package:legal_adviser/const/app_string.dart';
import 'package:legal_adviser/widgets/app_size.dart';
import 'package:legal_adviser/widgets/bottombar.dart';
import 'package:legal_adviser/widgets/diveder.dart';
import 'package:legal_adviser/widgets/text_widget.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _inboxWidget(),
              SizedBoxWidget(height: 25),
              _listViewWidget(),
              Expanded(child: ShowBottomNavigationBar())
            ],
          ),
        ),
      ),
    );
  }
 
  _inboxWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            data: AppString.mondayText,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
          TextWidget(
            data: AppString.inboxText,
            fontSize: 30.sp,
            fontWeight: FontWeight.w600,
          ),
         
        ],
      ),
    );
    
  }
  
 _listViewWidget() {
  return Column(
    children: [
      Container(
        height:AppSizes.getPhoneSize(context, 350) ,
        width: double.infinity,
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  leading: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvjvAi98jYCBSyoSGGszcdvGpea_cqhjZOQg&usqp=CAU"),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(data: AppString.aliceText,fontSize: 13.sp),
                   TextWidget(data: AppString.galdhelpText,fontSize: 12.sp),
                   TextWidget(data: AppString.casepausedText,fontSize: 12.sp,color: AppColors.black45),


                    ],
                  ),
                  onTap: () {},
                ),
               CustomDivider(
               endIndent: 27.0,
               indent: 30.0,
                
               )
              ],
            );
          },
        ),  
      ), 
    ],
  );
}
}