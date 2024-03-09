import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../widget/widget_support.dart';

import '../constants.dart';

class StudentName extends StatelessWidget {
  const StudentName({Key? key, required this.studentName}) : super(key: key);
  final String studentName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

      Text(
      studentName,
      style: AppWidget.semiBoldTextFeildStyle12()),
      ]
    );
  }
}

class StudentClass extends StatelessWidget {
  const StudentClass({Key? key, required this.studentClass}) : super(key: key);
  final String studentClass;
  @override
  Widget build(BuildContext context) {
       return Text(studentClass, style: AppWidget.inputTextHint1());

  }
}

class StudentYear extends StatelessWidget {
  const StudentYear({Key? key, required this.studentYear}) : super(key: key);

  final String studentYear;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.w,
      height: SizerUtil.deviceType == DeviceType.tablet ? 4.h : 3.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding),
      ),
      child: Center(
        child: Text(
          studentYear,
            style: AppWidget.semiBoldTextFeildStyle121()
        ),
      ),
    );
  }
}

class StudentPicture extends StatelessWidget {
  const StudentPicture(
      {Key? key, required this.picAddress, required this.onPress})
      : super(key: key);
  final String picAddress;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: CircleAvatar(
        radius: SizerUtil.deviceType == DeviceType.tablet ? 12.w : 14.w,
        backgroundColor: kSecondaryColor,
        backgroundImage: AssetImage(picAddress),
      ),
    );
  }
}

class StudentDataCard extends StatelessWidget {
  const StudentDataCard(
      {Key? key,
        required this.title,
        required this.value,
        })
      : super(key: key);
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return InkWell(

      child: Container(
        width: 42.w,
        height: 8.h,
        decoration: BoxDecoration(
          color: Color(0xFFEEE7EA),
          borderRadius: BorderRadius.circular(kDefaultPadding),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title,
              style: AppWidget.semiBoldTextFeildStyle121()
            ),
            Text(
              value,
              style:AppWidget.semiBoldTextFeildStyle122()
            ),
          ]
        ),
      ),
    );
  }
}
