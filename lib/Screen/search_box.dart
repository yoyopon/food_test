import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({ Key? key }) : super(key: key);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
      border: Border.all(color: Colors.grey)),
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 3),
      child: TextField(
        onChanged: (val){},
        decoration: InputDecoration(
          border: InputBorder.none,
          //icon: SvgPicture.asset("asset/icons/search.svg"),
          hintText: "Search Here"
        ),
      ),
    );
  }
}