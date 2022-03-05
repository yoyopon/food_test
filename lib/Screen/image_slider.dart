import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({ Key? key }) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(items: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage("assets/images/food4.jpg"))),)
    ], options: CarouselOptions(autoPlay: true,viewportFraction: 1));
  }
}