import 'package:flutter/material.dart';
import 'package:assign_1/resources/resources.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class UserCardList extends StatelessWidget {
  final String label;
  final Icon icon;
  final String? navigation;
  final int? index;
  UserCardList({required this.label, required this.icon,this.navigation,this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: icon,
        title: Text(label,style: new_1TextStyle(18.sp, FontWeightManager.semiBold),),
        onTap:(){
          if (navigation=='loyal_card'){
            Navigator.popAndPushNamed(context, 'loyal_card');
          }
        },
      ),
    );
  }
}