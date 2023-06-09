import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';
import 'package:order_in/helpers/responsive_helper.dart';
import 'package:order_in/widgets/c_textfeild.dart';
import 'package:order_in/widgets/details_featured_item.dart';

import '../constants/styles.dart';
import '../widgets/menu_icon.dart';

class Details extends StatefulWidget {
  final String image;
  final String itemPrice;
  final String itemName;
  const Details(
      {super.key,
      required this.image,
      required this.itemPrice,
      required this.itemName});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final int numberOfItems=1;
  int getPrice(String itemPrice){
    List itemPriceList=itemPrice.split(' ');
    return int.parse(itemPriceList[1]);
  }
  TextEditingController controller =TextEditingController();
 int _itemPrice=0;
 int itemNumber=1;
 Future<void> startTransaction(double amount ,String phoneNumber) async{
  dynamic transactionInitialisation;
 
  try {
phoneNumber=phoneNumber.substring(1);
phoneNumber='254$phoneNumber';
print(phoneNumber);
  transactionInitialisation =
          await MpesaFlutterPlugin.initializeMpesaSTKPush(
                  businessShortCode: '174379',
                  transactionType:TransactionType.CustomerPayBillOnline,
                  amount: amount,
                  partyA:phoneNumber ,
                  partyB: '174379',
                  callBackURL:Uri(scheme: "https", host : "my-app.herokuapp.com", path: "/callback"),
                  accountReference: 'Order In',
                  phoneNumber: phoneNumber,
                  baseUri:Uri(scheme: "https", host: "sandbox.safaricom.co.ke"),
                  transactionDesc: 'Stay dangerous!',
                  passKey: 'bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919'
                  
                  )
                  
                  ;
                  
  
  HashMap result =transactionInitialisation as HashMap<String ,dynamic>;
 print(transactionInitialisation.toString());
 print('done');


  } catch (e) {
  //you can implement your exception handling here.
  //Network unreachability is a sure exception.
  print(e.toString());

  }
}


@override
  void initState() {
setState(() {
  _itemPrice=getPrice(widget.itemPrice);
});
    super.initState();
  }

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
      body: ResponsiveWidget(
          mobile: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'SUPER',
                    style: headingStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.itemName,
                    style: headingStyle,
                  ),
                ),
                SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Image.asset(
                        widget.image,
                        fit: BoxFit.contain,
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.favorite_outline,
                            size: 30,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 40,
                        bottom: 40,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.turn_right,
                            size: 30,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Ksh ${_itemPrice.toString()}",
                            style: GoogleFonts.lato(
                                color: Colors.grey, fontSize: 20)),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children:  [
                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        _itemPrice=_itemPrice-getPrice(widget.itemPrice);
                                        itemNumber=itemNumber-1;
                                      });
                                    },
                                    child:const  Text(
                                      '-',
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text('$itemNumber',
                                      style: const TextStyle(
                                          fontSize: 10,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold)),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                      _itemPrice=_itemPrice + getPrice(widget.itemPrice);
                                       itemNumber=itemNumber+1; 
                                      });
                                    },
                                    child:const  Text('+',
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        width: 500,

        child: AlertDialog(
          title: Text("Pay Ksh $_itemPrice ",style: headingStyle,),
          content: customTextFeild(50, MediaQuery.of(context).size.width/5, 'Phone', controller, context),
          actions: [
           Center(
         child: TextButton(
         
           style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
           
          onPressed: ()async{
           
           await startTransaction(_itemPrice.toDouble(), controller.text);
           Navigator.of(context).pop();
          }, child:const Text('Pay With M-PESA',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
           )
          ],
        ),
      );
    },
  );
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(left: 18.0, right: 5),
                                child: Text(
                                  'Buy',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 10),
                  child: Text(
                    'FEATURED',
                    style: headingStyle2,
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const Details(
                                            image: 'assets/pop_con.png',
                                            itemName: 'Pop Corn',
                                            itemPrice: 'Ksh 100',
                                          )));
                                },
                                child: detailsFeaturedItem('assets/pop_con.png',
                                    'Pop Corn', 'Ksh 100')),
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const Details(
                                            image: 'assets/pizza.png',
                                            itemName: 'Pizza',
                                            itemPrice: 'Ksh 800',
                                          )));
                                },
                                child: detailsFeaturedItem(
                                    'assets/pizza.png', 'Pizza', 'Ksh 800')),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const Details(
                                            image: 'assets/burger.png',
                                            itemName: 'Burger',
                                            itemPrice: 'Ksh 150',
                                          )));
                                },
                                child: detailsFeaturedItem(
                                    'assets/burger.png', 'Burger', 'Ksh 150')),
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const Details(
                                            image: 'assets/doughbut.png',
                                            itemName: 'Doughnut',
                                            itemPrice: 'Ksh 50',
                                          )));
                                },
                                child: detailsFeaturedItem(
                                    'assets/doughnut.png',
                                    'Doughnut',
                                    'Ksh 50')),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          tablet: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'SUPER',
                    style: headingStyleTab,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.itemName,
                    style: headingStyleTab,
                  ),
                ),
                SizedBox(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Image.asset(
                        widget.image,
                        fit: BoxFit.contain,
                      ),
                      Positioned(
                        right: 60,
                        top: 60,
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.favorite_outline,
                            size: 60,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 60,
                        bottom: 60,
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.turn_right,
                            size: 60,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(widget.itemPrice,
                            style: GoogleFonts.lato(
                                color: Colors.grey, fontSize: 40)),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              width: 200,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    '-',
                                    style: TextStyle(
                                        fontSize: 50,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('3',
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold)),
                                  Text('+',
                                      style: TextStyle(
                                          fontSize: 50,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 18.0, right: 5),
                              child: Text(
                                'Add to cart',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0, bottom: 20),
                  child: Text(
                    'FEATURED',
                    style: headingStyle2Tab,
                  ),
                ),
                SizedBox(
                  height: 600,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const Details(
                                            image: 'assets/pop_con.png',
                                            itemName: 'Pop Corn',
                                            itemPrice: 'Ksh 100',
                                          )));
                                },
                                child: detailsFeaturedItem('assets/pop_con.png',
                                    'Pop Corn', 'Ksh 100')),
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const Details(
                                            image: 'assets/pizza.png',
                                            itemName: 'Pizza',
                                            itemPrice: 'Ksh 800',
                                          )));
                                },
                                child: detailsFeaturedItem(
                                    'assets/pizza.png', 'Pizza', 'Ksh 800')),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const Details(
                                            image: 'assets/burger.png',
                                            itemName: 'Burger',
                                            itemPrice: 'Ksh 150',
                                          )));
                                },
                                child: detailsFeaturedItem(
                                    'assets/burger.png', 'Burger', 'Ksh 150')),
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const Details(
                                            image: 'assets/doughbut.png',
                                            itemName: 'Doughnut',
                                            itemPrice: 'Ksh 50',
                                          )));
                                },
                                child: detailsFeaturedItem(
                                    'assets/doughnut.png',
                                    'Doughnut',
                                    'Ksh 50')),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
