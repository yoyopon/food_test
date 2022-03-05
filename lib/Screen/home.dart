import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/Screen/body.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: RichText(text: TextSpan(
       style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),
        children: [
          TextSpan(text: "Food",style: TextStyle(
            color: Colors.greenAccent
          )),
           TextSpan(text: "Order",style: TextStyle(
            color: Colors.green
          ))
        ]
      ),),
      actions: [
        IconButton(onPressed:(){} , icon: SvgPicture.asset("assets/icons/shopping_bag.svg"))
      ],),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.shop_sharp),label: "Cart"),
        BottomNavigationBarItem(icon: Icon(Icons.logout_sharp),label: "Logout"),
      ],),
      body: Body(),
    );
  }
}