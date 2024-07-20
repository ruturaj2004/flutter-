import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:two_brother/constant/app_colors.dart';
import 'package:two_brother/constant/app_image.dart';
import 'package:two_brother/constant/app_string.dart';
import 'package:two_brother/widget/appbar.dart';
import 'package:two_brother/widget/icon.dart';
import 'package:two_brother/widget/sizebox.dart';
import 'package:two_brother/widget/text_widget.dart';
import 'package:photo_view/photo_view.dart';

class IteamView extends StatefulWidget {
  const IteamView({super.key});
  @override
  State<IteamView> createState() => _IteamViewState();
}

class _IteamViewState extends State<IteamView> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  List images = [    AppImages.butter,
 AppImages.cbutter,
 AppImages.gul,

];

  List _descriptions = [
    'Description 2',
    'Description 2',
    'Description 3',
    // Add more descriptions corresponding to the images
  ];

  bool isFavorite = false;
    bool isFavorite1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          leading: IconWidget(iconData: Icons.arrow_back),
          title: Center(
            child: Column(
              children: [
                TextWidget(
                  data: AppString.two,
                  color: AppColor.success,
                  fontWeight: FontWeight.w800,
                  fontSize: 17.sp,
                ),
                TextWidget(
                  data: AppString.brothers,
                  color: AppColor.success,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w800,
                ),
                TextWidget(
                  data: AppString.farm,
                  fontWeight: FontWeight.bold,
                  color: AppColor.success,
                  fontSize: 6.sp,
                  letterSpacing: 1,
                ),
              ],
            ),
          ),
          actions: [
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
            const SizedBoxWidget(
              width: 10,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            FullScreenImage(imageUrl: AppImages.butter),
                      ),
                    );
                  },
                  child: Image.asset(
                    AppImages.butter,
                    height: 200,
                    width: double.infinity,
                  ),
                ),
                SizedBoxWidget(
                  height: 25,
                ),
                Container(
                  margin: EdgeInsets.only(left: 300),
                  child: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? AppColor.red : null,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                  ),
                ),
                Container(
                    height: 40,
                    margin: EdgeInsets.only(left: 300),
                    child: IconWidget(
                      iconData: Icons.share_outlined,
                      size: 20,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextWidget(
                      data: AppString.instock,
                      color: AppColor.green,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextWidget(
                      fontSize: 10,
                      data: AppString.productname,
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextWidget(
                      data: AppString.price,
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextWidget(
                      fontSize: 10,
                      color: AppColor.gray,
                      data: AppString.mrp,
                    ),
                  ],
                ),
                SizedBoxWidget(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        data: AppString.quntity,
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: Row(
                          children: <Widget>[
                            SizedBoxWidget(
                              height: 15,
                              width: 20,
                              child: FloatingActionButton(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 255, 255),
                                onPressed: _decrementCounter,
                                tooltip: 'Decrement',
                                mini: true,
                                elevation: 0,
                                child: Icon(
                                  Icons.remove,
                                  size: 12,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.0),
                            TextWidget(
                              data: '$_counter',
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBoxWidget(width: 10.0),
                            SizedBoxWidget(
                              height: 15,
                              width: 20,
                              child: FloatingActionButton(
                                backgroundColor: AppColor.white,
                                onPressed: _incrementCounter,
                                tooltip: 'Increment',
                                mini: true,
                                elevation: 0,
                                child: Icon(
                                  Icons.add,
                                  size: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                SizedBoxWidget(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      data: AppString.description,
                      fontSize: 12,
                    ),
                    IconWidget(
                      iconData: Icons.keyboard_arrow_right_outlined,
                      size: 20,
                    )
                  ],
                ),
                Container(
                  child: Container(
                    height: 280,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: images.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            width: 150,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 200, // Adjust height as needed
                                  width: 200, // Adjust width as needed

                                  child: Image.network(
                                    images[index],
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(_descriptions[index]),
                                    IconButton(
                                      icon: Icon(
                                        isFavorite1
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: isFavorite1 ? AppColor.red : null,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isFavorite1 = !isFavorite1;
                                        });
                                      },
                                    ),
                                  ],
                                ), // Assuming this is the image description
                                TextWidget(
                                  data: AppString.price,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class FullScreenImage extends StatelessWidget {
  final String imageUrl;
  FullScreenImage({required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: PhotoView(
            imageProvider: AssetImage(imageUrl),
            backgroundDecoration: BoxDecoration(color: Colors.black),
            minScale: PhotoViewComputedScale.contained * 0.8,
            maxScale: PhotoViewComputedScale.covered * 2.0,
          ),
        ),
      ),
    );
  }
}
