import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:ru_app/data/ru_data.dart';

class NewsCarouselSlider extends StatelessWidget {
  const NewsCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final listOfImages = Provider.of<Data>(context, listen: true).listOfNews;
    return Center(
      child: CarouselSlider.builder(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height / 5,
          autoPlay: true,
          enlargeCenterPage: true,
          animateToClosest: true,
        ),
        itemCount: listOfImages.length,
        itemBuilder: (context, index, realIndex) {
          final listOfNoticias = listOfImages[index];
          final isImage = listOfImages[index]['isImage'];
          return Card(
            color: !isImage ? Color(listOfNoticias['textColor']) : Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 2),
            elevation: 3,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: isImage
                  ? const EdgeInsets.all(0.0)
                  : const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: isImage
                      ? CachedNetworkImage(
                          imageUrl: listOfNoticias['imageUrl'],
                          fit: BoxFit.cover,
                        )
                      : Column(
                          children: [
                            Text(
                              listOfNoticias['title'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Flexible(
                              child: Text(
                                listOfNoticias['msg'],
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
