import 'package:flutter/material.dart';

class SubPage extends StatelessWidget {
  const SubPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    final containerWidth = screenWidth * 0.9;
    final containerHeight = screenHeight * 0.54;
    final titleFontSize = screenWidth * 0.08;
    final subTitleFontSize = screenWidth * 0.05;
    final featureFontSize = screenWidth * 0.06;
    final priceFontSize = screenWidth * 0.06;
    final priceNumberFontSize = screenWidth * 0.05;
    final buttonFontSize = screenWidth * 0.05;
    final renewalDateFontSize = screenWidth * 0.04;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.11),
                  Center(
                    child: Text(
                      "الاشتراكات",
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Center(
                    child: Container(
                      width: containerWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenWidth * 0.04),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.05, 0.05],
                          colors: [
                            Color.fromRGBO(42, 114, 173, 1),
                            Color.fromRGBO(249, 249, 250, 1),
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: containerHeight * 0.127),
                            child: Text(
                              "اشتراك اسبوعي",
                              style: TextStyle(
                                fontSize: titleFontSize,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: containerHeight * 0.064,
                              right: containerWidth * 0.06,
                              left: containerWidth * 0.084,
                              bottom: containerHeight * 0.032,
                            ),
                            child: Text(
                              "وصف خطة الاشتراك هنا والذي عادة ما يتكون من عدة اسطر وصف خطة الاشتراك هنا والذي عادة ما يتكون من عدة اسطر.",
                              style: TextStyle(
                                fontSize: subTitleFontSize,
                                color: const Color.fromRGBO(164, 172, 173, 1),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: containerWidth * 0.023),
                                  const Icon(
                                    Icons.check,
                                    color: Color.fromRGBO(255, 147, 47, 1),
                                    size: 30,
                                  ),
                                  SizedBox(width: containerWidth * 0.023),
                                  Text(
                                    "وصف ميزة هنا",
                                    style: TextStyle(fontSize: featureFontSize),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: containerWidth * 0.023),
                                  const Icon(
                                    Icons.check,
                                    color: Color.fromRGBO(255, 147, 47, 1),
                                    size: 30,
                                  ),
                                  SizedBox(width: containerWidth * 0.023),
                                  Text(
                                    "وصف ميزة هنا",
                                    style: TextStyle(fontSize: featureFontSize),
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.009),
                              Padding(
                                padding: EdgeInsets.only(left: containerWidth * 0.023),
                                child: Text(
                                  "2023 يناير تاريخ التجديد",
                                  style: TextStyle(
                                    fontSize: renewalDateFontSize,
                                    color: const Color.fromRGBO(196, 201, 201, 1),
                                  ),
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: containerWidth * 0.045,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "السعر",
                                      style: TextStyle(
                                        fontSize: priceFontSize,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "70 د.ل",
                                          style: TextStyle(
                                            fontSize: priceNumberFontSize,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: containerWidth * 0.023),
                                        Text(
                                          "70 د.ل",
                                          style: TextStyle(
                                            fontSize: priceNumberFontSize,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                            decoration: TextDecoration.lineThrough,
                                            decorationColor: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.028),
                              SizedBox(
                                width: containerWidth * 0.905,
                                height: containerHeight * 0.115,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: const Color.fromRGBO(229, 229, 229, 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "تجديد اشتراك",
                                    style: TextStyle(
                                      fontSize: buttonFontSize,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromRGBO(164, 172, 173, 1),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.05),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: screenHeight * 0.06,
              right: 0,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 28,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
