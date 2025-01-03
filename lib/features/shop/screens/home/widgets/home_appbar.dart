import 'package:flutter/material.dart';
import '../../../../../common/widget/appbar/appbar.dart';
import '../../../../../utils/constants/text_strings.dart';


class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: Colors.grey)),//dark or light mode doesnt matter its always gonna be grey
          Text(TTexts.homeAppbarSubTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: Colors.white,),),
        ],
      ),
    );
  }
}