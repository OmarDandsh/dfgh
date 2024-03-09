import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterdelivery1/service/database.dart';
import '../Homes/Cv.dart';
import '../pages/details.dart';
import '../widget/widget_support.dart';
import 'addresAkudMukim.dart';
class RemoveItem extends StatefulWidget {
  const RemoveItem({Key? key}) : super(key: key);
  @override
  State<RemoveItem> createState() => _RemoveItemState();
}
class _RemoveItemState extends State<RemoveItem> {

  Stream? fooditemStream;

  String selectedNationality = 'جميع الجنسيات';
  String selectedReligion = 'جميع الديانات';
  String selectedlanguage = 'الحالة الاجتماعية';

  @override
  void initState() {
    super.initState();
    onTheLoad();
  }

  onTheLoad() async {
    fooditemStream = DatabaseMethods().getItemsByFilter("عقد جديد", nationality: selectedNationality, religion: selectedReligion);
    setState(() {});
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
        backgroundColor: Color(0xFFE8E8FD), // لون خلفية AppBar

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
                "خدمات مقيمة",
                style:AppWidget.TitlePap(),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),           backgroundColor: Color(0xFFE8E8FD),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 1,
              ),
            ),
            // استخدم Row لوضع DropdownButtons بجانب بعضها
            Padding(
              padding: const EdgeInsets.all(4.0),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                      decoration: BoxDecoration(
                        color: Color(0xFFE8E8FD),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey, width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFE8E8FD).withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: selectedlanguage,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedlanguage = newValue!;
                              onTheLoad();
                            });
                          },
                          items: <String>['الحالة الاجتماعية', 'متزوجة', 'عزباء']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value
                                ,style: TextStyle(fontSize: 13),
                              ),
                            );
                          }).toList(),
                          underline: Container(), // لإزالة الخط السفلي
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(

                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                      decoration: BoxDecoration(
                        color: Color(0xFFE8E8FD),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey, width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFE8E8FD).withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: selectedNationality,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedNationality = newValue!;
                              onTheLoad();
                            });
                          },
                          items: <String>['جميع الجنسيات', 'الفلبين', 'كينيا', 'اوغندة', 'بنجلاديش', 'سري لنكا', 'الهند']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value ,style: TextStyle(fontSize: 14),),
                            );
                          }).toList(),
                          underline: Container(), // لإزالة الخط السفلي
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                      decoration: BoxDecoration(
                        color: Color(0xFFE8E8FD),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey, width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFE8E8FD).withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: selectedReligion,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedReligion = newValue!;
                              onTheLoad();
                            });
                          },
                          items: <String>['جميع الديانات', 'مسلمة', 'المسيحية', 'الهندوسية', 'البوذية']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: TextStyle(fontSize: 14),
                              ),
                            );
                          }).toList(),
                          underline: Container(), // لإزالة الخط السفلي
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),

            // ثم استمر في إضافة باقي عناصر الواجهة
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  // أي عناصر أخرى ترغب بإضافتها
                ],
              ),
            ),

            allItemsVertically(), // تأكد من أن هذه الدالة تعيد قائمة بالعناصر التي ترغب بعرضها
          ],
        ),
      ),
    );
  }
}
