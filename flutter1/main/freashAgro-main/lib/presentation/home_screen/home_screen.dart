import 'package:baap_organic_app/constant/app_color.dart';
import 'package:baap_organic_app/constant/app_images.dart';
import 'package:baap_organic_app/constant/app_string.dart';
import 'package:baap_organic_app/presentation/appbar/appbar.dart';
import 'package:baap_organic_app/presentation/product_screen/all_product_screen.dart';
import 'package:baap_organic_app/presentation/sidebar_screen/sidebar_screen.dart';
import 'package:baap_organic_app/widgets/bottom_navigation.dart';
import 'package:baap_organic_app/widgets/button_widget.dart';
import 'package:baap_organic_app/widgets/icon_widget.dart';
import 'package:baap_organic_app/widgets/sizebox.dart';
import 'package:baap_organic_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../utils/routes/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SidebarScreen(),
      appBar: AppBar(
        title: const CustomAppBar(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconWidget(
              iconData: Icons.account_circle_rounded,
              size: 40.sp,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _subscribe(context),
              const SizedBox(
                height: 10,
              ),
              //  _slider(),
              const SizedBox(
                height: 15,
              ),
              _button(context),
              card(),
              const SizedBox(
                height: 15,
              ),
              leafVeges(),
              const SizedBox(
                height: 15,
              ),
              _herbsspices(),
              const SizedBox(
                height: 15,
              ),
              _fruitesVegetables(),
              const SizedBox(
                height: 15,
              ),
              _legumes(),
              const SizedBox(
                height: 15,
              ),
              _grains(),
              const SizedBox(
                height: 15,
              ),
              _backgroundimage(context),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: const SizedBoxWidget(
        height: 60,
        child: ShowBottomNavigationBar(),
      ),
    );
  }

  _subscribe(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 40,
          width: 250,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Search Fresh vegitables",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              hintStyle: const TextStyle(fontSize: 15),
              contentPadding: const EdgeInsets.all(10),
            ),
          ),
        ),
        const Icon(
          Icons.favorite,
          color: Colors.red,
          size: 30,
        ),
        const Icon(
          Icons.shopping_cart_outlined,
          size: 30,
        ),
      ],
    );
  }

  // _slider() {

  // final  imagepath = [
  //  Image.asset("assets/onion.png"),
  //  Image.asset("assets/flower.png"),
  //  Image.asset("assets/tomato.png"),
  //  Image.asset("assets/potato.png"),
  //   ];
  //   int myCurrentIndex = 0;

  // return Column(children: [
  //     CarouselSlider(
  //       options: CarouselOptions(
  //         autoPlay: true,
  //         height: 200.h,
  //         autoPlayCurve: Curves.fastOutSlowIn,
  //         autoPlayAnimationDuration: const Duration(milliseconds: 600),
  //         autoPlayInterval: const Duration(seconds: 1),
  //         enlargeCenterPage: true,
  //         aspectRatio: 2.0,
  //         onPageChanged: (index, reason) {
  //           setState(() {
  //             myCurrentIndex = index;
  //           });
  //         },
  //       ),
  //       items: imagepath,
  //     ),
  //     AnimatedSmoothIndicator(
  //       activeIndex: myCurrentIndex,
  //       count: imagepath.length,
  //       effect: WormEffect(
  //         dotHeight: 8.h,
  //         dotWidth: 8.w,
  //         spacing: 10,
  //         dotColor: Colors.grey.shade200,
  //         activeDotColor: Colors.grey.shade900,
  //         paintStyle: PaintingStyle.fill,
  //       ),
  //     ),
  //   ]);
  // }

  _button(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomOutlinedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProductScreen()));
          },
          buttonText: "Categories",
          backgroundColor: Colors.blue[200],
          buttonHeight: 30,
          buttonWidth: 160,
          borderRadius: 15,
          fontSize: 20.sp,
        ),
        CustomOutlinedButton(
          onPressed: () {},
          buttonText: "Offers",
          backgroundColor: Colors.blue[200],
          buttonHeight: 32,
          buttonWidth: 160,
          borderRadius: 15,
          fontSize: 20.sp,
        )
      ],
    );
  }

  card() {
    List<String> imagepath = [
      "assets/onion.png",
      "assets/flower.png",
      "assets/onion.png",
      "assets/flower.png",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          data: AppString.bestText,
          fontSize: 23.sp,
          letterSpacing: 1,
        ),
        TextWidget(
          data: AppString.ourText,
          fontSize: 10.sp,
          color: AppColors.textGreyColor,
        ),
        SizedBoxWidget(width: 10.w),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              imagepath.length,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        imagepath[index],
                        height: 150.h,
                      ),
                    ),
                    const TextWidget(
                      data: "Rs. 180/KG",
                      fontWeight: FontWeight.w800,
                    ),
                    Row(
                      children: [
                        addCardButton(),
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        CustomOutlinedButton(
          onPressed: () {
            context.push(Routes.gridview);
          },
          backgroundColor: Colors.blue[200],
          buttonText: "See All Products",
          borderRadius: 15,
        )
      ],
    );
  }

  leafVeges() {
    List<String> imagepath = [
      "assets/methi.png",
      "assets/palak.png",
      "assets/onionleaf.png",
      "assets/nuts.png",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          data: AppString.fruitsText,
          fontSize: 23.sp,
          letterSpacing: 1,
        ),
        TextWidget(
          data: AppString.ourText,
          fontSize: 10.sp,
          color: AppColors.textGreyColor,
        ),
        SizedBoxWidget(width: 10.w),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              imagepath.length,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        imagepath[index],
                        height: 150.h,
                      ),
                    ),
                    const TextWidget(
                      data: "Rs. 180/KG",
                      fontWeight: FontWeight.w800,
                    ),
                    addCardButton()
                  ],
                ),
              ),
            ),
          ),
        ),
        CustomOutlinedButton(
          onPressed: () {
            context.push(Routes.gridview);
          },
          backgroundColor: Colors.blue[200],
          buttonText: "See All Products",
          borderRadius: 15,
        )
      ],
    );
  }

  _backgroundimage(context) {
    List<String> content = [
      "assets/tomato.png",
      "assets/onion.png",
    ];
    return Container(
      width: double.infinity,
      height: 370.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AppImages.ghee,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const TextWidget(
              data: AppString.createText,
              color: Colors.red,
              letterSpacing: 1,
              fontSize: 30,
            ),
            Column(
              children: List.generate(
                content.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                          height: 100.h,
                          width: 200.w,
                          color: Colors.transparent.withOpacity(0.5),
                          child: Column(
                            children: [
                              TextWidget(
                                data: "Super Foods",
                                fontSize: 20.sp,
                                color: AppColors.whiteColor,
                              ),
                              TextWidget(
                                data: "100% Natural, Farm Made In Batches",
                                color: const Color.fromARGB(255, 197, 192, 192),
                                fontSize: 10.sp,
                              )
                            ],
                          )),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          content[index],
                          height: 75,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            CustomOutlinedButton(
              onPressed: () {},
              buttonText: "See All Offers !!",
              backgroundColor: Colors.blue[200],
              borderRadius: 13,
            )
          ],
        ),
      ),
    );
  }

  _herbsspices() {
    List<String> imagepath = [
      "assets/patta.png",
      "assets/methi.png",
      "assets/onionleaf.png",
      "assets/palak.png",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          data: "HERBS & SPICES",
          fontSize: 23.sp,
          letterSpacing: 1,
        ),
        TextWidget(
          data: AppString.ourText,
          fontSize: 10.sp,
          color: AppColors.textGreyColor,
        ),
        SizedBoxWidget(width: 10.w),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              imagepath.length,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          imagepath[index],
                          height: 150.h,
                        ),
                      ),
                      const TextWidget(
                        data: "Rs. 20/per",
                        fontWeight: FontWeight.w800,
                      ),
                      Row(
                        children: [
                          CustomOutlinedButton(
                            onPressed: () {},
                            buttonText: "Add to cart",
                            borderRadius: 15,
                            backgroundColor: Colors.blue[200],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        ],
                      )
                    ]),
              ),
            ),
          ),
        ),
        CustomOutlinedButton(
          onPressed: () {
            context.push(Routes.gridview);
          },
          backgroundColor: Colors.blue[200],
          buttonText: "See All Products",
          borderRadius: 15,
        )
      ],
    );
  }

  _fruitesVegetables() {
    List<String> imagepath = [
      "assets/potato.png",
      "assets/tomato.png",
      "assets/potato.png",
      "assets/bhopla.png",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          data: "Fruites Veg's (फळभाज्या)",
          fontSize: 23.sp,
          letterSpacing: 1,
        ),
        TextWidget(
          data: AppString.ourText,
          fontSize: 10.sp,
          color: AppColors.textGreyColor,
        ),
        SizedBoxWidget(width: 10.w),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              imagepath.length,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          imagepath[index],
                          height: 150.h,
                        ),
                      ),
                      const TextWidget(
                        data: "Rs. 20/per",
                        fontWeight: FontWeight.w800,
                      ),
                      Row(
                        children: [
                          CustomOutlinedButton(
                            onPressed: () {},
                            buttonText: "Add to cart",
                            borderRadius: 15,
                            backgroundColor: Colors.blue[200],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        ],
                      )
                    ]),
              ),
            ),
          ),
        ),
        CustomOutlinedButton(
          onPressed: () {
            context.push(Routes.gridview);
          },
          backgroundColor: Colors.blue[200],
          buttonText: "See All Products",
          borderRadius: 15,
        )
      ],
    );
  }

  _legumes() {
    List<String> imagepath = [
      "assets/shevga.png",
      "assets/tomato.png",
      "assets/potato.png",
      "assets/bhopla.png",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          data: "Legumes-Veg's(शेंगा)",
          fontSize: 23.sp,
          letterSpacing: 1,
        ),
        TextWidget(
          data: AppString.ourText,
          fontSize: 10.sp,
          color: AppColors.textGreyColor,
        ),
        SizedBoxWidget(width: 10.w),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              imagepath.length,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          imagepath[index],
                          height: 150.h,
                        ),
                      ),
                      const TextWidget(
                        data: "Rs. 20/per",
                        fontWeight: FontWeight.w800,
                      ),
                      Row(
                        children: [
                          CustomOutlinedButton(
                            onPressed: () {},
                            buttonText: "Add to cart",
                            borderRadius: 15,
                            backgroundColor: Colors.blue[200],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        ],
                      )
                    ]),
              ),
            ),
          ),
        ),
        CustomOutlinedButton(
          onPressed: () {
            context.push(Routes.gridview);
          },
          backgroundColor: Colors.blue[200],
          buttonText: "See All Products",
          borderRadius: 15,
        )
      ],
    );
  }

  _grains() {
    List<String> imagepath = [
      "assets/wheet.png",
      "assets/tomato.png",
      "assets/potato.png",
      "assets/bhopla.png",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          data: "Grains(कडधान्ये)",
          fontSize: 23.sp,
          letterSpacing: 1,
        ),
        TextWidget(
          data: AppString.ourText,
          fontSize: 10.sp,
          color: AppColors.textGreyColor,
        ),
        SizedBoxWidget(width: 10.w),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              imagepath.length,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          imagepath[index],
                          height: 150.h,
                        ),
                      ),
                      const TextWidget(
                        data: "Rs. 20/per",
                        fontWeight: FontWeight.w800,
                      ),
                      Row(
                        children: [
                          CustomOutlinedButton(
                            onPressed: () {},
                            buttonText: "Add to cart",
                            borderRadius: 15,
                            backgroundColor: Colors.blue[200],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        ],
                      )
                    ]),
              ),
            ),
          ),
        ),
        CustomOutlinedButton(
          onPressed: () {
            context.push(Routes.gridview);
          },
          backgroundColor: Colors.blue[200],
          buttonText: "See All Products",
          borderRadius: 15,
        )
      ],
    );
  }
}

addCardButton() {
  return Row(
    children: [
      CustomOutlinedButton(
        onPressed: () {},
        buttonText: "Add to cart",
        borderRadius: 15,
        backgroundColor: Colors.blue[200],
      ),
      const SizedBox(
        width: 20,
      ),
    ],
  );
}
