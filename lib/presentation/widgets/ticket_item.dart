import 'package:flutter/material.dart';

class TicketItem extends StatelessWidget {
  const TicketItem({
    Key? key,
    required this.title,
    required this.date,
    required this.imageUrl,
    this.isSaved = false,
  }) : super(key: key);
  final String title;
  final String date;
  final String imageUrl;
  final bool isSaved;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 150.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: 5.0,
          top: 5.0,
          child: Container(
            width: 40.0,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Text(
              date,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        Positioned(
          right: 10.0,
          bottom: 10.0,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        if (isSaved)
          Positioned(
            top: -2.0,
            right: 20.0,
            child: Image.asset(
              'assets/images/saved.png',
              width: 20.0,
            ),
          ),
      ],
    );
  }
}
