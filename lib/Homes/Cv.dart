import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../constants.dart';
import '../widget/student_data.dart';
import '../widget/widget_support.dart';
class Details1 extends StatefulWidget {
  final String name, image,nationality ,religion,gender,age,figtht ,talls,experience ,language ,maritalstatus,breth;
  Details1({required
  this.name,
    required this.religion,
    required this.breth,
    required this.talls,
    required this.language,
    required this.maritalstatus,
    required this.experience,
    required this.figtht,
    required this.gender,
    required this.age,
    required this.image,
    required this.nationality
  });
  @override
  State<Details1> createState() => _DetailsState();
}
class _DetailsState extends State<Details1> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Color(0xFF373866),
            )),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: Text(
                "السيرة الذاتية",
                style:AppWidget.TitlePap(),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            width: 100.w,
            height: 30.h,
            padding: EdgeInsets.only(right: 10.0,left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StudentName(
                          studentName: widget.name,
                        ),
                        kHalfSizedBox,
                        StudentClass(
                            studentClass: 'عاملة مقيمة منزلية'),
                        kHalfSizedBox,
                        StudentYear(studentYear: widget.gender),
                      ],
                    ),
                    kHalfSizedBox,
                    Container(
                      width: SizerUtil.deviceType == DeviceType.tablet ? 24.w : 28.w,
                      height: SizerUtil.deviceType == DeviceType.tablet ? 24.w : 28.w,
                      decoration: BoxDecoration(
                        color: kSecondaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.network(
                          widget.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StudentDataCard(
                      title: 'الديانة',
                      value:widget.religion,
                    ),
                    StudentDataCard(
                      title: 'العمر',
                      value: widget.age,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFEEE7EA),
              ),
              width: 100.w,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(kDefaultPadding),
                child: Container(
                  margin: EdgeInsets.only(bottom: kDefaultPadding),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(kDefaultPadding),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(kDefaultPadding),
                            bottom:  Radius.circular(kDefaultPadding),
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: kTextLightColor,
                              blurRadius: 2.0,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [

                            SizedBox(
                              height: 5.0,
                            ),
                          Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(widget.nationality, style: AppWidget.semiBoldTextFeildStyle122()
                            ),
                            Text(
                              "الجنسية",
                              style: AppWidget.semiBoldTextFeildStyle121()
                            ),
                          ],
                        ),
                            Divider(
                              thickness: 1.0,
                            ),
                            SizedBox(
                              height: 18.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(widget.experience, style: AppWidget.semiBoldTextFeildStyle122()),

                                Text(
                                  "الخبرة",
                                  style: AppWidget.semiBoldTextFeildStyle121()
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 1.0,
                            ),
                            SizedBox(
                              height: 18.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(widget.language, style: AppWidget.semiBoldTextFeildStyle122()),

                                Text(
                                  "اللغة",
                                  style: AppWidget.semiBoldTextFeildStyle121()
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 1.0,
                            ),
                            SizedBox(
                              height: 18.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(widget.maritalstatus, style: AppWidget.semiBoldTextFeildStyle122()),

                                Text(
                                  "الحالة الاجتماعية",
                                  style:AppWidget.semiBoldTextFeildStyle121()
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 1.0,
                            ),
                            SizedBox(
                              height: 18.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(widget.figtht, style:AppWidget.semiBoldTextFeildStyle122()),
                                Text(
                                  "الوزن",
                                  style: AppWidget.semiBoldTextFeildStyle122()),
                              ],
                            ),
                            Divider(
                              thickness: 1.0,
                            ),
                            SizedBox(
                              height: 18.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(    widget.talls, style: AppWidget.semiBoldTextFeildStyle121()),
                                Text(
                                    "الطول",
                                  style: AppWidget.semiBoldTextFeildStyle122()
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 1.0,
                            ),
                            SizedBox(
                              height: 18.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(    widget.breth, style: AppWidget.semiBoldTextFeildStyle121()),
                                Text(
                                  "تاريخ الميلاد",
                                  style: AppWidget.semiBoldTextFeildStyle122()
                                ),
                              ],
                            ),
                            Divider(
                                thickness: 1.0,
                              ),
                            SizedBox(
                              height: 18.0,
                            ),
                            ],
                        ),
                      ),
                    ],
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















