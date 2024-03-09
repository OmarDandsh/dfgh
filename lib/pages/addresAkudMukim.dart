import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterdelivery1/pages/chessBakaMakem.dart';

import '../widget/widget_support.dart';
import 'cheesBaka.dart';
import 'details.dart';
import '../widget/widget_support.dart';


class AddressPage1 extends StatefulWidget {
  final String price;

  AddressPage1({Key? key, required this.price}) : super(key: key);

  @override
  State<AddressPage1> createState() => _AddressPage1State();
}


class _AddressPage1State extends State<AddressPage1> {



  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int? selectedIcon = 1; // متغير لتتبع الأيقونة المُنقر عليها

  // إنشاء TextEditingController لكل حقل
  final titleNameController = TextEditingController();
  final streetNameController = TextEditingController();
  final buildingNameController = TextEditingController();
  final floorNumberController = TextEditingController();
  final zipController = TextEditingController();
  final basicNumberController = TextEditingController();
  final secondaryNumberController = TextEditingController();

  @override
  void dispose() {
    // تنظيف الكونترولر عند إزالة الويدجت من شجرة الويدجت
    titleNameController.dispose();
    streetNameController.dispose();
    buildingNameController.dispose();
    floorNumberController.dispose();
    zipController.dispose();
    basicNumberController.dispose();
    secondaryNumberController.dispose();
    super.dispose();
  }
  void uploadItem() {
    // جمع البيانات من الكونترولرز
    final addressData = {
      'titleName': titleNameController.text,
      'streetName': streetNameController.text,
      'buildingName': buildingNameController.text,
      'floorNumber': floorNumberController.text,
      'zip': zipController.text,
      'basicNumber': basicNumberController.text,
      'secondaryNumber': secondaryNumberController.text,
      'price': widget.price, // إضافة price إلى البيانات
    };

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChessBaka1(addressData: addressData), // تمرير addressData إلى ChessBaka1
      ),
    );
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
                "أضف عنوان",
                style:AppWidget.TitlePap(),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFE8E8FD),


      body: SingleChildScrollView(

        child: Container(
          margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 50.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end, // لضمان ظهور النص على اليمين
                  children: [
                    Align(
                      alignment: Alignment.centerRight, // لضمان ظهور النص فوق الأيقونات مباشرة وعلى اليمين
                      child: Text(
                          "اختر رمز العنوان",
                          style: AppWidget.semiBoldTextFeildStyle19()
                      ),
                    ),
                    SizedBox(height: 20), // مسافة بين النص والأيقونات
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // أيقونة الحقيبة
                        GestureDetector(
                          onTap: () => setState(() => selectedIcon = 2),
                          child: CircleAvatar(
                            backgroundColor: selectedIcon == 2 ?  Color(0xFF600247) : Colors.white,
                            child: Icon(Icons.shopping_bag, color: selectedIcon == 2 ? Colors.white : Colors.black, size: 32,),
                          ),
                        ),
                        SizedBox(width: 50),
                        // أيقونة الموقع
                        GestureDetector(
                          onTap: () => setState(() => selectedIcon = 3),
                          child: CircleAvatar(
                            backgroundColor: selectedIcon == 3 ? Color(0xFF600247) : Colors.white,
                            child: Icon(Icons.location_on, color: selectedIcon == 3 ? Colors.white : Colors.black, size: 32,),
                          ),
                        ),
                        SizedBox(width: 50),
                        // أيقونة البيت
                        GestureDetector(
                          onTap: () => setState(() => selectedIcon = 1),
                          child: CircleAvatar(
                            backgroundColor: selectedIcon == 1 ? Color(0xFF600247) : Colors.white,
                            child: Icon(Icons.home, color: selectedIcon == 1 ? Colors.white : Colors.black, size: 32,),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Form(
                key: _formKey, // إرفاق المفتاح مع النموذج

                child: Column(
                  children: [


                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end, // توجيه العناصر من اليمين إلى اليسار
                      children: [
                        Text(
                          "اسم العنوان",
                          style: AppWidget.semiBoldTextFeildStyle21(),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white, // تغيير لون الخلفية إلى أبيض
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: TextFormField(
                        textAlign: TextAlign.end, // تحديد اتجاه النص
                        controller: titleNameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: " اسم العنوان",
                          hintStyle: AppWidget.inputTextHint(),
                          errorStyle: TextStyle(
                            color: Colors.red, // لون نص الخطأ
                            fontSize: 12.0, // حجم نص الخطأ
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE8E8FD)),

                            // لون الخط تحت الحقل عند وجود خطأ
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE8E8FD)), // للحفاظ على نفس اللون عند التركيز
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'الرجاء إدخال اسم العنوان'; // رسالة الخطأ التي تظهر إذا كان الحقل فارغًا
                          }
                          return null; // العودة إلى null تعني عدم وجود خطأ
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end, // توجيه العناصر من اليمين إلى اليسار
                      children: [
                        Text(
                          "اسم الشارع",
                          style: AppWidget.semiBoldTextFeildStyle21(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white, // تغيير لون الخلفية إلى أبيض
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: TextFormField(
                        textAlign: TextAlign.end, // تحديد اتجاه النص
                        controller: streetNameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "اسم الشارع",
                          hintStyle: AppWidget.inputTextHint(),
                          errorStyle: TextStyle(
                            color: Colors.red, // لون نص الخطأ
                            fontSize: 12.0, // حجم نص الخطأ
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE8E8FD)),

                            // لون الخط تحت الحقل عند وجود خطأ
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE8E8FD)), // للحفاظ على نفس اللون عند التركيز
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'الرجاء إدخال اسم الشارع'; // رسالة الخطأ التي تظهر إذا كان الحقل فارغًا
                          }
                          return null; // العودة إلى null تعني عدم وجود خطأ
                        },
                      ),
                    ),

                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end, // توجيه العناصر من اليمين إلى اليسار
                      children: [
                        Text(
                          "رقم المبنى",
                          style: AppWidget.semiBoldTextFeildStyle21(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white, // تغيير لون الخلفية إلى أبيض
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number, // لفتح لوحة مفاتيح الأرقام

                        textAlign: TextAlign.end, // تحديد اتجاه النص
                        controller: buildingNameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "رقم المبنى",
                          hintStyle: AppWidget.inputTextHint(),
                          errorStyle: TextStyle(
                            color: Colors.red, // لون نص الخطأ
                            fontSize: 12.0, // حجم نص الخطأ
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE8E8FD)),

                            // لون الخط تحت الحقل عند وجود خطأ
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE8E8FD)), // للحفاظ على نفس اللون عند التركيز
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'الرجاء إدخال رقم المبنى'; // رسالة الخطأ التي تظهر إذا كان الحقل فارغًا
                          }
                          return null; // العودة إلى null تعني عدم وجود خطأ
                        },
                      ),
                    ),

                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      height: 10.0, // يمكنك تعديل المسافة حسب الحاجة
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end, // توجيه العناصر من اليمين إلى اليسار
                      children: [
                        Text(
                          "رقم الطابق",
                          style: AppWidget.semiBoldTextFeildStyle21(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white, // تغيير لون الخلفية إلى أبيض
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number, // لفتح لوحة مفاتيح الأرقام

                        textAlign: TextAlign.end, // تحديد اتجاه النص
                        controller: floorNumberController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "رقم الطابق",
                          hintStyle: AppWidget.inputTextHint(),
                          errorStyle: TextStyle(
                            color: Colors.red, // لون نص الخطأ
                            fontSize: 12.0, // حجم نص الخطأ
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE8E8FD)),

                            // لون الخط تحت الحقل عند وجود خطأ
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE8E8FD)), // للحفاظ على نفس اللون عند التركيز
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'الرجاء إدخال رقم الطابق'; // رسالة الخطأ التي تظهر إذا كان الحقل فارغًا
                          }
                          return null; // العودة إلى null تعني عدم وجود خطأ
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end, // توجيه العناصر من اليمين إلى اليسار
                      children: [
                        Text(
                          "الرمز البريدي",
                          style: AppWidget.semiBoldTextFeildStyle21(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end, // لجعل العناصر داخل العمود محاذاة لليمين
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          width: MediaQuery.of(context).size.width, // تحديد العرض بناءً على عرض الشاشة
                          decoration: BoxDecoration(
                            color: Colors.white, // تغيير لون الخلفية إلى أبيض
                            borderRadius: BorderRadius.circular(10), // تقريب حواف الحقل
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.number, // لفتح لوحة مفاتيح الأرقام
                            maxLength: 5, // تحديد الحد الأقصى لعدد الأرقام بـ 5
                            textAlign: TextAlign.end, // تحديد اتجاه النص من اليمين لليسار
                            controller: zipController,
                            decoration: InputDecoration(
                              border: InputBorder.none, // إزالة الحدود
                              hintText: "رقم البريدي", // نص تلميحي
                              hintStyle: AppWidget.inputTextHint(), // تنسيق النص التلميحي
                              counterText: "", // لإخفاء عداد الأحرف الذي يظهر بجانب الحقل
                            ),
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly], // للتأكد من أن الإدخال يتكون من أرقام فقط
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'الرجاء إدخال رقم البريدي'; // رسالة الخطأ في حال كان الحقل فارغاً
                              } else if (value.length != 5) {
                                return 'يجب أن يحتوي الحقل على خمسة أرقام'; // رسالة الخطأ في حال لم يكن الإدخال مكوناً من 5 أرقام
                              }
                              return null; // إذا لم تكن هناك مشكلة في الإدخال
                            },
                          ),
                        ),

                        SizedBox(
                          height: 5.0, // يمكنك تعديل المسافة حسب الحاجة
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10.0), // إضافة هامش على الجانب الأيمن
                          child: Text(
                            "يجب أن يحتوي الحقل على خمسة أرقام",
                            style: TextStyle(
                              fontSize: 12, // حجم النص، يمكنك تعديله حسب الحاجة
                              color: Colors.black, // لون النص، يمكنك تعديله حسب الحاجة
                            ),
                            textAlign: TextAlign.right, // لجعل النص محاذى لليمين
                          ),
                        ),
                      ],
                    ),


                    SizedBox(
                      height: 10.0,
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.end, // توجيه العناصر من اليمين إلى اليسار

                      children: [

                        Text(
                          "رقم الجوال الاساسي",
                          style: AppWidget.semiBoldTextFeildStyle21(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                              border: Border(
                                right: BorderSide(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                              ),
                            ),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text('+966', style: TextStyle(color: Colors.black)),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                maxLength: 9,
                                textAlign: TextAlign.left,
                                controller: basicNumberController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "رقم الجوال الأساسي",
                                  hintStyle: AppWidget.inputTextHint(),
                                  counterText: "",
                                ),
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'الرجاء إدخال رقم الجوال'; // رسالة الخطأ في حال كان الحقل فارغاً
                                  } else if (value.length != 9) {
                                    return 'يجب أن يتكون رقم الجوال من 9 أرقام'; // رسالة الخطأ في حال لم يكن الإدخال مكوناً من 9 أرقام
                                  }
                                  return null; // إذا لم تكن هناك مشكلة في الإدخال
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end, // توجيه العناصر من اليمين إلى اليسار

                      children: [

                        Text(
                          "رقم الجوال الثانوي",
                          style: AppWidget.semiBoldTextFeildStyle21(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white, // تغيير لون الخلفية إلى أبيض
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                              border: Border(
                                right: BorderSide(
                                  color: Colors.grey, // لون الخط
                                  width: 0.5, // عرض الخط
                                ),
                              ),
                            ),
                            alignment: Alignment.center, // لتوسيط النص داخل الحقل
                            padding: EdgeInsets.symmetric(horizontal: 10), // ضبط البادينغ حسب الحاجة
                            child: Text('+966', style: TextStyle(color: Colors.black)),
                          ),
                          Expanded( // استخدام Expanded للحقل الثاني ليأخذ العرض المتبقي
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                color: Colors.white, // تغيير لون الخلفية إلى أبيض
                                borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                              ),
                              child: TextField(
                                keyboardType: TextInputType.number, // لفتح لوحة مفاتيح الأرقام
                                maxLength: 9, // تحديد الحد الأقصى لطول الإدخال بـ 9 أرقام
                                textAlign: TextAlign.left, // تغيير اتجاه النص ليبدأ من اليسار
                                controller: secondaryNumberController,

                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "رقم الجوال الثانوي",
                                  hintStyle: AppWidget.inputTextHint(),
                                  counterText: "", // لإخفاء عداد الأحرف
                                ),
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly], // للتأكد من أن الإدخال يتكون من أرقام فقط
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),

                    SizedBox(
                      height: 20.0,
                    ),


                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          uploadItem(); // تنفيذ uploadItem عند النقر
                        }
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0), // حواف على اليمين واليسار
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
                              width: MediaQuery.of(context).size.width, // جعل العرض يساوي عرض الشاشة
                              decoration: BoxDecoration(
                                  color: Color(0xFF600247),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(
                                child: Text(
                                  "حفظ العنوان",
                                  style: AppWidget.semiBoldTextFeildStyle23(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}