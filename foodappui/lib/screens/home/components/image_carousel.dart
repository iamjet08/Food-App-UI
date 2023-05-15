import 'package:flutter/material.dart';
import 'package:food_ui_kit/constants.dart';
import 'package:food_ui_kit/demoData.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // I'm using customScrollView for better scrollview
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            //let's change the bg
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Column(
              children: [
                Text(
                  "Delivery to".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: kActiveColor),
                ),
                Text(
                  "San Francisco",
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {},
                  child: Text("Filter", style: TextStyle(color: Colors.black)))
            ],
          ),
          // We can't use all widget directly here.
          SliverToBoxAdapter(
            child: ImageCarousel(),
          ),
        ],
      ),
    );
  }
}

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({
    Key? key,
  }) : super(key: key);

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.81,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
              itemCount: demoBigImages.length,
              onPageChanged: ((value) {
                setState(() {
                  _currentPage = value;
                });
              }),
              // Here the images already rounded
              // But all images may not the same
              // Let's add rounded shape
              itemBuilder: (context, index) => ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: Image.asset(
                      demoBigImages[index],
                    ),
                  )),
          Positioned(
            bottom: defaultPadding,
            right: defaultPadding,
            child: Row(
              children: List.generate(
                demoBigImages.length,
                (index) => Padding(
                    padding: const EdgeInsets.only(left: defaultPadding / 4),
                    child: IndicatorDot(isActive: index == _currentPage)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class IndicatorDot extends StatelessWidget {
  const IndicatorDot({
    Key? key,
    required this.isActive,
  }) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 8,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.white38,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}
