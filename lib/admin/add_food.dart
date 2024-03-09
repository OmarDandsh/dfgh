import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

import '../service/database.dart';
import '../widget/widget_support.dart';

class AddFood extends StatefulWidget {
  const AddFood({super.key});

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  final List<String> fooditems = ['عقد منتهي', 'عقد جديد'];
  String? value;
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController nationalitycontroller = new TextEditingController();
  TextEditingController Religioncontroller = new TextEditingController();
  TextEditingController languagecontroller = new TextEditingController();
  TextEditingController Experiencecontroller = new TextEditingController();
  TextEditingController pricecontroller = new TextEditingController();
  TextEditingController detailcontroller = new TextEditingController();
  TextEditingController maritalstatuscontroller = new TextEditingController();
  TextEditingController agsfsecontroller = new TextEditingController();
  TextEditingController Gendercontroller = new TextEditingController();
  TextEditingController brethcontroller = new TextEditingController();
  TextEditingController hightcontroller = new TextEditingController();
  TextEditingController tallscontroller = new TextEditingController();


  final ImagePicker _picker = ImagePicker();

  File? selectedImage;

  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);

    selectedImage = File(image!.path);
    setState(() {});
  }

  uploadItem() async {
    if (selectedImage != null &&

        namecontroller.text != "" &&
        pricecontroller.text != "" &&
        detailcontroller.text != "" &&
        Religioncontroller.text != "" &&
        languagecontroller.text != "" &&
        Experiencecontroller.text != "" &&
        maritalstatuscontroller.text != "" &&
        agsfsecontroller.text != "" &&
        Gendercontroller.text != "" &&
        brethcontroller.text != "" &&
        hightcontroller.text != "" &&
        tallscontroller.text != "" &&
        nationalitycontroller.text != ""

    ) {
      String addId = randomAlphaNumeric(10);

      Reference firebaseStorageRef =
      FirebaseStorage.instance.ref().child("blogImages").child(addId);
      final UploadTask task = firebaseStorageRef.putFile(selectedImage!);


      var downloadUrl = await (await task).ref.getDownloadURL();

      Map<String, dynamic> addItem = {
        "Image": downloadUrl,

        "Name": namecontroller.text,
        "Price": pricecontroller.text,
        "Detail": detailcontroller.text,
        "nationality": nationalitycontroller.text,
        "Religion": Religioncontroller.text,
        "Experience": Experiencecontroller.text,
        "language": languagecontroller.text,
        "maritalstatus": maritalstatuscontroller.text,
        "age": agsfsecontroller.text,
        "Gender": Gendercontroller.text,
        "breth": brethcontroller.text,
        "higtht": hightcontroller.text,
        "talls": tallscontroller.text,

      };
      await DatabaseMethods().addFoodItem(addItem, value!).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "تم اضافة الخادمة بنجاح",
              style: TextStyle(fontSize: 18.0),
            )));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Color(0xFF373866),
            )),
        centerTitle: true,
        title: Text(
          "اضافة عاملة",
          style: AppWidget.HeadlineTextFeildStyle(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin:
          EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 50.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end, // توجيه العناصر من اليمين إلى اليسار

                children: [
                  Text(
                    "حمل الصورة",
                    style: AppWidget.semiBoldTextFeildStyle(),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              selectedImage == null
                  ? GestureDetector(
                onTap: () {
                  getImage();
                },
                child: Center(
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        border:
                        Border.all(color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              )
                  : Center(
                child: Material(
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(
                        selectedImage!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),


              SizedBox(
                height: 30.0,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end, // توجيه العناصر من اليمين إلى اليسار
                children: [
                  Text(
                    "اسم العاملة",
                    style: AppWidget.semiBoldTextFeildStyle(),
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
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  textAlign: TextAlign.end, // تحديد اتجاه النص

                  controller: namecontroller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "ادخل اسم العاملة",
                      hintStyle: AppWidget.LightTextFeildStyle()),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end, // توجيه العناصر من اليمين إلى اليسار
                children: [
                  Text(
                    "الوزن",
                    style: AppWidget.semiBoldTextFeildStyle(),
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
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  textAlign: TextAlign.end, // تحديد اتجاه النص

                  controller: hightcontroller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "الوزن",
                      hintStyle: AppWidget.LightTextFeildStyle()),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end, // توجيه العناصر من اليمين إلى اليسار
                children: [
                  Text(
                    "الطول",
                    style: AppWidget.semiBoldTextFeildStyle(),
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
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  textAlign: TextAlign.end, // تحديد اتجاه النص

                  controller: tallscontroller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "الطول",
                      hintStyle: AppWidget.LightTextFeildStyle()),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end, // توجيه العناصر من اليمين إلى اليسار
                children: [
                  Text(
                    "تاريخ الميلاد",
                    style: AppWidget.semiBoldTextFeildStyle(),
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
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  textAlign: TextAlign.end, // تحديد اتجاه النص

                  controller: brethcontroller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "تاريخ الميلاد",
                      hintStyle: AppWidget.LightTextFeildStyle()),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end, // توجيه العناصر من اليمين إلى اليسار
                children: [
                  Text(
                    "عمر العاملة",
                    style: AppWidget.semiBoldTextFeildStyle(),
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
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  textAlign: TextAlign.end, // تحديد اتجاه النص

                  controller: agsfsecontroller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "ادخل عمر العاملة",
                      hintStyle: AppWidget.LightTextFeildStyle()),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end, // توجيه العناصر من اليمين إلى اليسار
                children: [
                  Text(
                    "الجنس",
                    style: AppWidget.semiBoldTextFeildStyle(),
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
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  textAlign: TextAlign.end, // تحديد اتجاه النص

                  controller: Gendercontroller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "  الجنس",
                      hintStyle: AppWidget.LightTextFeildStyle()),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end, // توجيه العناصر من اليمين إلى اليسار
                children: [
                  Text(
                    "جنسية العاملة",
                    style: AppWidget.semiBoldTextFeildStyle(),
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
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  textAlign: TextAlign.end, // تحديد اتجاه النص

                  controller: nationalitycontroller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "جنسية العاملة",
                      hintStyle: AppWidget.LightTextFeildStyle()),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end, // توجيه العناصر من اليمين إلى اليسار
                children: [
                  Text(
                    "الديانة",
                    style: AppWidget.semiBoldTextFeildStyle(),
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
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  textAlign: TextAlign.end, // تحديد اتجاه النص

                  controller: Religioncontroller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: " ادخل ديانة العاملة",
                      hintStyle: AppWidget.LightTextFeildStyle()),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end, // توجيه العناصر من اليمين إلى اليسار
                children: [
                  Text(
                    "سنوات الخبرة",
                    style: AppWidget.semiBoldTextFeildStyle(),
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
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  textAlign: TextAlign.end, // تحديد اتجاه النص

                  controller: Experiencecontroller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: " ادخل مدة خبرة العاملة",
                      hintStyle: AppWidget.LightTextFeildStyle()),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end, // توجيه العناصر من اليمين إلى اليسار
                children: [
                  Text(
                    "اللغة",
                    style: AppWidget.semiBoldTextFeildStyle(),
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
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  textAlign: TextAlign.end, // تحديد اتجاه النص

                  controller: languagecontroller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: " ادخل لغة العاملة",
                      hintStyle: AppWidget.LightTextFeildStyle()),
                ),
              ),

              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end, // توجيه العناصر من اليمين إلى اليسار

                children: [
                  Text(
                    " الدفعة الشهرية",
                    style: AppWidget.semiBoldTextFeildStyle(),
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
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  textAlign: TextAlign.end, // تحديد اتجاه النص
                  controller: pricecontroller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "ادخل المبلغ",
                      hintStyle: AppWidget.LightTextFeildStyle()),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end, // توجيه العناصر من اليمين إلى اليسار

                children: [
                  Text(
                    "الحالة الاجتماعية",
                    style: AppWidget.semiBoldTextFeildStyle(),
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
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  textAlign: TextAlign.end, // تحديد اتجاه النص
                  controller: maritalstatuscontroller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: " ادخل اعزب ام متزوج",
                      hintStyle: AppWidget.LightTextFeildStyle()),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),

              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end, // توجيه العناصر من اليمين إلى اليسار

                children: [

                  Text(
                    "تفاصيل عن العاملة",
                    style: AppWidget.semiBoldTextFeildStyle(),
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
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  textAlign: TextAlign.end, // تحديد اتجاه النص
                  maxLines: 5,
                  controller: detailcontroller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "ادخل التفاصيل",
                      hintStyle: AppWidget.LightTextFeildStyle()),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end, // توجيه العناصر من اليمين إلى اليسار

                children: [
                  Text(
                    "اختر نوع العقد",
                    style: AppWidget.semiBoldTextFeildStyle(),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      items: fooditems
                          .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style:
                            TextStyle(fontSize: 18.0, color: Colors.black),
                          )))
                          .toList(),
                      onChanged: ((value) => setState(() {
                        this.value = value;
                      })),
                      dropdownColor: Colors.white,
                      hint: Text("Select Category"),
                      iconSize: 36,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      value: value,
                    )),
              ),
              SizedBox(
                height: 30.0,
              ),
              GestureDetector(
                onTap: (){
                  uploadItem();
                },
                child: Center(
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "Add",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}