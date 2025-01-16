import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mentors_service/app/modules/profile/widgets/title_and_button.dart';
import 'package:mentors_service/common/app_color/app_colors.dart';
import 'package:mentors_service/common/app_text_style/style.dart';
import 'package:mentors_service/common/widgets/custom_button.dart';
import 'package:mentors_service/common/widgets/custom_card.dart';
import 'package:mentors_service/common/widgets/custom_dialouge.dart';
import 'package:mentors_service/common/widgets/spacing.dart';

class MentorShipRequestCard extends StatefulWidget {
  const MentorShipRequestCard({
    super.key,
  });

  @override
  State<MentorShipRequestCard> createState() => _MentorShipRequestCardState();
}

class _MentorShipRequestCardState extends State<MentorShipRequestCard> {

  final List<String> itemList=['Delete'];
  @override
  Widget build(BuildContext context) {
    final GlobalKey _globalKey = GlobalKey();
    return CustomCard(
      crossAxisAlignment: CrossAxisAlignment.start,
      elevation: 0,
      cardColor: AppColors.primaryColor.withOpacity(0.2),
      children: [
        TitleAndButton(
          key: _globalKey ,
          title: 'Request 1',
          onTap: () {
             buildPopUpMenu(_globalKey, itemList);
          },
        ),
        Text(
          'Help with arms',
          style: AppStyles.h4(),
        ),
        verticalSpacing(8.h),
        Row(
          children: [
            Expanded(
              child: Text(
                'An Army professional seeking guidance to enhance leadership skills, career growth, and strategic expertise .... see more',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.h5(),
              ),
            ),
            horizontalSpacing(5.w),
            Switch(value: false, onChanged: (value) {}),
          ],
        ),
        verticalSpacing(8.h),
        Text(
          'Status: In review',
          style: AppStyles.h6(color: Colors.deepOrangeAccent),
        )
      ],
    );
  }
  void buildPopUpMenu(GlobalKey buttonKey, List<dynamic> itemList) {
    WidgetsBinding.instance.addPostFrameCallback((__) {
      RenderBox currentRenderObject =
      buttonKey.currentContext?.findRenderObject() as RenderBox;
      final buttonPosition = currentRenderObject.localToGlobal(Offset.zero);
      showMenu(
        context: context,
        position: RelativeRect.fromLTRB(
          buttonPosition.dx.w,
          buttonPosition.dy.h +30.h,
          30.w,
          0,
        ),
        items: itemList.map(
              (item) => PopupMenuItem(
            child: Text(item,style: AppStyles.h3(),),
            onTap: () {
              Text(item);
              showRequestDeleteDialog(isConfirm: false,context);
            },
          ),
        ).toList(),
      );
    });
  }

  void showRequestDeleteDialog(BuildContext context, {required bool isConfirm}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialogue(isConfirm: isConfirm,);
      },
    );
  }

}


