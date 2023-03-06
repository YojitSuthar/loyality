import 'package:assign_1/screens/package_resources/package_resources.dart';
import 'package:flutter/material.dart';
/*
* This are the option list/ menu list for the user which we can from bottum bar navigation bt pressing on more menu*/
class Option {
  static List userOption = [
    {
      "label": "Offers",
      "icon": Icon(
        Icons.local_offer,
        color: ColorManager.green,
      )
    },
    {
      "label": "Notifications",
      "icon": Icon(
        Icons.notification_important_outlined,
        color: ColorManager.green,
      )
    },
    {
      "label": "Coupons And Promos",
      "icon": Icon(
        Icons.account_balance_wallet_outlined,
        color: ColorManager.green,
      )
    },
    {
      "label": "Loyalty Cards",
      "icon": Icon(
        Icons.card_giftcard,
        color: ColorManager.green,
      )
    },
    {
      "label": "Purchase",
      "icon": Icon(
        Icons.add_circle,
        color: ColorManager.green,
      )
    },
    {
      "label": "Shopping Tips",
      "icon": Icon(
        Icons.home,
        color: ColorManager.green,
      )
    },
    {
      "label": "Reports",
      "icon": Icon(
        Icons.report,
        color: ColorManager.green,
      )
    },
    {
      "label": "Vendor Accounts And Credentials",
      "icon": Icon(
        Icons.account_box,
        color: ColorManager.green,
      )
    },
    {
      "label": "Chat",
      "icon": Icon(
        Icons.chat,
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
    // {"leading": Icon(Icons.home_rounded), "title": Text("Search College"), "onTap": null},
  ];
}
