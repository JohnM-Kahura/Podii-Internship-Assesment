import 'package:flutter/material.dart';
import 'package:order_in/helpers/responsive_helper.dart';

class CustomMenuIcon extends StatelessWidget {
  const CustomMenuIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: Container(
        margin: const EdgeInsets.only(top: 15, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              height: 3,
              width: 22,
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              height: 3,
              width: 15,
            ),
          ],
        ),
      ),
      tablet: Container(
        margin: const EdgeInsets.only(top: 30, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
              height: 6,
              width: 40,
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              height: 6,
              width: 30,
            ),
          ],
        ),
      ),
    );
  }
}
