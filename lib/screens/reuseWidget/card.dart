import 'package:flutter/material.dart';
import 'package:assign_1/resources/resources.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class card extends StatefulWidget {
  final String label;
  final Icon icon;
  final String? navigation;
  final int? index;
  card({required this.label, required this.icon,this.navigation,this.index});

  @override
  State<card> createState() => _cardState();
}

class _cardState extends State<card> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: widget.icon,
        title: Text(widget.label,style: new_1TextStyle(18.sp, FontWeightManager.semiBold),),
        onTap:(){
          Navigator.popAndPushNamed(context, 'loyal_card');
        },
      ),
    );
  }
}