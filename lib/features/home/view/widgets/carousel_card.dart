import 'package:fitnearn/core/constant/image_path.dart';
import 'package:fitnearn/core/constant/text_style.dart';
import 'package:flutter/material.dart';

class CarouselCard extends StatelessWidget {
  const CarouselCard({
    super.key,
    required this.des,
    required this.title,
    required this.heading,
  });

  final String heading;
  final String title;
  final String des;

  // Define common styles
  

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: ShapeDecoration(
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFF00245B), Color(0x7F00255B)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            shadows: [
              const BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Stack(
            children: [
              Positioned(bottom: 0, right: 0, child: Image.asset(ImagePath.rocketPng)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFC9E3F6),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    ),
                    child: Text(
                      heading,
                      style:AppTextStyle. headingStyle,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    title,
                    style: AppTextStyle. titleStyle,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    des,
                    style: AppTextStyle. descriptionStyle,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      // Icons and Date
                      Container(
                        width: 31,
                        height: 37,
                        decoration: ShapeDecoration(
                          image: const DecorationImage(
                            image: NetworkImage("https://via.placeholder.com/31x37"),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        width: 31,
                        height: 37,
                        decoration: ShapeDecoration(
                          image: const DecorationImage(
                            image: NetworkImage("https://via.placeholder.com/31x37"),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        width: 31,
                        height: 37,
                        decoration: ShapeDecoration(
                          image: const DecorationImage(
                            image: NetworkImage("https://via.placeholder.com/31x37"),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Event Information
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_month,
                                color: Colors.white,
                                size: 10,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '12 July , 5:30pm',
                                style: AppTextStyle. infoTextStyle,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 10,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Santos palce,Bangluru',
                                style: AppTextStyle. infoTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
