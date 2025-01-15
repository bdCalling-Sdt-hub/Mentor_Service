import 'package:flutter/material.dart';
import 'package:mentors_service/common/app_text_style/style.dart';

class CustomAppBarTitle extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBarTitle({
    super.key,  required this.text, this.backgroundColor, this.textColor,
  });
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor??Colors.white ,
      title: Text(text,style: AppStyles.h2(color: textColor??Colors.black),),
      centerTitle: true,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
