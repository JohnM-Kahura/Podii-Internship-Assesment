import 'package:flutter/material.dart';
import 'package:order_in/helpers/responsive_helper.dart';

import '../constants/styles.dart';

Widget detailsFeaturedItem(String img, String itemName, String itemPrice) {
  return ResponsiveWidget(
    mobile: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular( 20 ),
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
              radius:  35 ,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular( 20 ),
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
          height:  100 ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                itemName,
                style:headingStyle3,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      itemPrice,
                                    style:headingStyle2,
  
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
    tablet: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular( 20 ),
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
                radius:  35 ,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular( 20 ),
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
            height:  100 ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  itemName,
                  style:headingStyle3,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Text(
                        itemPrice,
                                      style:headingStyle2,
  
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
  );
}
