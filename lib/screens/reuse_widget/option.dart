import 'package:flutter/material.dart';
import 'package:assign_1/screens/package_resources/package_resources.dart';

/*
User Option Table Widget, which we use to give the user options
*/


class UserOptionTable extends StatelessWidget {
   String label;
  final Icon icon;
  final String? navigation;
  final int? index;
  UserOptionTable({ required this.label, required this.icon,this.navigation,this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: ListTile(
          leading: icon,
          title: Text(label,style: fontSizeWeightTextStyle(18.sp, FontWeightManager.semiBold),),
          onTap:(){
            if (label=='Loyalty Cards'){
              Navigator.popAndPushNamed(context,  UserLoyalCard.id);
            }
          },
        ),
      ),
    );
  }
}