import 'package:flutter/material.dart';
import 'package:two_brother/constant/app_colors.dart';
import 'package:two_brother/widget/icon.dart';
import 'package:two_brother/widget/sizebox.dart';
import 'package:two_brother/widget/text_widget.dart';

class Productlist extends StatefulWidget {
  const Productlist({Key? key}) : super(key: key); // Correcting the constructor

  @override
  State<Productlist> createState() => _ProductlistState();
}

class ProductCategory {
  final String image;
  final String name;

  const ProductCategory({required this.image, required this.name});
}

class _ProductlistState extends State<Productlist> {
  final List<ProductCategory> categories = List.generate(
    10,
    (index) => ProductCategory(
      image: "assets/images/media.png",
      name: "All Product $index",
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Two Brothers Organic Farms"),
        leading: BackButton(),
      ),
      body: Container(
        color: AppColor.inputcolor,
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return _buildCategoryListTile(categories[index], context);
          },
        ),
      ),
    );
  }

  Widget _buildCategoryListTile(ProductCategory category, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        
      ),
      child: Row(
        children: [
          Image.asset(category.image, width: 70.0, height: 80.0),
          SizedBoxWidget(width: 10.0),
          Expanded(
            child: TextWidget(data: category.name, fontSize: 18.0),
          ),
          IconWidget(iconData: Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
