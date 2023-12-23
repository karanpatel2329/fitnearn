import 'package:fitnearn/core/constant/colors.dart';
import 'package:fitnearn/core/constant/text_style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'My Profile',
          style: TextStyle(
            color: Color(0xFF5271EF),
            fontSize: 18,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
              padding: EdgeInsets.symmetric(
                  vertical: Adaptive.px(3), horizontal: Adaptive.px(10)),
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius:
                      BorderRadius.all(Radius.circular(Adaptive.px(24))),
                  border: Border.all(color: AppColor.primaryColor)),
              child: Row(
                children: [
                  Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 16,
                  ),
                  Text(
                    " Edit",
                    style: AppTextStyle.labelText
                        .copyWith(fontSize: 14, color: Colors.white),
                  ),
                ],
              )),
          SizedBox(
            width: 12,
          ),
        ],
      ),
      body: Container(
        width: 100.w,
        height: 100.h,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Stack(
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: Adaptive.px(25),
                          child: Icon(Icons.person),
                        ),
                      ),
                      Positioned(
                          right: 0,
                          bottom: 5,
                          child: Icon(
                            Icons.add_circle,
                            size: 12,
                          )),
                    ],
                  )),
            ),
            Text(
              'General Details',
              style: TextStyle(
                color: Color(0xFF5271EF),
                fontSize: 18,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            SizedBox(
              height: Adaptive.px(16),
            ),
            Text(
              'Full Name',
              style: AppTextStyle.inputLable,
            ),
            SizedBox(
              height: Adaptive.px(6),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter Full Name',
                contentPadding: EdgeInsets.symmetric(
                    vertical: 0, horizontal: Adaptive.px(20)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Adaptive.px(13)),
                    borderSide: BorderSide(
                        color: AppColor.primaryText.withOpacity(0.15))),
              ),
            ),
            SizedBox(
              height: Adaptive.px(6),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'D.O.B.',
                      style: AppTextStyle.inputLable,
                    ),
                    SizedBox(
                      height: Adaptive.px(6),
                    ),
                    Container(
                        width: 45.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(Adaptive.px(13))),
                            border: Border.all(
                                color: AppColor.primaryText.withOpacity(0.45))),
                        padding: EdgeInsets.symmetric(
                            horizontal: Adaptive.px(20),
                            vertical: Adaptive.px(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Enter D.O.B.",
                            ),
                            InkWell(
                                onTap: () async {
                                  DateTime? date = await showDatePicker(
                                    context: context,
                                    firstDate: DateTime(1980),
                                    lastDate: DateTime.now(),
                                  );
                                },
                                child: Icon(
                                  Icons.calendar_month,
                                  color: AppColor.primaryColor,
                                ))
                          ],
                        )),
                  ],
                ),
                SizedBox(
                  width: Adaptive.px(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gender',
                      style: AppTextStyle.inputLable,
                    ),
                    SizedBox(
                      height: Adaptive.px(6),
                    ),
                    Container(
                      width: 40.w,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(Adaptive.px(13))),
                          border: Border.all(
                              color: AppColor.primaryText.withOpacity(0.45))),
                      padding: EdgeInsets.symmetric(horizontal: Adaptive.px(20)),
                      child: DropdownButton(
                          value: 'male',
                          dropdownColor: Colors.white,
          
                          // hint: Text("Select Gender"),
                          underline: SizedBox(),
                          isExpanded: true,
                          items: [
                            DropdownMenuItem(value: 'male', child: Text('Male')),
                            DropdownMenuItem(
                                value: 'female', child: Text('Female'))
                          ],
                          onChanged: (v) {}),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: Adaptive.px(6),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Age',
                      style: AppTextStyle.inputLable,
                    ),
                    SizedBox(
                      height: Adaptive.px(6),
                    ),
                    Container(
                      width: 45.w,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter Age',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: Adaptive.px(20)),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(Adaptive.px(13)),
                              borderSide: BorderSide(
                                  color: AppColor.primaryText.withOpacity(0.15))),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: Adaptive.px(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'City',
                      style: AppTextStyle.inputLable,
                    ),
                    SizedBox(
                      height: Adaptive.px(6),
                    ),
                    Container(
                      width: 40.w,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter City',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: Adaptive.px(20)),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(Adaptive.px(13)),
                              borderSide: BorderSide(
                                  color: AppColor.primaryText.withOpacity(0.15))),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: Adaptive.px(6),
            ),
            Text(
              'Address',
              style: AppTextStyle.inputLable,
            ),
            SizedBox(
              height: Adaptive.px(6),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter address',
                contentPadding: EdgeInsets.symmetric(
                    vertical: 0, horizontal: Adaptive.px(20)),
                suffixIcon: Icon(
                  Icons.share_location_sharp,
                  color: AppColor.primaryColor,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Adaptive.px(13)),
                    borderSide: BorderSide(
                        color: AppColor.primaryText.withOpacity(0.15))),
              ),
            ),
            SizedBox(
              height: Adaptive.px(6),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'State',
                      style: AppTextStyle.inputLable,
                    ),
                    SizedBox(
                      height: Adaptive.px(6),
                    ),
                    Container(
                      width: 45.w,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter State',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: Adaptive.px(20)),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(Adaptive.px(13)),
                              borderSide: BorderSide(
                                  color: AppColor.primaryText.withOpacity(0.15))),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: Adaptive.px(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pincode',
                      style: AppTextStyle.inputLable,
                    ),
                    SizedBox(
                      height: Adaptive.px(6),
                    ),
                    Container(
                      width: 40.w,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter Pincode',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: Adaptive.px(20)),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(Adaptive.px(13)),
                              borderSide: BorderSide(
                                  color: AppColor.primaryText.withOpacity(0.15))),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20,),
            Text(
              'Contact Details',
              style: TextStyle(
                color: Color(0xFF5271EF),
                fontSize: 18,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            SizedBox(
              height: Adaptive.px(16),
            ),
            Text(
                      'Mobile Number',
                      style: AppTextStyle.inputLable,
                    ),
                     SizedBox(
                  height: Adaptive.px(6),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter Mobile Number',
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 0, horizontal: Adaptive.px(20)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Adaptive.px(13)),
                        borderSide: BorderSide(
                            color: AppColor.primaryText.withOpacity(0.15))),
                  ),
                ),
                SizedBox(height: 6,),
                Text(
                      'E-mail Address',
                      style: AppTextStyle.inputLable,
                    ),
                     SizedBox(height: 6,),
                     TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter E-mail address',
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 0, horizontal: Adaptive.px(20)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Adaptive.px(13)),
                        borderSide: BorderSide(
                            color: AppColor.primaryText.withOpacity(0.15))),
                  ),
                ),
                SizedBox(
              height: Adaptive.px(16),
            ),
                     Center(
                child: InkWell(
                  onTap: (){
                    // Get.to(HomeScreen());
                  },
                  child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Adaptive.px(20), vertical: Adaptive.px(8)),
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
                            Icon(Icons.save,color: Colors.white,),
                            SizedBox(width: 10,),
                            Text("Save Changes",style: AppTextStyle.interText.copyWith(color: Colors.white,fontSize: Adaptive.px(16),fontWeight: FontWeight.w600),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

               SizedBox(
              height: Adaptive.px(16),
            ),
              

          
          ]),
        ),
      ),
    );
  }
}
