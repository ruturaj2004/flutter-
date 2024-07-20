import 'package:baap_organic_app/constant/app_color.dart';

import 'package:flutter/material.dart';
import 'package:baap_organic_app/constant/app_string.dart';
import 'package:baap_organic_app/widgets/listTile_widget.dart';
import 'package:baap_organic_app/widgets/text_widget.dart';

class SidebarScreen extends StatefulWidget {
  const SidebarScreen({Key? key}) : super(key: key);

  @override
  State<SidebarScreen> createState() => _SidebarScreenState();
}

class _SidebarScreenState extends State<SidebarScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        child: Drawer(
          child: ListView(children: [
            _userLoginWidget(),
          const   ListTileWidget(
              leading: const Icon(
                Icons.home,
                color: AppColors.iconColor,
              ),
              title: AppString.homeText,
             
            ),
            ExpansionTile(
              leading: const Icon(
                Icons.shop_rounded,
                color: AppColors.iconColor,
              ),
              title: const TextWidget(
                data: AppString.shopText,
                fontWeight: FontWeight.normal,
              ),
              children: [
                _listTileWidget(
                  title: "All Products",
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                _listTileWidget(
                  title: "Newly Launched",
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                _listTileWidget(
                  title: "Ghee",
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                _listTileWidget(
                  title: "Combos",
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                _listTileWidget(
                  title: "Winter Treats",
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                _listTileWidget(
                  title: "Essentials",
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                _listTileWidget(
                  title: "Super Foods",
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                _listTileWidget(
                  title: "Care",
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                _listTileWidget(
                  title: "Coffee",
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                _listTileWidget(
                  title: "Vegan",
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                _listTileWidget(
                  title: "Gift Hampers",
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
              ],
            ),
            ExpansionTile(
              leading: const Icon(
                Icons.pets_rounded,
                color: AppColors.iconColor,
              ),
              title: const TextWidget(
                data: AppString.ourPhilosophyText,
                fontWeight: FontWeight.normal,
              ),
              children: [
                // _listTileWidget(
                //     trailing: const Icon(Icons.chevron_right),
                //     title: "Our Philosophy",
                //     onTap: () =>
                //         _navigateToScreen(context, const PhilosophyScreen()
                //         )
                //         ),
                _listTileWidget(
                  title: "Health of People & Planet",
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                _listTileWidget(
                  title: "Soil Health",
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                _listTileWidget(
                  title: "Conscious Cattle Rearing",
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                _listTileWidget(
                  title: "Our Community",
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                _listTileWidget(
                  title: "Awards & Recognition",
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
              ],
            ),
            ExpansionTile(
              leading: const Icon(
                Icons.person,
                color: AppColors.iconColor,
              ),
              title: const TextWidget(
                data: AppString.theMovementText,
                fontWeight: FontWeight.normal,
              ),
              children: [
                _listTileWidget(
                  title: "Work With Farmers",
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                _listTileWidget(
                  title: "Workshops & Lectures",
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                _listTileWidget(
                  title: "Collaborations",
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
              ],
            ),
            ExpansionTile(
              leading: const Icon(
                Icons.note_alt_rounded,
                color: AppColors.iconColor,
              ),
              title: const TextWidget(
                data: AppString.engageText,
                fontWeight: FontWeight.normal,
              ),
              children: [
                _listTileWidget(
                  title: "Blogs - Farmer's Kitaab",
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                _listTileWidget(
                  title: "Blogs - Food & Health",
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                _listTileWidget(
                  title: "Blogs - Real Life Stories",
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                _listTileWidget(
                  title: "Publications",
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                _listTileWidget(
                  title: "FAQs",
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                _listTileWidget(
                  title: "Testimonials",
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                _listTileWidget(
                  title: "Overseas Orders",
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
              ],
            ),
            ListTileWidget(
              leading: const Icon(
                Icons.my_library_books_rounded,
                color: AppColors.iconColor,
              ),
              title: AppString.labReportsText,
              onTap: () {},
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0, top: 8.0, bottom: 8.0),
              child: TextWidget(data: AppString.getInTouchText),
            ),
            ExpansionTile(
                leading: const Icon(
                  Icons.call,
                  color: AppColors.iconColor,
                ),
                title: const TextWidget(
                  data: AppString.connectText,
                  fontWeight: FontWeight.normal,
                ),
                children: [
                  ExpansionTile(
                    title: const TextWidget(
                      data: "Contact Us",
                      fontWeight: FontWeight.normal,
                    ),
                    children: [
                      _listTileWidget(
                        title: "Mail Us",
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {},
                      ),
                      _listTileWidget(
                        title: "Call Us",
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {},
                      ),
                      _listTileWidget(
                        title: "Whatsapp Us",
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {},
                      ),
                    ],
                  ),
                  _listTileWidget(
                    title: "Farm Visits",
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  _listTileWidget(
                    title: "Delhi Store",
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  _listTileWidget(
                    title: "Farmer's Market",
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  _listTileWidget(
                    title: "Franchise",
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                ]),
            _listTileWidget(
              title: AppString.rewardsText,
              onTap: () {},
              trailing: const Icon(Icons.chevron_right),
            ),
          ]),
        ),
      ),
    );
  }

  _userLoginWidget() {
    return Container(
      color: const Color.fromARGB(255, 255, 240, 207),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 20,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person,
              ),
            ),
          ),
          title: const TextWidget(
            data: "Login | Register",
          ),
          onTap: () {},
        ),
      ),
    );
  }

  _listTileWidget({
    required String title,
    required VoidCallback onTap,
    required Widget trailing,
  }) {
    return ListTileWidget(
      title: title,
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}
