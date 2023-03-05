import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:ru_app/constants.dart';
import 'package:ru_app/news/news_carousel_slider.dart';

class NoCardapio extends StatelessWidget {
  final String msg;
  final Color? color;
  final Color? textColor;

  const NoCardapio({
    Key? key,
    required this.msg,
    this.color,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: color,
      child: Column(
        children: [
          const NewsCarouselSlider(),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Card(
                  elevation: 2,
                  color: color,
                  shadowColor: kSecondaryColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: AnimatedTextKit(
                        repeatForever: true,
                        pause: const Duration(milliseconds: 5000),
                        animatedTexts: [
                          TypewriterAnimatedText(
                            msg,
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                        // child: Text(

                        //   textAlign: TextAlign.center,
                        //   style: const TextStyle(
                        //     fontSize: 20,
                        //     fontWeight: FontWeight.w500,
                        //   ),
                        // ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
