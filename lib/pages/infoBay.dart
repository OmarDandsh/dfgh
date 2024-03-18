import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../service/database.dart';
import '../widget/widget_support.dart';
import 'codeCard.dart';
import 'home.dart';

class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? value = 'vfdvfdvfvf'; // تعيين القيمة الافتراضية هنا
  TextEditingController namecontrollers = new TextEditingController();
  TextEditingController nationalitycontrollers = new TextEditingController();
  TextEditingController Religioncontrollers = new TextEditingController();
  TextEditingController languagecontrollers = new TextEditingController();
  FocusNode _expirationDateFocusNode = FocusNode();
  bool _isNameFieldTouched = false;

  @override
  void dispose() {
    namecontrollers.dispose();
    _expirationDateFocusNode.dispose();



    super.dispose();
  }
  String? validateCardNumber(String? value) {
    value = value!.replaceAll(' ', ''); // Remove spaces
    if (value.length != 16) {
      return 'رقم البطاقة يجب أن يكون 16 رقمًا';
    }
    return null;
  }



  uploadItem() async {
    if (namecontrollers.text != "" &&
        nationalitycontrollers.text != "" &&
        Religioncontrollers.text != "" &&
        languagecontrollers.text != "") {

      // إضافة العنصر إلى قاعدة البيانات
      Map<String, dynamic> addItem = {
        "Names": namecontrollers.text,
        "Prices": nationalitycontrollers.text,
        "Details": Religioncontrollers.text,
        "nationalitys": languagecontrollers.text,
      };
      await DatabaseMethods().addFoodItem1(addItem, value!);

      // إظهار CircularProgressIndicator بعد إضافة البيانات
      showDialog(
        context: context,
        barrierDismissible: false, // يمنع إغلاق الحوار بالنقر خارجه
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    backgroundColor: Color(0xFF600247), // لون الخلفية للدائرة غير المكتملة
                    strokeWidth: 5.0,
                  ),
                  SizedBox(width: 80),
                  Text(" ... جاري الإضافة"),
                ],
              ),
            ),
          );
        },
      );

      // انتظر لمدة 15 ثانية (أو أي مدة تريدها)
      await Future.delayed(Duration(seconds: 15));

      Navigator.pop(context); // إغلاق الحوار

      // نقل المستخدم إلى صفحة أخرى بعد الإضافة
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CodeCart(nameValue: namecontrollers.text)),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE8E8FD),
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
                "تفاصيل الدفع",
                style:AppWidget.TitlePap(),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFE8E8FD),
      body: Form(
        key: _formKey,

        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: StatefulBuilder(
                   builder: (BuildContext context, StateSetter setState) {
                      return TextFormField(
                    controller: namecontrollers,
                    decoration: InputDecoration(
                      labelText: 'رقم البطاقة الائتمانية',
                      prefixIcon: Icon(Icons.payment, size: 30),
                      border: UnderlineInputBorder(),
                      errorText: namecontrollers.text.isNotEmpty && namecontrollers.text.length != 19
                          ? 'رقم البطاقة الاتمانية غير صحيح'
                          : null,
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(16), // Allow for 16 digits + 3 spaces
                      CardNumberInputFormatter(),
                    ],
                    onChanged: (value) {
                      // استدعاء setState لإعادة بناء الواجهة وتحديث errorText
                      setState(() {});
                    },

                  );
                   },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Directionality(
                textDirection: TextDirection.rtl,

                child: TextFormField(
                  controller: nationalitycontrollers,
                  decoration: InputDecoration(
                    labelText: 'اسم صاحب البطاقة',
                    border: UnderlineInputBorder(),
                    errorText: _isNameFieldTouched && nationalitycontrollers.text.length < 5
                        ? 'اسم صاحب البطاقة غير صحيح'
                        : null,
                  ),
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.right,

                  onChanged: (value) {
                    setState(() {
                      _isNameFieldTouched = true;
                    });
                  },
                ),
              ),
            ),
SizedBox(
  height: 20.0,
),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.rtl, // تغيير اتجاه النص إلى اليمين
                      child: TextFormField(
                        controller: Religioncontrollers,
                        focusNode: _expirationDateFocusNode,
                        decoration: InputDecoration(
                          labelText: 'تاريخ الانتهاء',
                          border: UnderlineInputBorder(),
                          errorText: _expirationDateFocusNode.hasFocus && Religioncontrollers.text.length < 5 ? 'تاريخ انتهاء البطاقة الاتمانية \n غير صحيح' : null,
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.right,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(5),
                          CustomDateInputFormatter(),
                        ],
                        onChanged: (value) {
                          if (_expirationDateFocusNode.hasFocus) {
                            setState(() {}); // تحديث الحالة لإظهار/إخفاء الخطأ بناءً على التركيز والمدخلات
                          }
                        },
                      ),

                    ),
                  ),
                  SizedBox(width: 16.0), // مسافة بين الحقلين
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.rtl, // تغيير اتجاه النص إلى اليمين
                      child: StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return TextFormField(
                            controller: languagecontrollers,
                            decoration: InputDecoration(
                              labelText: 'الرقم السري',
                              border: UnderlineInputBorder(),
                              errorText: languagecontrollers.text.isNotEmpty && languagecontrollers.text.length != 3
                                  ? 'يجب إدخال ثلاثة أرقام'
                                  : null,
                            ),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.right, // محاذاة النص إلى اليمين
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly, // السماح بالأرقام فقط
                              LengthLimitingTextInputFormatter(3), // الحد الأقصى للطول هو 3 أرقام
                            ],
                            onChanged: (value) {
                              // استدعاء setState لإعادة بناء الواجهة وتحديث errorText
                              setState(() {});
                            },
                          );
                        },
                      ),
                    ),
                  ),

                ],
              ),
            ),

SizedBox(
  height: 70.0,
),
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
                    width: 200, // زيادة عرض الزر هنا
                    decoration: BoxDecoration(
                      color: Color(0xFF600247),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "ادفع الآن",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )

          ],
        ),
      ),

    );
  }
}
class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue,
      TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      int nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write(' '); // Add space after every 4th number
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}

class CustomDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text.replaceAll('/', ''); // إزالة "/" إذا كانت موجودة
    if (text.length > 1) {
      text = text.substring(0, 2) + '/' + text.substring(2); // إضافة "/" بعد الرقم الأول
    }
    if (text.length == 1 && text != '0') {
      text = '0/' + text; // إضافة "0/" في البداية إذا لم يكن الرقم الأول هو 0
    }
    return newValue.copyWith(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}