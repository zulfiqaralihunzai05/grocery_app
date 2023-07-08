import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/view/home/components/carousel_slider/banner_card.dart';

class CarouseSliderView extends StatefulWidget {
  final List bannerList;

  const CarouseSliderView({
    Key? key,
    required this.bannerList,
  }) : super(key: key);

  @override
  State<CarouseSliderView> createState() => _CarouseSliderViewState();
}

class _CarouseSliderViewState extends State<CarouseSliderView> {
  int _currentIndex = 0;
  late List<Widget> _bannerList;

  @override
  void initState() {
    _bannerList =
        widget.bannerList.map((e) =>
            BannerCard(imagesUrl: e.image)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: _bannerList,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.bannerList.map((e) {
            int index = widget.bannerList.indexOf(e);
            return Container(
              width: 8,
              height: 8,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ?Color.fromRGBO(0, 0, 0, 1)
                        :Color.fromRGBO(0, 0, 0, 0.5)


              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
