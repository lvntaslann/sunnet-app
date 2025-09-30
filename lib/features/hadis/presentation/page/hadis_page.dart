import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sunnet_app/core/constants/hadis.dart';
import '../widgets/hadis_slide_item.dart';

class HadisPage extends StatelessWidget {
  const HadisPage({Key? key}) : super(key: key);

 Widget build(BuildContext context) {
    List<Widget> slides = List.generate(
      hadisModelData.length,
      (index) => HadisSlideItem(index: index),
    );

    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CarouselSlider(
        items: slides,
        options: CarouselOptions(
          viewportFraction: 1.0,
          scrollDirection: Axis.vertical,
          enlargeCenterPage: false,
          enableInfiniteScroll: true,
          autoPlay: false,
          padEnds: false,
          height: double.infinity,
        ),
      ),
    );
  }
}