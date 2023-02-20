import 'package:flutter/material.dart';
import 'package:assign_1/resources/resources.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class loyal_card extends StatelessWidget {
  const loyal_card({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black,blurStyle: BlurStyle.inner)],
              ),
              margin: EdgeInsets.only(top: 5).r,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5).r,
                        child: Row(
                          children: [
                            Icon(Icons.arrow_back,size: 30,),
                            SizedBox(width: 10.w,),
                            Text("Loyalty Cards",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w500),)
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10).r,
                        child: Row(
                          children: [
                            Icon(Icons.search,size: 30,),
                            SizedBox(width: 10.w,),
                            Icon(Icons.document_scanner_outlined,size: 30,)
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h,),
                  Container(
                    margin: EdgeInsets.only(left: 10,).r,
                    child: Row(
                      children: [
                        Container(
                          //It show the loaction of the shop
                          margin: EdgeInsets.only(left: 1, top: 5,).r,
                          height: 23.h,
                          child: Image.asset(
                            //image of location icon
                            IconAssets.location_icon,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Johan - TW12 44GH - Londan",
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeightManager.medium),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: (){
          Navigator.pushNamed(context, "userDataField");
        },
        child: Icon(Icons.edit,),
      ),
    );
  }
}


