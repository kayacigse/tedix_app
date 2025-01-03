import 'package:flutter/material.dart';



class TUserProfileText extends StatelessWidget {
  const TUserProfileText({
    super.key,
    required this.text,
    required this.sublineText,
  });

  final String text;
  final String sublineText;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text( text , style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.white),),
      subtitle: Text(sublineText, style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),


    );
  }
}
