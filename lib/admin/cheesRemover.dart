import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterdelivery1/service/database.dart';
import 'package:iconsax/iconsax.dart';

import '../pages/details.dart';
import '../widget/widget_support.dart';



class removeItem extends StatefulWidget {
  const removeItem({super.key});

  @override
  State<removeItem> createState() => _removeItemState();
}


class _removeItemState extends State<removeItem> {

  Stream? fooditemStream; Stream? fooditemStream1;

  ontheload()async{
    fooditemStream= await DatabaseMethods().getFoodItem("عقد جديد");
    fooditemStream1= await DatabaseMethods().getFoodItem("عقد منتهي");
    setState(() {

    });



  }
  @override
  void initState() {

    ontheload();
    super.initState();
  }
  Widget allItemsVertically(){

    return StreamBuilder(stream: fooditemStream, builder: (context ,AsyncSnapshot snapshot){
      return snapshot.hasData? ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data.docs.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context , index){
            DocumentSnapshot ds=snapshot.data.docs[index];
            return Container(
              height: 320.0,
              margin: EdgeInsets.all( 6.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                // افترض أن لديك وظيفة تسمى deleteFoodItem تأخذ معرف العنصر
                                DatabaseMethods().deleteFoodItem("عقد جديد",ds.id);
                              },
                            ),

                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: 10.0, top: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(ds["Name"], style:  TextStyle(
                                      color: Color(0xFF720455),
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Kdam',),
                                    ), // الاسم
                                    Text(
                                      " ${ds["age"]} :العمر",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Color(0xFF3D2236),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 4.0, right: 5.0), // إضافة هوامش من الأعلى وعلى اليمين
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  ds["Image"],
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        color: Colors.grey[400],
                        thickness: 1,
                        height: 20,
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(

                              margin: EdgeInsets.only(right: 20.0),
                              child: Text("الجنسية", style:AppWidget.semiBoldTextFeildStyle1() ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(right: 20.0),
                              child: Text("الديانة", style: AppWidget.semiBoldTextFeildStyle1()),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(right: 20.0),
                              child: Text("اللغة", style: AppWidget.semiBoldTextFeildStyle1()),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(right: 20.0),
                              child: Text("الخبرة", style: AppWidget.semiBoldTextFeildStyle1()),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(right: 20.0, top: 4.0,bottom: 2),
                              child: Text(ds["nationality"], style: AppWidget.semiBoldTextFeildStyle2()),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(right: 20.0, top: 4.0,bottom: 2),
                              child: Text(ds["Religion"], style: AppWidget.semiBoldTextFeildStyle2()),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(right: 20.0, top: 4.0,bottom: 2),
                              child: Text(ds["language"], style: AppWidget.semiBoldTextFeildStyle2()),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,

                              margin: EdgeInsets.only(left: 11.0, top: 4.0,bottom: 2),
                              child: Text(ds["Experience"], style: AppWidget.semiBoldTextFeildStyle2()),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        color: Colors.grey[400],
                        thickness: 1,
                        height: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    ds["Price"],style: TextStyle(
                                      color: Color(0xFF3D2236),

                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Kdam'),

                                  ),
                                  Text(" : "),
                                  Text("الدفعة الشهرية"  , style: AppWidget.semiBoldTextFeildStyle2(),), // يمكن استبدال هذا النص بالقيمة الفعلية التي ترغب في عرضها
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xfff4ecf4),
                                  foregroundColor: Color(0xFF600247),
                                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                child: Text('السيرة الذاتية'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        color: Colors.grey[400],
                        thickness: 1,
                        height: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20.0),
                      width: double.infinity,
                      alignment: Alignment.centerRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(" جديرة بالثقة", style: TextStyle(
                                  color: Color(0xFF5E244F),
                                  // تغيير لون الخط إلى الرمادي

                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Kdam')),
                              Icon(Icons.download_done,   color: Color(
                                  0xFF383838)),
                            ],
                          ),
                          SizedBox(height: 5.0),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(" ضمان الخدمة اول ثلاث شهور", style:TextStyle(
                                  color: Color(0xFF5E244F),

                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Kdam')),
                              Icon(Icons.download_done,  color: Color(
                                  0xFF383838)),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),


              ),
            );

          }):CircularProgressIndicator();

    });
  }
  Widget allItemsVertically1(){

    return StreamBuilder(stream: fooditemStream1, builder: (context ,AsyncSnapshot snapshot){
      return snapshot.hasData? ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data.docs.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context , index){
            DocumentSnapshot ds=snapshot.data.docs[index];
            return Container(
              height: 320.0,
              margin: EdgeInsets.all( 6.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                // افترض أن لديك وظيفة تسمى deleteFoodItem تأخذ معرف العنصر
                                DatabaseMethods().deleteFoodItem("عقد منتهي",ds.id);
                              },
                            ),

                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: 10.0, top: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(ds["Name"], style:  TextStyle(
                                      color: Color(0xFF720455),
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Kdam',),
                                    ), // الاسم
                                    Text(
                                      " ${ds["age"]} :العمر",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Color(0xFF3D2236),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 4.0, right: 5.0), // إضافة هوامش من الأعلى وعلى اليمين
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  ds["Image"],
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        color: Colors.grey[400],
                        thickness: 1,
                        height: 20,
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(

                              margin: EdgeInsets.only(right: 20.0),
                              child: Text("الجنسية", style:AppWidget.semiBoldTextFeildStyle1() ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(right: 20.0),
                              child: Text("الديانة", style: AppWidget.semiBoldTextFeildStyle1()),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(right: 20.0),
                              child: Text("اللغة", style: AppWidget.semiBoldTextFeildStyle1()),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(right: 20.0),
                              child: Text("الخبرة", style: AppWidget.semiBoldTextFeildStyle1()),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(right: 20.0, top: 4.0,bottom: 2),
                              child: Text(ds["nationality"], style: AppWidget.semiBoldTextFeildStyle2()),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(right: 20.0, top: 4.0,bottom: 2),
                              child: Text(ds["Religion"], style: AppWidget.semiBoldTextFeildStyle2()),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(right: 20.0, top: 4.0,bottom: 2),
                              child: Text(ds["language"], style: AppWidget.semiBoldTextFeildStyle2()),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,

                              margin: EdgeInsets.only(left: 11.0, top: 4.0,bottom: 2),
                              child: Text(ds["Experience"], style: AppWidget.semiBoldTextFeildStyle2()),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        color: Colors.grey[400],
                        thickness: 1,
                        height: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    ds["Price"],style: TextStyle(
                                      color: Color(0xFF3D2236),

                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Kdam'),

                                  ),
                                  Text(" : "),
                                  Text("الدفعة الشهرية"  , style: AppWidget.semiBoldTextFeildStyle2(),), // يمكن استبدال هذا النص بالقيمة الفعلية التي ترغب في عرضها
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xfff4ecf4),
                                  foregroundColor: Color(0xFF600247),
                                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                child: Text('السيرة الذاتية'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        color: Colors.grey[400],
                        thickness: 1,
                        height: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20.0),
                      width: double.infinity,
                      alignment: Alignment.centerRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(" جديرة بالثقة", style: TextStyle(
                                  color: Color(0xFF5E244F),
                                  // تغيير لون الخط إلى الرمادي

                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Kdam')),
                              Icon(Icons.download_done,   color: Color(
                                  0xFF383838)),
                            ],
                          ),
                          SizedBox(height: 5.0),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(" ضمان الخدمة اول ثلاث شهور", style:TextStyle(
                                  color: Color(0xFF5E244F),

                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Kdam')),
                              Icon(Icons.download_done,  color: Color(
                                  0xFF383838)),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),


              ),
            );

          }):CircularProgressIndicator();

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEFEFE), // لون أغمق بشكل بسيط من الأبيض
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),

              ),







              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20), // زيادة المبطن من الجانبين
                child: Divider(
                  color: Colors.grey[400], // تعيين لون الخط
                  thickness: 1, // تعيين سمك الخط
                  height: 20, // تعيين الارتفاع الكلي للويدجت، يشمل الفراغ فوق وتحت الخط
                ),
              ),

              SizedBox(
                height: 30.0,
              ),


              allItemsVertically(),
              allItemsVertically1(),


            ],
          ),
        ),
      ),
    );
  }


}
