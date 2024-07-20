import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salesman_app/constant/app_color.dart';
import 'package:salesman_app/widget/custom_icon_widget.dart';
import 'package:salesman_app/widget/sized_box_widget.dart';
import 'package:salesman_app/widget/text_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late File _image = File(''); // Initializing _image with an empty File
  final ImagePicker _picker = ImagePicker();

  Future<void> getImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(data: 'Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            _profileWidget(onImageSelected: _updateImage),
            _profileInfo(),
          ],
        ),
      ),
    );
  }

  void _updateImage(File newImage) {
    _image = newImage;
  }

  _profileWidget({required Function(File) onImageSelected}) {
    return Column(
      children: [
        Stack(
          children: [
            Center(
              child: CircleAvatar(
                radius: 60.r,
                backgroundImage: _image.existsSync() ? FileImage(_image) : null,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 120.r,
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        child: Wrap(
                          children: [
                            ListTile(
                              leading: IconWidget(iconData: Icons.camera),
                              title: const TextWidget(data: 'Camera'),
                              onTap: () {
                                Navigator.of(context).pop();
                                getImage(ImageSource.camera);
                              },
                            ),
                            ListTile(
                              leading:
                                  IconWidget(iconData: Icons.photo_library),
                              title: const TextWidget(data: 'Gallery'),
                              onTap: () {
                                Navigator.of(context).pop();
                                getImage(ImageSource.gallery);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: IconWidget(iconData: 
                    Icons.camera_alt_rounded,
                    size: 20.sp,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _profileInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconWidget(
                iconData: Icons.person,
                color: const Color(0xff83AC88),
                size: 20.sp,
              ),
              const SizedBoxWidget(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    data: "Name",
                    color: AppColors.textGrey,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  TextWidget(
                    data: "John Doe",
                    fontSize: 14.sp,
                  ),
                ],
              ),
              const Spacer(),
              IconWidget(
                iconData: Icons.edit,
                color: const Color(0xff83AC88),
                size: 20.sp,
              ),
            ],
          ),
          const SizedBoxWidget(height: 16),
          Row(
            children: [
              IconWidget(
                iconData: Icons.phone,
                color: const Color(0xff83AC88),
                size: 20.sp,
              ),
              const SizedBoxWidget(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    data: "Phone Number",
                    color: AppColors.textGrey,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  TextWidget(
                    data: "+1234567890",
                    fontSize: 14.sp,
                  ),
                ],
              ),
              const Spacer(),
              IconWidget(
                iconData: Icons.edit,
                color: const Color(0xff83AC88),
                size: 20.sp,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              IconWidget(
                iconData: Icons.email,
                color: const Color(0xff83AC88),
                size: 20.sp,
              ),
              const SizedBoxWidget(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    data: "Email",
                    color: AppColors.textGrey,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  TextWidget(
                    data: "example@example.com",
                    fontSize: 14.sp,
                  ),
                ],
              ),
              const Spacer(),
              IconWidget(
                iconData: Icons.edit,
                color: const Color(0xff83AC88),
                size: 20.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
