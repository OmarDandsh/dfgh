import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterdelivery1/service/database.dart';
import 'package:iconsax/iconsax.dart';
import '../Homes/Cv.dart';
import '../Homes/home_search_bar.dart';
import '../widget/round_textfield.dart';
import '../widget/widget_support.dart';
import 'addresAkudMukim.dart';
import 'bottomnav.dart';
import 'details.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'Contracthours.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  bool news = false, old = false;
  Stream? fooditemStream;
  bool _isExpiredContractsSelected = false;



  ontheload()async{
  fooditemStream= await DatabaseMethods().getFoodItem("عقد جديد");
  setState(() {

  });



}
@override
  void initState() {
  news = true; // تعيين القيمة الافتراضية للعقود الحالية بخط تحتها
  old = false;
    ontheload();
    super.initState();
  }
  Widget allItemsVertically(){

    return StreamBuilder(stream: fooditemStream, builder: (context ,AsyncSnapshot snapshot){
      return snapshot.hasData? ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data.docs.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context , index){
            DocumentSnapshot ds=snapshot.data.docs[index];
            return Container(
              height: 320.0,
              margin: EdgeInsets.all( 12.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // التغيير هنا

                  children: [

                    Container(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (!_isExpiredContractsSelected) // فقط إذا لم يكن "عقود منتهية" محددة، عرض زر "إختر"

                            Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 4.0, top: 4.0),
                              child: ElevatedButton(

                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddressPage1(price: ds["Price"]),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF600247),
                                  foregroundColor: Colors.white,
                                  shadowColor: Colors.grey.withOpacity(0.5),
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                                ),
                                child: Text('إختر' ,style:TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Tajawal',), ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: 8.0, top: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(ds["Name"],  style:AppWidget.semiBoldTextFeildStyle19()
                                  ), // الاسم
                                  Text(
                                    " ${ds["age"]} : العمر",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Color(0xFF3D2236),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Tajawal'
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
                                height: 55,
                                width: 55,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
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

                              margin: EdgeInsets.only(right: 16.0),
                              child: Text("الجنسية", style:AppWidget.semiBoldTextFeildStyle1() ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(right: 16.0),
                              child: Text("الديانة", style: AppWidget.semiBoldTextFeildStyle1()),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(right: 16.0),
                              child: Text("اللغة", style: AppWidget.semiBoldTextFeildStyle1()),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(right: 16.0),
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
                              margin: EdgeInsets.only(right: 16.0, top: 4.0,bottom: 2),
                              child: Text(ds["nationality"], style: AppWidget.semiBoldTextFeildStyle2()),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(right: 16.0, top: 4.0,bottom: 2),
                              child: Text(ds["Religion"], style: AppWidget.semiBoldTextFeildStyle2()),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(right: 16.0, top: 4.0,bottom: 2),
                              child: Text(ds["language"], style: AppWidget.semiBoldTextFeildStyle2()),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(

                              margin: EdgeInsets.only(right: 16.0, top: 4.0,bottom: 2),
                              child: Text(ds["Experience"], style: AppWidget.semiBoldTextFeildStyle2()),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
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
                            crossAxisAlignment: CrossAxisAlignment.start, // ضبط بداية النص من اليمين
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0), // هامش من اليمين
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end, // ضبط النص ليبدأ من اليمين
                                  children: [
                                    Text(
                                      "ر.س ",style: AppWidget.semiBoldTextFeildStyle2()

                                    ),
                                    Text(
                                      ds["Price"],
                                        style: AppWidget.semiBoldTextFeildStyle2()
                                    ),
                                    Text(" : ",style: AppWidget.semiBoldTextFeildStyle2()),
                                    Text(
                                      "الدفعة الشهرية",
                                        style: AppWidget.semiBoldTextFeildStyle2()
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding( // إضافة Padding للزر
                          padding: const EdgeInsets.only(right: 12.0), // هامش من اليمين
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Details1(  gender:ds["Gender"],talls:ds["talls"],figtht:ds["higtht"],breth:ds["breth"],name:ds["Name"],image: ds["Image"],nationality: ds["nationality"],religion:ds["Religion"],language: ds["language"],experience: ds["Experience"],maritalstatus: ds["maritalstatus"],age: ds["age"],)));

                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xfff4ecf4),
                              foregroundColor: Color(0xFF600247),
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: Text(
                              'السيرة الذاتية',
                              style: TextStyle(
                                color: Color(0xFF131313),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Tajawal',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),


                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Divider(
                        color: Colors.grey[400],
                        thickness: 1,
                        height: 22,
                      ),
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
                              Text(" جديرة بالثقة",  style:AppWidget.semiBoldTextFeildStyle20()),
                              Icon(Icons.download_done,   color: Color(
                                  0xFF383838)),
                            ],
                          ),
                          SizedBox(height: 5.0),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(" ضمان الخدمة اول ثلاث شهور", style:AppWidget.semiBoldTextFeildStyle20()),
                              Icon(Icons.download_done,  color: Color(
                                  0xFF383838)),
                            ],
                          ),
                          SizedBox(height: 5.0),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("استلام فوري غير قابل للتاجيل", style:AppWidget.semiBoldTextFeildStyle20()),
                              Icon(Icons.star_border ,  color: Color(
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
        appBar: AppBar(
          backgroundColor: Color(0xFF030637),
          automaticallyImplyLeading: false, // هذا يمنع AppBar من إضافة أيقونة الرجوع تلقائيًا
          title: Container(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 8, bottom: 9),
                  child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.88, // 90% من ارتفاع الشاشة
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start, // لجعل الأيقونة في البداية (اليسار)
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Navigator.pop(context); // لإغلاق النافذة
                                        },
                                        icon: Icon(
                                          Icons.close, // أيقونة الإغلاق
                                          size: 30, // يمكن تعديل الحجم حسب الحاجة
                                        ),
                                        color: Colors.red, // يمكن تعديل لون الأيقونة حسب الحاجة
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        "لا يوجد إشعارات الآن",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Color(0xFF484547),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                        isScrollControlled: true, // لجعل النافذة تأخذ الارتفاع المحدد بالكامل
                      );
                    },
                    icon: const Icon(
                      Icons.notifications, // استبدل بأيقونتك المرغوبة
                      color: Colors.white,
                    ),
                    iconSize: 30,
                  ),



                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Text(
                    "خدمات عون",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24, // قد تحتاج لتقليل الحجم ليناسب AppBar
                      fontFamily: 'ElMessiri',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // لإزالة الظل من AppBar
          elevation: 0,
        ),
      backgroundColor: Color(0xFFFEFEFE), // لون أغمق بشكل بسيط من الأبيض
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 7.0),
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
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Directionality(
                    textDirection: TextDirection.rtl,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center, // تغيير هنا
                      children: [


                        RoundTextfield(

                          hintText: "البحث" ,

                          left: Container(
                            alignment: Alignment.center,
                            width: 40,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Image.asset(
                                "assets/img/search.png",
                                width: 27,
                                height: 27,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 180.0,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            aspectRatio: 16/9,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration: Duration(milliseconds: 800),
                            viewportFraction: 0.8,
                          ),
                          items: [
                            'images/a1.png',
                            'images/a2.png',
                            'images/a3.png',
                            'images/a4.png',
                            // يمكنك إضافة المزيد من مسارات الصور هنا
                          ].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: AssetImage(i),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),

              SizedBox(
                height: 17.0,
              ),
              Container(margin: EdgeInsets.only(right: 20.0), child:
              showItem()),
              SizedBox(
                height: 10.0,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  color: Colors.grey[400],
                  thickness: 1,
                  height: 20,
                ),
              ),
              Container(margin: EdgeInsets.only(right: 20.0), child: showItem1()),
              SizedBox(
                height: 3.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20), // زيادة المبطن من الجانبين
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end, // لجعل العناصر في الجانب الأيمن من الشاشة
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.60 - 20, // من اليمين إلى 75% من عرض الشاشة مع حساب الpadding
                      child: Divider(
                        color: Colors.grey[400], // تعيين لون الخط
                        thickness: 1, // تعيين سمك الخط
                      ),
                    ),
                  ],
                ),
              ),


              SizedBox(
                height: 5.0,
              ),

              allItemsVertically(),


            ],
          ),
        ),
      ),
    );
  }

  Widget showItem() {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.center, // لجعل العناصر في منتصف الشاشة
      children: [
 // زيادة التباعد بين النصوص
        GestureDetector(
          onTap: () async {
            news = false;
            old = true;
            _isExpiredContractsSelected = true; // عقود منتهية محددة

            fooditemStream = await DatabaseMethods().getFoodItem("عقد منتهي");
            setState(() {});
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8), // تعديل الهوامش للتكيف مع النص
            decoration: BoxDecoration(
              border: old ? Border(bottom: BorderSide(color: Colors.black.withOpacity(0.2), width: 1)) : null, // استخدام نفس اللون الأسود الكاشف وسماكة مخفضة
            ),
            child: Text(
              "عقود منتهية",
              style: TextStyle(
                color:  Color(0xFF030637),
                fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'ElMessiri'// يمكن تعديل حجم الخط حسب الحاجة
              ),
            ),
          ),
        ),
        SizedBox(width: 30),
        GestureDetector(
          onTap: () async {
            news = true;
            old = false;
            _isExpiredContractsSelected = false; // عقود حالية محددة


            fooditemStream = await DatabaseMethods().getFoodItem("عقد جديد");
            setState(() {});
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8), // تعديل الهوامش للتكيف مع النص
            decoration: BoxDecoration(
              border: news ? Border(bottom: BorderSide(color: Colors.black.withOpacity(0.2), width: 1)) : null, // خط أسود كاشف تحت النص مع سماكة مخفضة
            ),
            child: Text(
              "عقود حالية",
              style: TextStyle(
                color:  Color(0xFF030637),
                fontFamily: 'ElMessiri',
                fontWeight: FontWeight.w600,
                fontSize: 16, // يمكن تعديل حجم الخط حسب الحاجة
              ),
            ),
          ),
        ),


      ],
    );



  }

  Widget showItem1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end, // لجعل العناصر في الجانب الأيمن من الشاشة
      children: [

         // زيادة التباعد بين النصوص
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddressPage()),
            );
          },

          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white, // خلفية بيضاء للزر الثاني
              borderRadius: BorderRadius.circular(5), // يمكن تعديل نصف قطر الحدود حسب الحاجة
              border: Border.all(color: Colors.black.withOpacity(0.2), width: 1), // إضافة حدود للزر الثاني
            ),
            child: Text(
              "عقود بالساعات",
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
        ),
        SizedBox(width: 15),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BottomNav()),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Color(0xFF4F123F),              borderRadius: BorderRadius.circular(5), // يمكن تعديل نصف قطر الحدود حسب الحاجة
            ),
            child: Text(
              "عقود مقيمة",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }


}
