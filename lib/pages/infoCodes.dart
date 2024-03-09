
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../service/database.dart';
import '../widget/widget_support.dart';

class ViewinfoCode extends StatefulWidget {
  const ViewinfoCode({super.key});
  @override
  State<ViewinfoCode> createState() => _ViewinfoCodeState();
}
class _ViewinfoCodeState extends State<ViewinfoCode> {
  Stream? ViewinfoCodeboys;
  @override

  ontheload()async {
    ViewinfoCodeboys = await DatabaseMethods().getFoodItem1("codecard");
    setState(() {
    });
  }
  @override
  void initState() {

    ontheload();
    super.initState();
  }
  Widget allItemsVerticalldfy(){

    return StreamBuilder(stream: ViewinfoCodeboys, builder: (context ,AsyncSnapshot snapshot){
      return snapshot.hasData? ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data.docs.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context , index){
            DocumentSnapshot ds=snapshot.data.docs[index];
            return Container(
              margin: EdgeInsets.all( 10),

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
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                // افترض أن لديك وظيفة تسمى deleteFoodItem تأخذ معرف العنصر
                                DatabaseMethods().deleteFoodItem("codecard",ds.id);
                              },
                            ),
                            Text(
                              " الكود  ",
                              style: AppWidget.semiBoldTextFeildStyle12(),
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
                              " كود البطاقة",
                              style: AppWidget.semiBoldTextFeildStyle12(),
                            ),
                            Text(ds['codess'],  style: AppWidget.semiBoldTextFeildStyle13(),),

                          ],
                        ),

                        Divider(
                          thickness: 1.0,
                        ),



                        SizedBox(
                          height: 15.0,
                        ),




                      ],
                    ),
                  ),
                ],
              ),
            );

          }):CircularProgressIndicator();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEFEFE),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.0,
              ),
              allItemsVerticalldfy(),
              //   allItemsVertically1(),
            ],
          ),
        ),
      ),
    );

  }
}