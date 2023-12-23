import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitnearn/core/constant/colors.dart';
import 'package:fitnearn/core/constant/image_path.dart';
import 'package:fitnearn/core/constant/text_style.dart';
import 'package:fitnearn/features/auth/controller/auth_controller.dart';
import 'package:fitnearn/features/home/view/widgets/carousel_card.dart';
import 'package:fitnearn/features/profile/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Row(
          children: [
            SizedBox(
              width: Adaptive.px(8),
            ),
            InkWell(
              onTap:(){
                _scaffoldKey.currentState?.openDrawer();
              },
                child: Container(
              width: Adaptive.px(30),
              height: Adaptive.px(30),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 2,
                    offset: Offset(1, 1),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x3FE2E2E2),
                    blurRadius: 1,
                    offset: Offset(-1, -1),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(Adaptive.px(4.0)),
                child: SvgPicture.asset(
                  ImagePath.humburgerIcon,
                ),
              ),
            )),
          ],
        ),
        title: Text(
          "MentorX",
          style: AppTextStyle.titleText,
        ),
        centerTitle: true,
        actions: [
          InkWell(
              child: Container(
            width: Adaptive.px(30),
            height: Adaptive.px(30),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              shadows: const [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 2,
                  offset: Offset(1, 1),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Color(0x3FE2E2E2),
                  blurRadius: 1,
                  offset: Offset(-1, -1),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(Adaptive.px(4.0)),
              child: Icon(
                Icons.notifications,
                color: AppColor.primaryColor,
              ),
            ),
          )),
          SizedBox(
            width: Adaptive.px(8),
          )
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
          backgroundColor: Colors.white,
          child: Column(children: [
              SizedBox(
                height: Adaptive.px(12),
              ),
         Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: Adaptive.px(20),
                child: Icon(Icons.person),
              ),
              SizedBox(
                width: Adaptive.px(12),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
          'Hi, Malina',
          style: TextStyle(
            color: Color(0xFF121212),
            fontSize: 14,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
                 Text(
          '7588415654',
          style: TextStyle(
            color: Color(0xFF121212),
            fontSize: 10,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w500,
            height: 0,
          ),),
                ],
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          SizedBox(
            width: 100,
            child: LinearProgressIndicator(
              value: 0.6,
              minHeight: 12,
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: AppColor.primaryColor,
            ),
          ),
          SizedBox(
            height:6,
          ),
           Text(
          'Your profile is 40% Completed',
          style: TextStyle(
            color: Colors.black,
            fontSize: 10,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
         SizedBox(
            height:6,
          ),
        InkWell(
          onTap: (){
            Get.to(ProfileScreen());
          },
          child: Text(
            'View / Edit Profile',
            style: TextStyle(
              color: Color(0xFF5271EF),
              fontSize: 12,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
        ),
 SizedBox(
            height:12,
          ),
       
        
        
        MenuItem(icon: Icons.computer_outlined,name: 'My Courses',),
        MenuItem(icon: Icons.calendar_view_day_outlined,name: 'My Certificates',),
        MenuItem(icon: Icons.bookmark,name: 'Saved',),
        MenuItem(icon: Icons.help,name: 'Help',),
        MenuItem(icon: Icons.people,name: 'About Us',),
        MenuItem(icon: Icons.post_add_outlined,name: 'T & C',),
        MenuItem(icon: Icons.settings,name: 'Settings',),
        Spacer(),
        Center(
                child: InkWell(
                  onTap: (){
                    authController.logout();
                    // Get.to(HomeSc
                  },
                  child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Adaptive.px(42), vertical: Adaptive.px(8)),
                        decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(Adaptive.px(30))),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ]),
                        child: Row(
                         
                          children: [
                            Icon(Icons.logout,color: Colors.white,),
                            SizedBox(width: 10,),
                            Text("Logout",style: AppTextStyle.interText.copyWith(color: Colors.white,fontSize: Adaptive.px(20),fontWeight: FontWeight.w600),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30,)
         
          ]),
        ),
      ),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: Adaptive.px(20),
              child: Icon(Icons.person),
            ),
            SizedBox(
              width: Adaptive.px(12),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi, Malina",
                  style: AppTextStyle.labelText.copyWith(fontSize: 20),
                ),
                Text(
                  "Good Morning",
                  style: AppTextStyle.labelText
                      .copyWith(fontSize: 11, fontWeight: FontWeight.w600),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: Adaptive.px(30),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Adaptive.px(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Upcoming Events",
                style: AppTextStyle.labelText.copyWith(fontSize: 16),
              ),
              Container(
                  padding: EdgeInsets.symmetric(
                      vertical: Adaptive.px(6), horizontal: Adaptive.px(18)),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(Adaptive.px(24))),
                      border: Border.all(color: AppColor.primaryColor)),
                  child: Text(
                    "View All",
                    style: AppTextStyle.labelText.copyWith(fontSize: 14),
                  ))
            ],
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 230.0,
            enlargeCenterPage: false,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 1,
          ),
          items: [
            CarouselCard(heading:  'Technology Webinar',title:  'INNOVATIVE IDEAS FROM\nENTREPRENEURS',des:  'Lorem ipsum Lorem ipsum Lorem ipsum ',),
            CarouselCard(heading:  'Flutter Webinar',title:  'EXPLORE FLUTTER WITH RIVERPOD STATEMANAGEMENT',des:  'Lorem ipsum Lorem ipsum Lorem ipsum ',),
            CarouselCard(heading:  'MERN Webinar',title:  'LEARN ABOUT MONGODB EXPRESSJS REACT AND NODEJS',des:  'Lorem ipsum Lorem ipsum Lorem ipsum ',),
            
            // Add more items as needed
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Adaptive.px(20,),
            vertical:Adaptive.px(10,), 
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Campus Updates",
                style: AppTextStyle.labelText.copyWith(fontSize: 16),
              ),
              Container(
                  padding: EdgeInsets.symmetric(
                      vertical: Adaptive.px(6), horizontal: Adaptive.px(18)),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(Adaptive.px(24))),
                      border: Border.all(color: AppColor.primaryColor)),
                  child: Text(
                    "View All",
                    style: AppTextStyle.labelText.copyWith(fontSize: 14),
                  ))
            ],
          ),
        ),
        Container(
          height: 170,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
           CampusCard(),
           CampusCard(),
           CampusCard(),
 ],
          ),
        )
      ]),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.icon,
    required this.name
  });
  final IconData icon;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 70.w,
          child: Divider(
           thickness: 0.9, 
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:25.0,vertical: 10),
          child: Row(children: [
            Icon(icon,color: AppColor.primaryColor,),
            SizedBox(width: 10,),
             Text(
            name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          ],),
        ),
      ],
    );
  }
}

class CampusCard extends StatelessWidget {
  const CampusCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w-20,
      height: 150,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(left: 10),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
     width: 30.w,
     height: 133,
     clipBehavior: Clip.antiAlias,
     decoration: BoxDecoration(
       image: DecorationImage(image:  NetworkImage("https://via.placeholder.com/70x93",),fit: BoxFit.cover),
       color: Color(0xFF121212),
       borderRadius: BorderRadius.circular(14),
     ),
    ),
              SizedBox(width: 10),
              SizedBox(
     width: 45.w,
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(
           'Convocation Day\nVideo',
           style: TextStyle(
             color: Color(0xAF121212),
             fontSize: 19,
             fontFamily: 'Nunito',
             fontWeight: FontWeight.w700,
             height: 0,
           ),
         ),
         SizedBox(height: 5),
         Text(
           'Block A - Auditorium 2nd Floor',
           style: TextStyle(
             color: Color(0xAF121212),
             fontSize: 9,
             fontFamily: 'Nunito',
             fontWeight: FontWeight.w600,
             height: 0,
           ),
         ),
         
          Text(
             'lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum',
             style: TextStyle(
     color: Color(0xFF848484),
     fontSize: 9,
     fontFamily: 'Nunito',
     fontWeight: FontWeight.w600,
     height: 0,
             ),
           ),
         SizedBox(height: 5),
         Text(
           '20 Aug 2023',
           style: TextStyle(
             color: Color(0x7F121212),
             fontSize: 6,
             fontFamily: 'Nunito',
             fontWeight: FontWeight.w600,
             height: 0,
           ),
         ),
         SizedBox(height: 5),
         Text(
           '12:45pm',
           style: TextStyle(
             color: Color(0x7F121212),
             fontSize: 6,
             fontFamily: 'Nunito',
             fontWeight: FontWeight.w600,
             height: 0,
           ),
         ),
       ],
     ),
              ),
            ],
          ),
        
        ],
      ),
    );
  }
}

