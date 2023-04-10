import 'package:flutter/material.dart';
import 'package:order_in/helpers/responsive_helper.dart'; 

import '../constants/styles.dart';

Widget recommededItem(
    String img, String itemName, String price, Color bgColor) {
  return ResponsiveWidget(
    mobile: Container(
      // height: 300,

      margin: EdgeInsets.only(left: 10 ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius:  25.0 ,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    20.0 ),
                child: Image.asset(
                  img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height:  10 ),
          Text(
            itemName,
            style: 
                 recommendedTextStyle
              
          ),
          Text(
            price,
            style: 
                recommendedTextStyle
                
          ),
        ],
      ),
    ),
    tablet: Container(
      // height: 300,

      margin: EdgeInsets.only(left: 10 ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius:  25.0 ,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    20.0 ),
                child: Image.asset(
                  img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height:  10 ),
          Text(
            itemName,
            style: 
                 recommendedTextStyle
              
          ),
          Text(
            price,
            style: 
                recommendedTextStyle
                
          ),
        ],
      ),
    ),
  );
}
