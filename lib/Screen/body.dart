import 'package:flutter/material.dart';
import 'package:food/Screen/image_slider.dart';
import 'package:food/Screen/search_box.dart';

import 'category_list.dart';

class Body extends StatefulWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        SearchBox(),
        ImageSlider(),
        CategoryList()
      ],),
    );
  }
}