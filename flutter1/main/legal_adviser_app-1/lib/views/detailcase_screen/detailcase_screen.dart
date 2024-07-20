import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_adviser/const/app_color.dart';
import 'package:legal_adviser/const/app_string.dart';
import 'package:legal_adviser/logic/dropdown/dropdowncubit_cubit.dart';
import 'package:legal_adviser/logic/dropdown/dropdowncubit_state.dart';
import 'package:legal_adviser/utils/routes/routes.dart';
import 'package:legal_adviser/widgets/app_size.dart';
import 'package:legal_adviser/widgets/custom_icon.dart';
import 'package:legal_adviser/widgets/dropdown_widget.dart';
import 'package:legal_adviser/widgets/text_widget.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class DetailCaseScreen extends StatefulWidget {
  const DetailCaseScreen({super.key});

  @override
  State<DetailCaseScreen> createState() => _DetailCaseScreenState();
}

class _DetailCaseScreenState extends State<DetailCaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [_caseDetailAppBarWidget(), _caseDetailsWidget()],
      ),
    );
  }

  _caseDetailAppBarWidget() {
    return Container(
        height: 105.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      context.push(Routes.homeScreen);
                    },
                    child: IconWidget(
                      iconData: Icons.keyboard_arrow_left,
                      size: 32.sp,
                      
                    ),
                  ),
                ],
              ),
            ),
            SizedBoxWidget(
              height: 10,
            ),
            Row(children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: 200.w,
                  child: BlocBuilder<DropdownCubit, DropdownState>(
                    builder: (context, state) {
                      var items = [
                        'Living Alone',
                        'Details',
                        'Timeline',
                        'Advisory Committee',
                        'Case Documents',
                        'Calendar'
                      ];

                      var selectCaseDetail = state.casedetail;

                      void handleDropdown(String newValue) {
                        context.read<DropdownCubit>().updateCaseType(newValue);
                      }

                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        context
                            .read<DropdownCubit>()
                            .selectCaseType('Living Alone');
                      });

                      return DropDownFormWidget(
                        list: items,
                        selectedValue: selectCaseDetail.toString(),
                        hintText: selectCaseDetail,
                        onChanged: handleDropdown,
                        context: context,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a gender';
                          }
                          return null;
                        },
                      );
                    },
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                   
                    children: [
                      TextWidget(
                        data: AppString.caseState,
                        fontSize: 11.sp,
                      ),
                      TextWidget(
                        data: AppString.open,
                        fontSize: 11.sp,
                        color: AppColors.green,
                      ),
                    ],
                  ),
                  TextWidget(
                    data: AppString.location,
                    fontSize: 11.sp,
                  ),
                ],
              ),
            ]),
          ],
        ));
  }

  _caseDetailsWidget() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            SizedBoxWidget(
              height: 10,
            ),
            Row(
              children: [
                TextWidget(
                  data: AppString.details,
                  fontSize: 20,
                ),
              ],
            ),
            Divider(
              height: 0.5,
              color: AppColors.gray,
            ),
            SizedBoxWidget(
              height: 15,
            ),
            SizedBoxWidget(
              height: 10,
            ),
            Row(
              children: [
                TextWidget(data: AppString.ligaIssue, fontSize: 15),
              ],
            ),
            SizedBoxWidget(
              height: 15,
            ),
            Row(
              children: [
                TextWidget(data: AppString.dateFormate, fontSize: 15),
              ],
            ),
            SizedBoxWidget(
              height: 15,
            ),
            Row(
              children: [
                TextWidget(data: AppString.caseNumber, fontSize: 15),
              ],
            ),
            SizedBoxWidget(
              height: 30,
            ),
            Row(
              children: [
                TextWidget(data: AppString.description, fontSize: 20),
              ],
            ),
            Divider(
              height: 0.5,
              color: AppColors.gray,
            ),
            SizedBoxWidget(
              height: 15,
            ),
            Row(
              children: [
                TextWidget(data: AppString.clientAlone, fontSize: 15),
              ],
            )
          ],
        ),
      ),
    );
  }
}
