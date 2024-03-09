import 'package:flutter/material.dart';
import 'package:flutterdelivery1/pages/pagdetilespoy.dart';
import 'package:intl/intl.dart';

import '../widget/widget_support.dart';
import 'details.dart'; // تأكد من إضافة intl إلى pubspec.yaml

class ChessBaka extends StatefulWidget {
  final Map<String, String> addressData; // تعريف المتغير هنا

  ChessBaka({required this.addressData}); // تمرير البيانات عبر البنّاء

  @override
  _ChessBakaState createState() => _ChessBakaState();
}

class _ChessBakaState extends State<ChessBaka> {



  bool _isNationalitySelected = false; // تعريف المتغير هنا
  bool _isDurationSelected = false; // يجب تعريفه في حالة الويدجت

  List<int> _selectedDaysIndices = []; // تعريف القائمة هنا
  List<int> _selectedIndices = []; // تعريف القائمة هنا

  String buttonText = 'اختر تاريخ بداية الخدمة';
  int _selectedIndex = -1; // لتتبع الزر المُنقر عليه
  int _selectedButtonValue = 0; // متغير لتخزين قيمة الزر المختار
  int _selectedPeriodIndex = -1;
  int _result = 0;
  double hours = 103.43;
  double hours1 = 135.27;
  double hours2 = 137.46;
  bool _showColumns = false;






  void _pickDate(BuildContext context) async {


    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        buttonText = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> days = [ 'سبت', 'خميس', 'اربعاء', 'ثلاثاء', 'اثنين', 'احد'];

    double totalAmount =hours * _selectedDaysIndices.length * _selectedButtonValue * 4;
    double discountAmount = totalAmount * 0.05;
    double finalAmount = totalAmount - discountAmount;
    //
    double totalAmount1 =hours1 * _selectedDaysIndices.length * _selectedButtonValue * 4;
    double discountAmount1 = totalAmount1 * 0.05;
    double finalAmount1 = totalAmount1 - discountAmount1;
    //
    double totalAmount2 =hours2 * _selectedDaysIndices.length * _selectedButtonValue * 4;
    double discountAmount2 = totalAmount2* 0.05;
    double finalAmount2 = totalAmount2 - discountAmount2;

    double averagePricePerVisit = finalAmount / (_selectedButtonValue * _selectedDaysIndices.length * 4);



    return Scaffold(
      backgroundColor: Color(0xFFE8E8FD), // لون خلفية AppBar

      appBar:AppBar(
        backgroundColor: Color(0xFFE8E8FD), // لون خلفية AppBar

        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Center( // يوسط النص داخل AppBar
          child: Text('صمم باقتك'),
        ),
        actions: [
          Padding( // يضيف هوامش للأيقونة
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(Icons.error_outline),
              onPressed: () {},
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0,right: 23.0 ,bottom: 10.0),
              child: Text('اختر الجنسية', textAlign: TextAlign.right,
                  style:AppWidget.semiBoldTextFeildStyle3()
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < 3; i++) // تكرار الكود لثلاثة أزرار
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: i == 0 ? 0 : 4.0, right: i == 2 ? 0 : 4.0),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _selectedIndex = i; // تحديث الزر المُنقر عليه
                              _isNationalitySelected = true; // تحديث الحالة لتعكس اختيار الجنسية
                            });
                          },
                          child: Text(i == 0 ? 'اندونيسا' : i == 1 ? 'الفلبين' : 'اخرى',style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, fontFamily: 'Tajawal'),),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: _selectedIndex == i ? Colors.white : Colors.black, // تغيير لون النص بناءً على حالة الزر
                            backgroundColor: _selectedIndex == i ?  Color(0xFF030637) : Colors.white, // تغيير لون الخلفية بناءً على حالة الزر
                            minimumSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0), // تخفيف BorderRadius هنا
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),


            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0,right: 23.0 ,bottom: 10.0),
              child: Text('اختر المدة', textAlign: TextAlign.right,
                style:AppWidget.semiBoldTextFeildStyle3()

              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int i = 1; i < 7; i++) // تكرار الكود لستة أزرار
                  ElevatedButton(
                    onPressed: _isNationalitySelected ? () {
                      setState(() {
                        _selectedButtonValue = 7 - i; // تحديث قيمة الزر المختار
                        // إضافة الزر إلى القائمة المختارة أو إزالته
                        if (_selectedIndices.contains(i)) {
                          _selectedIndices.clear();
                        } else {
                          _selectedIndices.clear();
                          _selectedIndices.add(i);
                        }
                        _isDurationSelected = true;
                      });
                    } : null, // تعطيل الزر إذا لم يتم اختيار الجنسية
                    child: Text('${7 - i}', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, fontFamily: 'Tajawal')),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: _selectedIndices.contains(i) ? Colors.white : Colors.black,
                      backgroundColor: _selectedIndices.contains(i) ? Color(0xFF030637) : Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      minimumSize: Size(55, 35),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
              ],
            ),
            // إضافة مسافة بين الأزرار والنص
            // ويدجت Text لعرض قيمة الزر المختار

            SizedBox(
              height: 10.0,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 12.0,right: 23.0 ,bottom: 10.0),

              child: Text('اختر الفترة', textAlign: TextAlign.right
              ,style:AppWidget.semiBoldTextFeildStyle3()

              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: ElevatedButton(
                        onPressed: _isDurationSelected ? () {
                          setState(() {
                            _selectedPeriodIndex = 1; // تحديث الزر المُنقر عليه لـ "مساء"
                          });
                        } : null, // تعطيل الزر إذا لم تكن المدة محددة
                        child: Text('مساء',style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, fontFamily: 'Tajawal'),),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          foregroundColor: _selectedPeriodIndex == 1 ? Colors.white : Colors.black, // تغيير لون النص بناءً على حالة الزر
                          backgroundColor: _selectedPeriodIndex == 1 ? Color(0xFF030637) : Colors.white, // تغيير لون الزر إلى الأحمر إذا كان محددًا
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0), // تقليل BorderRadius هنا أيضًا
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: ElevatedButton(
                        onPressed: _isDurationSelected ? () {
                          setState(() {
                            _selectedPeriodIndex = 0; // تحديث الزر المُنقر عليه لـ "صباح"
                          });
                        } : null, // تعطيل الزر إذا لم تكن المدة محددة
                        child: Text('صباح',style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, fontFamily: 'Tajawal'),),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          foregroundColor: _selectedPeriodIndex == 0 ? Colors.white : Colors.black, // تغيير لون النص بناءً على حالة الزر
                          backgroundColor: _selectedPeriodIndex == 0 ? Color(0xFF030637) : Colors.white, // تغيير لون الزر إلى الأحمر إذا كان محددًا
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0), // تقليل BorderRadius هنا
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),



            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0,right: 23.0 ,bottom: 10.0),
              child: Text('اختر أيام الزيارات', textAlign: TextAlign.right,
                style:AppWidget.semiBoldTextFeildStyle3()

              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(days.length, (index) {
                return ElevatedButton(
                  onPressed: _selectedPeriodIndex != -1 ? () { // التحقق من تحديد الفترة قبل السماح بتحديد الأيام
                    setState(() {
                      if (_selectedDaysIndices.contains(index)) {
                        _selectedDaysIndices.remove(index);
                      } else if (_selectedDaysIndices.length < 3) {
                        _selectedDaysIndices.add(index);
                      }
                    });
                  } : null, // تعطيل الزر إذا لم تكن الفترة محددة
                  child: Text(
                    days[index],
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Tajawal',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedDaysIndices.contains(index) ? Color(0xFF030637) : Colors.white,
                    foregroundColor: _selectedDaysIndices.contains(index) ? Colors.white : Colors.black, // تغيير لون النص بناءً على حالة الزر
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5), // تقليل الحشوة لتصغير حجم الزر
                    minimumSize: Size(55, 45), // تحديد الحد الأدنى لحجم الزر
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // تقريب حواف الزر
                    ),
                  ),
                );
              }),
            ),
         // فاصل بين الأزرار والنص
            // ويدجت Text لعرض عدد الأزرار المختارة





              SizedBox(height: 20.0), // لإضافة مسافة قبل الزر
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _selectedDaysIndices.isNotEmpty ? () {
                  _pickDate(context);
                  setState(() {
                    _showColumns = true;  // تغيير قيمة المتغير لعرض الأعمدة
                  });
                } : null,
                child: Text(buttonText, style: AppWidget.semiBoldTextFeildStyle10()),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Color(0xFF030637),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),


        if (_showColumns) ...[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmationPage(
                      addressData: widget.addressData, // تأكد من أن هذا متوفر في النطاق الحالي
                      priceAfter: finalAmount,
                      averagePricePerVisit: averagePricePerVisit,
                      priceBefore: totalAmount,
                      packageNamess: 'الاساسية', // تمرير قيمة packageNamess هنا
                    ),
                  ),
                );
              },
          child: Column(
            children: [
              buildCustomContainer(
                packageNamess: ' الاساسية',
                visitCount: _selectedButtonValue * _selectedDaysIndices.length * 4,
                priceBefore: totalAmount,
                priceAfter: finalAmount,
                discount: '5%',
                freeChange: 'مرة واحدة مجانا',
                Cancellationfees: '200',
                Changethevisitdate: '25%',
                Averagepricepervisit: averagePricePerVisit,
                changeAddres: 'مرتين مجانا',
              ),
            ],
          ),
        ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmationPage(
                      addressData: widget.addressData, // تأكد من أن هذا متوفر في النطاق الحالي
                      priceAfter: finalAmount1,
                      averagePricePerVisit: finalAmount1 / (_selectedButtonValue * _selectedDaysIndices.length * 4),
                      priceBefore: totalAmount1,
                      packageNamess: 'القياسية', // تمرير قيمة packageNamess هنا
                    ),
                  ),
                );
              },
              child: Column(
                children: [
                  buildCustomContainer(
                      packageNamess: 'القياسية',
                      visitCount: _selectedButtonValue * _selectedDaysIndices.length * 4,
                      priceBefore: totalAmount1,
                      priceAfter: finalAmount1,
                      changeAddres: 'مرتين مجانا',
                      discount: '5%',
                      freeChange: 'مرتين مجانا',
                      Cancellationfees: '100',
                      Changethevisitdate: '50%',
                      Averagepricepervisit: finalAmount1 / (_selectedButtonValue * _selectedDaysIndices.length * 4)),
                ],
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmationPage(
                      addressData: widget.addressData, // تأكد من أن هذا متوفر في النطاق الحالي
                      priceAfter: finalAmount2,
                      averagePricePerVisit: finalAmount2 / (_selectedButtonValue * _selectedDaysIndices.length * 4),
                      priceBefore: totalAmount2,
                      packageNamess: 'المرنة', // تمرير قيمة packageNamess هنا
                    ),
                  ),
                );
              },
              child: Column(
                children: [
                  buildCustomContainer(
                      packageNamess: 'المرنة',
                      visitCount: _selectedButtonValue * _selectedDaysIndices.length * 4,
                      priceBefore: totalAmount2,
                      priceAfter: finalAmount2,
                      changeAddres: 'ثلاث مرات مجانا',
                      discount: '5%',
                      freeChange: 'مرتين مجانا',
                      Cancellationfees: '50',
                      Changethevisitdate: '50%',
                      Averagepricepervisit: finalAmount2 / (_selectedButtonValue * _selectedDaysIndices.length * 4)),
                ],
              ),
            ),


          ], ],

        ),

      ),
    );
  }
  Widget buildCustomContainer(

      {

    required String packageNamess,
    required int visitCount,
    required double priceBefore,
    required double priceAfter,
    required String discount,
    required String freeChange,
    required String Cancellationfees,
    required String Changethevisitdate,
    required String changeAddres,
    required double Averagepricepervisit,
  }) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(10.0)), // إضافة BorderRadius هنا
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: Colors.blue, // هنا يمكنك تغيير اللون حسب اختيارك
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0), // تطبيق BorderRadius للزاوية العلوية اليسرى
                        topRight: Radius.circular(10.0), // تطبيق BorderRadius للزاوية العلوية اليمنى
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(right: 5.0, top: 10.0), // تحديد الهامش من اليمين والأعلى
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6), // توفير بعض المساحة حول النص

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end, // لتوسيط العناصر داخل الصف
                          children: [


                            Text(
                                ' عدد الزيارت ',
                                style: AppWidget.semiBoldTextFeildStyle9()
                            ),
                            Text(
                                visitCount.toString(),

                                style: AppWidget.semiBoldTextFeildStyle9()
                            ),
                            // مسافة بين النصوص
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6), // توفير بعض المساحة حول النص
                              child: Row( // استخدام Row لترتيب النصوص بجانب بعضها
                                children: [
                                  Text(':  ',
                                      style: AppWidget.semiBoldTextFeildStyle4()),
                                  Text(
                                    'الباقة${packageNamess}', // دمج النصين في نص واحد
                                    style: AppWidget.semiBoldTextFeildStyle4(),
                                  ),



                                  // يمكن إضافة المزيد من النصوص هنا إذا لزم الأمر
                                ],
                              ),
                            )

                          ],
                        ),
                      ),
                    )

                ),


                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 3, // يجعل النص يأخذ مساحة أكبر
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,

                          children: [

                            Text(
                                ' رس ',
                                textAlign: TextAlign.right,
                                style: AppWidget.semiBoldTextFeildStyle4()
                            ),

                            Text(
                                priceAfter.toStringAsFixed(2),
                                textAlign: TextAlign.right,
                                style: AppWidget.semiBoldTextFeildStyle4()
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2, // يجعل النص يأخذ مساحة أصغر
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                                'رس',
                                textAlign: TextAlign.right,
                                style: AppWidget.semiBoldTextFeildStyle5()
                            ),
                            Text(
                                priceBefore.toStringAsFixed(2),
                                textAlign: TextAlign.right,
                                style: AppWidget.semiBoldTextFeildStyle5()
                            ),
                          SizedBox(
                            width: 20.0,
                          )

                          ],
                        ),
                      )

                    ],
                  ),
                ),



                Padding(
                  padding: EdgeInsets.only(right: 15.0), // تحديد الهامش من اليمين بـ 20.0
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end, // لبدء النصوص من اليمين
                    children: [

                      Expanded(
                        flex: 3, // يجعل النص يأخذ مساحة أصغر
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end, // لتوسيط النصوص أفقيًا من اليمين
                          children: [
                            Text(
                                ' رس ',
                                textAlign: TextAlign.right,
                                style: AppWidget.semiBoldTextFeildStyle8
                                  ()
                            ),
                            Text(
                                Averagepricepervisit.toStringAsFixed(2),
                                textAlign: TextAlign.right,
                                style: AppWidget.semiBoldTextFeildStyle8()
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                                ' متوسط سعر الزيارة',
                                textAlign: TextAlign.right, // لبدء النص من اليمين داخل الجزء المخصص له
                                style: AppWidget.semiBoldTextFeildStyle8()
                            ),

                            // يمكن إضافة المزيد من النصوص هنا إذا لزم الأمر
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1, // يجعل النص يأخذ مساحة أكبر
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end, // لتوسيط النصوص أفقيًا من اليمين

                          children: [
                            Text(
                                discount,
                                textAlign: TextAlign.right, // لبدء النص من اليمين داخل الجزء المخصص له
                                style: AppWidget.semiBoldTextFeildStyle8()
                            ),
                            Text(
                                ' خصم+ ',
                                textAlign: TextAlign.right, // لبدء النص من اليمين داخل الجزء المخصص له
                                style: AppWidget.semiBoldTextFeildStyle8()
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),



                Divider(color: Colors.white, height: 20), // خط فاصل
                Padding(
                    padding: const EdgeInsets.only(left: 5.0,right: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // توزيع الأيقونات على الصف بالكامل
                      children: [
                        Expanded( // استخدام Expanded للتوزيع بالتساوي
                          flex: 1, // نفس القيمة للتوزيع المتساوي
                          child: Column( // عمود للأيقونة الأولى والنصوص
                            children: [
                              Icon(Icons.cancel, color: Colors.white, size: 50), // أيقونة بحجم كبير
                              Text('رسوم الغاء', style: AppWidget.semiBoldTextFeildStyle6()),
                              Text(Cancellationfees, style: AppWidget.semiBoldTextFeildStyle7()),
                            ],
                          ),
                        ),
                        Expanded( // استخدام Expanded للتوزيع بالتساوي
                          flex: 1, // نفس القيمة للتوزيع المتساوي
                          child: Column( // عمود للأيقونة الثانية والنصوص
                            children: [
                              Icon(Icons.location_on, color: Colors.white, size: 50), // أيقونة بحجم كبير
                              Text('تغيير العنوان', style: AppWidget.semiBoldTextFeildStyle6()),
                              Text(changeAddres, style: AppWidget.semiBoldTextFeildStyle7()),
                            ],
                          ),
                        ),
                        Expanded( // استخدام Expanded للتوزيع بالتساوي
                          flex: 1, // نفس القيمة للتوزيع المتساوي
                          child: Column( // عمود للأيقونة الثالثة والنصوص
                            children: [
                              Icon(Icons.work_outline, color: Colors.white, size: 50), // أيقونة بحجم كبير
                              Text('تغيير الموعد', style: AppWidget.semiBoldTextFeildStyle6()),
                              Text( Changethevisitdate + ' من الزيارات', style: AppWidget.semiBoldTextFeildStyle7()),



                            ],
                          ),
                        ),
SizedBox(
  height: 100.0,
)
                   ],
                    )

                )

              ],
            ),
          ),

        ],
      ),
    );
  }
  void updateResult() {
    setState(() {
      _result = _selectedButtonValue * _selectedDaysIndices.length; // ضرب قيمة الزر في عدد الأيام المختارة
    });
  }
}
