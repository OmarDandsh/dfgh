  import 'package:flutter/material.dart';
import 'package:flutterdelivery1/pages/pagdetilels%5Boyakad.dart';
  import 'package:flutterdelivery1/pages/pagdetilespoy.dart';
  import 'package:intl/intl.dart';

  import '../widget/widget_support.dart';
  import 'details.dart'; // تأكد من إضافة intl إلى pubspec.yaml

  class ChessBaka1 extends StatefulWidget {

    final Map<String, String> addressData; // تعريف المتغير هنا

    ChessBaka1({required this.addressData}); // تمرير البيانات عبر البنّاء

    @override
    _ChessBaka1State createState() => _ChessBaka1State();
  }

  class _ChessBaka1State extends State<ChessBaka1> {

    int _selectedPeriodIndex = -1;
    int _selectedButtonValue = 0;
    List<int> _selectedIndices = [];
    double _finalPrice = 0.0;
    double _kasem = 0.0;


    @override
    Widget build(BuildContext context) {

      String priceText = widget.addressData.containsKey('price') ? widget.addressData['price'].toString() : 'غير محدد';





      return Scaffold(
        backgroundColor: Color(0xFFE8E8FD), // لون خلفية AppBar

        appBar:AppBar(
          backgroundColor: Color(0xFFE8E8FD), // لون خلفية AppBar

          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_outlined,),
            onPressed: () => Navigator.pop(context),
          ),
          title: Center( // يوسط النص داخل AppBar
            child: Text('مقيمة'),
          ),
          actions: [
            Padding(
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
                child: Text('نوع الدفع', textAlign: TextAlign.right,
                    style:AppWidget.semiBoldTextFeildStyle3()
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ElevatedButton(
                        onPressed:  () {
                          setState(() {
                            _selectedPeriodIndex = 1; // تحديث الزر المُنقر عليه لـ "مساء"
                          });
                        } , // تعطيل الزر إذا لم تكن المدة محددة
                        child: Text('دفعات شهرية',style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, fontFamily: 'Tajawal'),),
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
                      padding: const EdgeInsets.only(right: 20.0),
                      child: ElevatedButton(
                        onPressed:  () {
                          setState(() {
                            _selectedPeriodIndex = 0;

                          });
                        }, // تعطيل الزر إذا لم تكن المدة محددة
                        child: Text('كامل المبلغ',style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, fontFamily: 'Tajawal'),),
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
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0,right: 23.0 ,bottom: 10.0),
                child: Text('اختر المدة بالشهر', textAlign: TextAlign.right,
                    style:AppWidget.semiBoldTextFeildStyle3()

                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int value in [3, 6, 12, 24].reversed)
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedButtonValue = value;
                          double price = double.tryParse(widget.addressData['price']!) ?? 0;
                          _finalPrice = value * price;

                          if (_selectedPeriodIndex == 0) { // كامل المبلغ
                            _kasem = _finalPrice - (_finalPrice * 0.20); // خصم 20%
                          } else if (_selectedPeriodIndex == 1) { // دفعات شهرية
                            _kasem = _finalPrice - (_finalPrice * 0.15); // خصم 15%
                          }
                        });
                      },
                      // هنا يتم إضافة ال child
                      child: Text('$value', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, fontFamily: 'Tajawal')),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: _selectedButtonValue == value ? Colors.white : Colors.black, // تغيير لون النص بناءً على حالة الزر
                        backgroundColor: _selectedButtonValue == value ? Color(0xFF030637) : Colors.white, // تغيير لون الزر بناءً على حالة الاختيار
                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 16),
                        minimumSize: Size(85, 35),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                ],
              ),


              SizedBox(
                height: 20.0,
              ),
             if (_selectedPeriodIndex == 0 && _selectedButtonValue > 0) ...[
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'مبلغ الدفعة الشهرية: $priceText رس ',
                      style: AppWidget.semiBoldTextFeildStyle14(),
                    ),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Align(
                    alignment: Alignment.centerRight, // محاذاة النص لليمين
                    child: Text(
                      ' مبلغ كامل العقد: ${_finalPrice.toStringAsFixed(2)} رس ',
                      style: AppWidget.semiBoldTextFeildStyle14()
                    ),
                  ),
                ),
               Divider(),
               Padding(
                 padding: const EdgeInsets.all(14.0),
                 child: Align(
                   alignment: Alignment.centerRight,
                   child: Text(
                       '%الخصم :  20 ',
                       style: AppWidget.semiBoldTextFeildStyle14()
                   ),
                 ),
               ),

                Divider(), // إضافة Divider أسفل النص
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '   مبلغ كامل العقد بعد الخصم: ${_kasem.toStringAsFixed(2)} رس ',
                      style: AppWidget.semiBoldTextFeildStyle14()
                    ),
                  ),
                ),
                Divider(),


              ],if (_selectedPeriodIndex == 1 && _selectedButtonValue > 0) ...[
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'مبلغ الدفعة الشهرية: ${priceText} رس',
                      style: AppWidget.semiBoldTextFeildStyle14(),
                    ),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '%الخصم: 15',
                      style: AppWidget.semiBoldTextFeildStyle14(),
                    ),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'مبلغ الدفعة بعد الخصم: ${_kasem.toStringAsFixed(2)} رس',
                      style: AppWidget.semiBoldTextFeildStyle14(),
                    ),
                  ),
                ),
                Divider(),
              ],

              SizedBox(height: 20.0), // لإضافة مسافة قبل الزر
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: (_selectedPeriodIndex >= 0 && _selectedButtonValue > 0) ? () {
                    // تحديد نوع الدفع
                    String paymentTypeText = _selectedPeriodIndex == 0 ? 'دفعة كاملة' : 'دفعات شهرية';

                    // التنقل إلى صفحة ConfirmationPageAkad مع تمرير البيانات
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfirmationPageAkad(
                          addressData: widget.addressData,
                          selectedMonths: _selectedButtonValue,
                          kasem: _kasem,
                          priceText: priceText,
                          finalPrice: _finalPrice,
                          paymentType: paymentTypeText,
                        ),
                      ),
                    );
                  } : null,
                  child: Text('تأكيد الاختيار', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Color(0xFF030637),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),






            ],

          ),

        ),
      );
    }

  }
