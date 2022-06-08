import 'package:events_app/constants/palette.dart';
import 'package:events_app/data/data.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Palette.kPrimaryColor,
      body: Column(
        children: [
          Container(
            height: 250.0,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(90.0),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/slider.png'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(top: 20.0, bottom: 90.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(category.imageUrl),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 30.0,
                        width: double.infinity,
                        color: Colors.black.withOpacity(0.5),
                        child: Text(
                          category.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0.0,
                        child: Container(
                          width: 70.0,
                          height: 3.0,
                          color: const Color(0xFFF31D73),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: categories.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
