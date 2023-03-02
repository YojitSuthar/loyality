import 'package:assign_1/screens/package_resources/package_resoureces.dart';
import 'package:flutter/material.dart';
/*
* This are the option list/ menu list for the user which we can from bottum bar navigation bt pressing on more menu*/
class Option {
  static List userOption = [
    {
      "label": "Offers",
      "icon": Icon(
        Icons.abc,
        color: ColorManager.green,
      )
    },
    {
      "label": "Notifications",
      "icon": Icon(
        Icons.abc,
        color: ColorManager.green,
      )
    },
    {
      "label": "Coupons And Promos",
      "icon": Icon(
        Icons.abc,
        color: ColorManager.green,
      )
    },
    {
      "label": "Loyalty Cards",
      "icon": Icon(
        Icons.abc,
        color: ColorManager.green,
      )
    },
    {
      "label": "Purchase",
      "icon": Icon(
        Icons.abc,
        color: ColorManager.green,
      )
    },
    {
      "label": "Shopping Tips",
      "icon": Icon(
        Icons.abc,
        color: ColorManager.green,
      )
    },
    {
      "label": "Reports",
      "icon": Icon(
        Icons.abc,
        color: ColorManager.green,
      )
    },
    {
      "label": "Vendor Accounts And Credentials",
      "icon": Icon(
        Icons.abc,
        color: ColorManager.green,
      )
    },
    {
      "label": "Chat",
      "icon": Icon(
        Icons.abc,
        color: ColorManager.green,
      )
    },
  ];

  static List drawerOption = [
    {"leading": Icon(Icons.paypal), "title": Text("PayPal"), "onTap": null},
    {
      "leading": Icon(Icons.home_work_outlined),
      "title": Text("Add"),
      "onTap": null
    },
    {"leading": Icon(Icons.key), "title": Text("PassWord"), "onTap": null},
    {"leading": Icon(Icons.logout), "title": Text("LogOut"), "onTap": null},
  ];
}
