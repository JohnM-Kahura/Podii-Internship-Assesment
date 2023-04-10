import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../constants/styles.dart';

Widget featuredItem(
    String img, String title, String price, String initalPrice, double stars) {
  return LayoutBuilder(builder: (context, constraint) {
    return SizedBox(
      // color: Colors.red,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
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
                  borderRadius: BorderRadius.circular(
                      constraint.maxWidth < 760 ? 20.0 : 20),
                  child: Image.asset(
                    img,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: constraint.maxWidth < 760
                        ? headingStyle3
                        : headingStyle3Tab,
                  ),
                  RatingBar.builder(
                    initialRating: stars,
                    itemSize: constraint.maxWidth < 760 ? 10 : 30,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: stars.toInt(),
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  Row(
                    children: [
                      Text(
                        price,
                        style: constraint.maxWidth < 760
                            ? headingStyle2
                            : headingStyle2Tab,
                      ),
                      Text(
                        ' $initalPrice  ',
                        style: constraint.maxWidth < 760
                            ? headingStyle2
                            : headingStyle2LineThroughTab,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 224, 94, 84),
                  radius: constraint.maxWidth < 760 ? 25.0 : 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        constraint.maxWidth < 760 ? 20 : 40),
                    child: Icon(
                      Icons.add,
                      size: constraint.maxWidth < 760 ? 20 : 50,
                    ),
                  ),
                ),
              ),
            ),
          ]),
    );
  });
}
