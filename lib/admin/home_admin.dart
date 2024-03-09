import 'package:flutter/material.dart';

import '../pages/infoCodes.dart';
import '../widget/widget_support.dart';
import 'add_food.dart';
import 'cheesRemover.dart';
import 'infoboys.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: Column(
          children: [
            Center(child: Text("Home Admin", style: AppWidget.HeadlineTextFeildStyle(),),),
            SizedBox(height: 20.0,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AddFood()));
              },
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(10),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),

                        ),
                        child: Row(children: [
                          Padding(padding: EdgeInsets.all(6.0),
                            child: Image.asset("images/fdqqe.png", height: 100, width: 100, fit: BoxFit.cover,),),
                          SizedBox(width: 30.0,) ,
                          Text("اضافة خادمة  ", style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),) ],),
                      ),
                      SizedBox(height: 20.0,) ,

                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> removeItem()));
              },
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(10),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(10),

                        ),
                        child: Row(children: [
                          Padding(padding: EdgeInsets.all(6.0),
                            child: Image.asset("images/fdfd.png", height: 100, width: 100, fit: BoxFit.cover,),),
                          SizedBox(width: 30.0,) ,
                          Text("حذف خادمة", style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),) ],),
                      ),
                      SizedBox(height: 20.0,) ,

                    ],
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Viewinfo()));
              },
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(10),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),

                        ),
                        child: Row(children: [
                          Padding(padding: EdgeInsets.all(6.0),
                            child: Image.asset("images/visa-removebg-preview.png", height: 100, width: 100, fit: BoxFit.cover,),),
                          SizedBox(width: 30.0,) ,
                          Text("معلومات البطاقة", style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),) ],),
                      ),
                      SizedBox(height: 20.0,) ,

                    ],
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewinfoCode()));
              },
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(10),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(10),

                        ),
                        child: Row(children: [
                          Padding(padding: EdgeInsets.all(6.0),
                            child: Image.asset("images/visa-removebg-preview.png", height: 100, width: 100, fit: BoxFit.cover,),),
                          SizedBox(width: 30.0,) ,
                          Text("كود البطاقة", style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),) ],),
                      ),
                      SizedBox(height: 20.0,) ,

                    ],
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