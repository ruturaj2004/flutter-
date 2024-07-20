
import 'package:baap_organic_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String price;
 // ignore: use_key_in_widget_constructors
 const CustomCard({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price, required List<Map<String, dynamic>> cardData,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color:const Color(0xFFF8E6E6),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.imageUrl,
              // fit: BoxFit.cover,
              height: 150,
              width: 150,
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_outline_outlined,
                    color: isFavorite ? Colors.red :const  Color.fromARGB(255, 196, 191, 191),
                    size: 25,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 5),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.price,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Position() {
  return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      textStyle: TextStyle(
                        fontSize: 15.h,
                        fontWeight: FontWeight.bold,
                      ),
                      minimumSize: const Size(350, 60),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.compare_arrows_sharp,
                            color: Colors.white),
                        SizedBox(width: 8.w),
                        const TextWidget(
                          data: 'Filter',
                          color: Colors.white, fontSize: 17
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ]));
}