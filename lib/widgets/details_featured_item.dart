import 'package:flutter/material.dart';

import '../constants/styles.dart';

Widget detailsFeaturedItem(String img, String itemName, String itemPrice) {
  return LayoutBuilder(builder: (context, constraint) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(constraint.maxWidth < 760 ? 20 : 40),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 8,
                ),
              ],
            ),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: constraint.maxWidth < 760 ? 35 : 70,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(constraint.maxWidth < 760 ? 20 : 40),
                child: Image.asset(
                  img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10, left: 10),
          height: constraint.maxWidth < 760 ? 100 : 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                itemName,
                style: headingStyle3Tab,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      itemPrice,
                      style: headingStyle2Tab,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  });
}
