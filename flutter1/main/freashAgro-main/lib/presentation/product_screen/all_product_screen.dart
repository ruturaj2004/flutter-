import 'package:baap_organic_app/presentation/appbar/appbar.dart';
import 'package:baap_organic_app/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/icon_widget.dart';
import '../../widgets/sizebox.dart';
import '../../widgets/text_widget.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              context.push(Routes.homeScreen);
            },
            child: IconWidget(iconData: Icons.arrow_back_outlined)),
        title: const CustomAppBar(),
        actions: _action(context),
        centerTitle: true,
      ),
      body: _builder(),
    );
  }

  _builder() {
    List<String> items = [
      "Vegitables",
      "Leafy-Veg's",
      "Fruit-vegitables",
      "Herbs & Spices",
      "Legumes-Veg's(शेंगा)",
      "Grains(कडधान्ये)",
      "Pulses",
    ];
    List<String> imagepath = [
      "assets/onion.png",
      "assets/palak.png",
      "assets/potato.png",
      "assets/patta.png",
      "assets/shevga.png",
      "assets/wheet.png",
      "assets/dal.png",
    ];

    return Expanded(
      child: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    context.push(Routes.gridview);
                  },
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          imagepath[index],
                          height: 60.h,
                        ),
                      ),
                      SizedBoxWidget(width: 10.w),
                      TextWidget(
                        data: items[index],
                        fontSize: 20.sp,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _action(BuildContext context) {
    [
      IconWidget(
        iconData: Icons.search_rounded,
      ),
      SizedBoxWidget(
        width: 10.w,
      ),
      IconWidget(
        iconData: Icons.favorite_border,
      ),
      SizedBoxWidget(
        width: 10.w,
      ),
      IconWidget(
        iconData: Icons.shopping_cart_outlined,
      ),
      SizedBoxWidget(
        width: 10.w,
      )
    ];
  }
}
