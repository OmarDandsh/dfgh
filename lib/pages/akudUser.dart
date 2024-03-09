import 'package:flutter/material.dart';

import '../widget/widget_support.dart';

class MyContractsPage extends StatefulWidget {
  @override
  _MyContractsPageState createState() => _MyContractsPageState();
}

class _MyContractsPageState extends State<MyContractsPage> {
  bool news = true;
  bool old = false;
  String selectedFilter = "الكل"; // المتغير لتخزين الخيار المختار

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Directionality(
          textDirection: TextDirection.rtl, // لجعل النص يظهر من اليمين لليسار
          child: AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text('الكل'),
                  onTap: () {
                    setState(() {
                      selectedFilter = 'الكل';
                    });
                    Navigator.of(context).pop(); // لإغلاق الحوار
                  },
                ),
                ListTile(
                  title: Text('عقود بالساعات'),
                  onTap: () {
                    setState(() {
                      selectedFilter = 'عقود بالساعات';
                    });
                    Navigator.of(context).pop(); // لإغلاق الحوار
                  },
                ),
                ListTile(
                  title: Text('عقود مقيمة'),
                  onTap: () {
                    setState(() {
                      selectedFilter = 'عقود مقيمة';
                    });
                    Navigator.of(context).pop(); // لإغلاق الحوار
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: Text(
                "عقودي",
                style: AppWidget.TitlePap(),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      news = false;
                      old = true;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      border: old ? Border(bottom: BorderSide(color: Colors.black.withOpacity(0.2), width: 1)) : null,
                    ),
                    child: Text(
                      "النشطة",
                      style: TextStyle(
                        color: Color(0xFF030637),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'ElMessiri',
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 80),
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      news = true;
                      old = false;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      border: news ? Border(bottom: BorderSide(color: Colors.black.withOpacity(0.2), width: 1)) : null,
                    ),
                    child: Text(
                      "المنتهيه",
                      style: TextStyle(
                        color: Color(0xFF030637),
                        fontFamily: 'ElMessiri',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1.5,
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: _showFilterDialog, // إظهار الحوار عند النقر على النص "الكل"
                  child: Row(
                    children: [
                      Icon(Icons.filter_alt, color: Color(0xFF030637)),
                      SizedBox(width: 8),
                      Text(
                        selectedFilter, // عرض النص بناءً على الخيار المختار
                        style: TextStyle(
                          color: Color(0xFF030637),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'ElMessiri',
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "نوع الخدمة",
                  style: TextStyle(
                    color: Color(0xFF030637),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'ElMessiri',
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1.5,
            height: 30.0,
          ),
          // هنا يمكنك إضافة باقي واجهة الصفحة
        ],
      ),
    );
  }
}
