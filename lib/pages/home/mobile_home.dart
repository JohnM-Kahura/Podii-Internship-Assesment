import 'package:flutter/material.dart';
import 'package:order_in/pages/details_page.dart';
import 'package:order_in/widgets/c_textfeild.dart';
import 'package:order_in/widgets/featured_item.dart';
import 'package:order_in/widgets/menu_icon.dart';
import 'package:order_in/widgets/recommended_item.dart';

import '../../constants/styles.dart';
class MobileHomePage extends StatelessWidget {
  const MobileHomePage({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          //TODO: open drawer
          onTap: () => null,
          child: const CustomMenuIcon(),
        ),
        actions: [
          CircleAvatar(
            radius: 16.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('assets/person.png'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'SEARCH FOR',
            style: headingStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'RECIPES ',
              style: headingStyle,
            ),
          ),
          const SizedBox(height: 5),
          const SizedBox(height: 10),
          customTextFeild(50, MediaQuery.of(context).size.width, 'Search',
              searchController, context),
          const SizedBox(height: 20),
          Text(
            'Recommended',
            style: headingStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Details(
                              image: 'assets/burger.png',
                              itemName: 'Humburger',
                              itemPrice: 'Ksh 100',
                            )));
                  },
                  child: recommededItem('assets/burger.png', 'Humburger',
                      'Ksh 100', const Color.fromARGB(255, 147, 210, 238)),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Details(
                              image: 'assets/doughnut.png',
                              itemName: 'Doughnut',
                              itemPrice: 'Ksh 150',
                            )));
                  },
                  child: recommededItem('assets/doughnut.png', 'Doughnut',
                      'Ksh 150', const Color.fromARGB(255, 238, 164, 147)),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Details(
                              image: 'assets/hotdog.png',
                              itemName: 'Hot Dog',
                              itemPrice: 'Ksh 300',
                            )));
                  },
                  child: recommededItem('assets/hotdog.png', 'Hot Dog',
                      'Ksh 300', Color.fromARGB(255, 158, 147, 238)),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Details(
                              image: 'assets/fries.png',
                              itemName: 'Fries',
                              itemPrice: 'Ksh 200',
                            )));
                  },
                  child: recommededItem('assets/fries.png', 'Fries',
                      'Ksh 200', const Color.fromARGB(255, 168, 238, 147)),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 12.0, bottom: 12, left: 8),
                  child: Text(
                    'FEATURED',
                    style: headingStyle2,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 12.0, bottom: 12, left: 8),
                  child: Text(
                    'COMBOS',
                    style: disabledheadingStyle,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 12.0, bottom: 12, left: 8),
                  child: Text('FAVOURITES', style: disabledheadingStyle),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 12.0, bottom: 12, left: 8),
                  child: Text(
                    'RECOMMENDED',
                    style: disabledheadingStyle,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 12.0, bottom: 12, left: 8),
                  child: Text(
                    'WEEKLY OFFERS',
                    style: disabledheadingStyle,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Details(
                        image: 'assets/burger.png',
                        itemName: 'Humburger',
                        itemPrice: 'Ksh 100',
                      )));
            },
            child: featuredItem('assets/burger.png', 'Delicious Burgers',
                'Ksh 100', 'Ksh 150', 4),
          ),
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Details(
                          image: 'assets/pizza.png',
                          itemName: 'Pizza Slice',
                          itemPrice: 'Ksh 300',
                        )));
              },
              child: featuredItem('assets/pizza.png', 'Pizza Slice',
                  'Ksh 300', 'Ksh 450', 5)),
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Details(
                          image: 'assets/pop_con.png',
                          itemName: 'Pop Corn',
                          itemPrice: 'Ksh 100',
                        )));
              },
              child: featuredItem(
                  'assets/pop_con.png', 'Pop Corn', 'Ksh 50', 'Ksh 100', 3)),
        ]),
      ),
    );
  }
}