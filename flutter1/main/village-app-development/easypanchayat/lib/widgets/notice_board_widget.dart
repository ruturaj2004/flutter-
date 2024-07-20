import 'package:easypanchayat/constants/app_colors.dart';

import 'package:easypanchayat/widgets/sizedbox_widget.dart';
import 'package:easypanchayat/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoticeBoardWidget extends StatefulWidget {
  const NoticeBoardWidget({super.key, this.onclose});

  final VoidCallback? onclose;

  @override
  State<NoticeBoardWidget> createState() => _NoticeBoardWidgetState();
}

class _NoticeBoardWidgetState extends State<NoticeBoardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      width: 358.w,
      color: AppColors.profileBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: "सूचना",
                  fontSize: 20.sp,
                ),
                const Spacer(),
                InkWell(onTap: widget.onclose, child: const Icon(Icons.close))
              ],
            ),
            SizedBoxWidget(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextWidget(
                        text:
                            "सोमवार दिनांक १२ फेब्रुवारी रोजी सकाळी १० वाजता ग्रामसभा",
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 5),
                      TextWidget(
                        text:
                            "सर्व ग्रामसंथान कळविण्यात येत आहे कि, या ऑगस्ट महिन्यातील ग्रामसभा सोमवारी सकाळी ११ वाजता मारुती मंदिरासमोर ठेवली आहे. आपले काही प्रश्न असेल तर नक्की कालवा",
                        fontSize: 14.sp,
                        color: AppColors.textColor,
                      ),
                      const SizedBox(height: 5),
                      const TextWidget(
                        text:
                            "--------------------------------------------------------------------",
                        color: AppColors.textColor,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
