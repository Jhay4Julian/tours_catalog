import 'package:flutter/material.dart';

import 'custom_button.dart';
import 'read_more_text.dart';

class TourCard extends StatelessWidget {
  final String image;
  final String tourTitle;
  final String details;
  final String price;

  const TourCard({
    super.key,
    required this.image,
    required this.tourTitle,
    required this.details,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              // tour image
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // tour price
              Positioned(
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 6,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xFF10b981),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                    ),
                  ),
                  child: Text(
                    price,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Text(
              tourTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          ReadMoreText(text: details),
          CustomButton(
            buttonTitle: 'Not Interested',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
