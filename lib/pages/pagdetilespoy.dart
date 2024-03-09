import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../authentication/terms_of_use.dart';
import '../constants.dart';
import '../constants.dart';
import '../widget/student_data.dart';
import '../service/database.dart';
import '../widget/widget_support.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/cupertino.dart';

import 'infoBay.dart';

class ConfirmationPage extends StatefulWidget {
  final Map<String, String> addressData;
  final double priceAfter;
  final double averagePricePerVisit;
  final double priceBefore;
  final String packageNamess;

  ConfirmationPage({
    required this.addressData,
    required this.priceAfter,
    required this.averagePricePerVisit,
    required this.priceBefore,
    required this.packageNamess,
  });


  @override
  _ConfirmationPageState createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  double dariba = 66.39;

  List<String> images = [
    'images/master.png',
    'images/imercan.png',
    'images/mada1.png',
    'images/visa-removebg-preview.png',
  ];

  @override
  Widget build(BuildContext context) {
    double dd = widget.priceBefore - widget.priceAfter;
    double ttt = widget.priceAfter + dariba;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color(0xFF373866),
          ),
          onPressed: () {

            Navigator.pop(context);
          },
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl, // تعيين اتجاه النص من اليمين لليسار
       child:  SingleChildScrollView(
         physics: BouncingScrollPhysics(),

         child: Column(
           children: [
             Padding(
               padding: const EdgeInsets.all(16.0),
               child: Container(
                 padding: EdgeInsets.symmetric(horizontal: 16.0), // حواف على اليمين واليسار
                 height: 100.0, // طول العنصر
                 width: double.infinity, // يأخذ عرض الشاشة بالكامل
                 decoration: BoxDecoration(
                   color:  Color(0xFF720455), // لون الخلفية الأحمر
                   borderRadius: BorderRadius.all(Radius.circular(10.0)), // بوردر راديوس
                 ),
                 child: Align(
                   alignment: Alignment.centerRight, // محاذاة النصوص إلى اليمين
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center, // لتوسيط النصوص داخل العنصر
                     crossAxisAlignment: CrossAxisAlignment.start, // لبدء النصوص من اليمين
                     children: [
                       Text(
                         'تفاصيل العقد',
                        style: AppWidget.semiBoldTextFeildStyle8() // تنسيق النص
                       ),
                       SizedBox(height: 8.0), // مسافة بين النصوص
                       Text(
                         'خدمات بالساعة',
                           style: AppWidget.semiBoldTextFeildStyle4() // تنسيق النص
                       ),
                     ],
                   ),
                 ),
               ),
             ),

    Container(
      decoration: BoxDecoration(
        borderRadius: kTopBorderRadius,
        color: kOtherColor,
      ),
      width: 100.w,

      child: SingleChildScrollView(
        //for padding
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
                        Text(
                          "العنوان",
                          style: AppWidget.semiBoldTextFeildStyle121(),
                        ),
                        Text(
                          '${widget.addressData['titleName']} , ${widget.addressData['streetName']}', // Adding a comma between the two values
                          style: AppWidget.semiBoldTextFeildStyle13(),
                        ),



                      ],
                    ),
                    Divider(
                      thickness: 1.0,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "الخدمة",
                          style: AppWidget.semiBoldTextFeildStyle121(),
                        ),
                        Text('عاملة منزلية بالساعة',  style: AppWidget.semiBoldTextFeildStyle13(),),


                      ],
                    ),

                    Divider(
                      thickness: 1.0,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "الباقة",
                          style: AppWidget.semiBoldTextFeildStyle121(),
                        ),
                        Text(widget.packageNamess,  style: AppWidget.semiBoldTextFeildStyle13(),),


                      ],
                    ),

                    Divider(
                      thickness: 1.0,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "قيمة الخدمة",
                          style: AppWidget.semiBoldTextFeildStyle121(),
                        ),
                        Text(widget.priceAfter.toStringAsFixed(2),  style: AppWidget.semiBoldTextFeildStyle13(),),


                      ],
                    ),
                    Divider(
                      thickness: 1.0,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [


                        Text(
                          "غير شاملة للضريبة",
                          style: AppWidget.semiBoldTextFeildStyle14(),
                        ),
                      ],
                    ),





                  ],
                ),
              ),
                SizedBox(
                  height: 20.0,
                ),

                Container(

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
                                Text(
                                  "تفاصيل الفاتورة",
                                  style: AppWidget.semiBoldTextFeildStyle121(),
                                ),



                              ],
                            ),

                            SizedBox(
                              height: 15.0,
                            ),



                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "تفاصيل الفاتورة الأصلية",
                                  style: AppWidget.semiBoldTextFeildStyle121(),
                                ),
                                Text(widget.priceBefore.toStringAsFixed(2),  style: AppWidget.semiBoldTextFeildStyle13(),),


                              ],
                            ),

                            Divider(
                              thickness: 1.0,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "الخصم",
                                  style: AppWidget.semiBoldTextFeildStyle121(),
                                ),
                                Text(widget.priceBefore.toStringAsFixed(2),  style: AppWidget.semiBoldTextFeildStyle13(),),


                              ],
                            ),
                            Divider(
                              thickness: 1.0,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "قيمة الضريبة المضافة",
                                  style: AppWidget.semiBoldTextFeildStyle121(),
                                ),
                                Text(dariba.toStringAsFixed(2),  style: AppWidget.semiBoldTextFeildStyle13(),),


                              ],
                            ),
                            Divider(
                              thickness: 1.0,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "المبلغ المراد دفعة",
                                  style: AppWidget.semiBoldTextFeildStyle121(),
                                ),
                                Text(ttt.toStringAsFixed(2),  style: AppWidget.semiBoldTextFeildStyle13(),),


                              ],
                            ),







                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'كود الخصم',
                      style: AppWidget.semiBoldTextFeildStyle121(),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number, // لفتح لوحة مفاتيح الأرقام
                            decoration: InputDecoration(
                              hintText: 'أدخل كود الخصم هنا',
                              border: InputBorder.none, // إزالة الحدود
                              enabledBorder: InputBorder.none, // إزالة الحدود عندما يكون الحقل نشطًا
                              focusedBorder: InputBorder.none, // إزالة الحدود عندما يكون الحقل محددًا
                            ),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        ElevatedButton(
                          onPressed: () {
                            // التحقق من صحة كود الخصم
                            if ("يؤسيؤ" != "الكود_الصحيح") { // استبدل "الكود_الصحيح" بالكود الفعلي
                              // إظهار SnackBar برسالة خطأ
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('خطأ: كود الخصم غير صحيح'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            } else {
                              // إجراءات في حال كان الكود صحيح
                            }
                          },
                          child: Text('تطبيق', style: AppWidget.semiBoldTextFeildStyle121()),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, // خلفية بيضاء للزر
                            elevation: 0, // إزالة الظل
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0), // إزالة الحواف المستديرة
                            ),
                            fixedSize: Size(100.0, 60.0),// تحديد عرض وطول ثابتين للزر
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity, // تحديد العرض كل الشاشة
                margin: EdgeInsets.all(16.0), // تحديد الحواف من كل الاتجاهات
                height: 50.0, // تحديد ارتفاع الزر
                child: ElevatedButton(
                  onPressed: () {
                    _showModalBottomSheet(context);

                  },
                  child: Text('تقدم للدفع', style: AppWidget.semiBoldTextFeildStyle9()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF720455),
                    disabledForegroundColor: Colors.black.withOpacity(0.38),
                    disabledBackgroundColor: Colors.black.withOpacity(0.12),
                    shadowColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ),











            ],
          ),

        ),

      ),
    ),

           ],
         ),
       ),
      ),
    );
  }
  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20.0),
          height: 300, // تعديل الارتفاع حسب الحاجة
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0), // إضافة حواف من الجانب الأيسر بقيمة 8
                    child: Icon(
                      Icons.credit_card,
                      size: 44.0, // تحديد حجم الأيقونة
                    ),
                  ),                  Text('اختيار بطاقة ائتمان', style: AppWidget.semiBoldTextFeildStyle12(),), // نص
                ],
              ),
              Divider(), // خط فاصل
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewPage()), // استبدل 'NewPage' بالصفحة التي تريد الانتقال إليها
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround, // لتوزيع الصور بالتساوي داخل السطر
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
                        height: 45.0, // ارتفاع الصورة الثانية
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
              )







            ],
          ),
        );
      },
    );
  }
}


