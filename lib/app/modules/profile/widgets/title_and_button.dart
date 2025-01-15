import 'package:flutter/material.dart';
import 'package:mentors_service/common/app_text_style/style.dart';



class TitleAndButton extends StatelessWidget {
  const TitleAndButton({
    super.key, required this.title, required this.onTap,
  });
  final String title;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(title,maxLines: 1,overflow: TextOverflow.ellipsis,style: AppStyles.h3(),)),
        IconButton(onPressed: onTap, icon: const Icon(Icons.more_vert_outlined),)
      ],
    );
  }
}
