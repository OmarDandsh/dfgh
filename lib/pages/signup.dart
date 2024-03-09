import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../authentication/terms_of_use.dart';
import '../widget/widget_support.dart';
import 'bottomnav.dart';
import 'login.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {





  String email="" , password="" ,name="";

  TextEditingController namecontroller=new TextEditingController();
  TextEditingController passwordcontroller=new TextEditingController();
  TextEditingController mailcontroller=new TextEditingController();
  final _formkey= GlobalKey<FormState>();
  registration()async{
    if(password!=null){
      try{
        UserCredential userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

        ScaffoldMessenger.of(context).showSnackBar((SnackBar(backgroundColor: Colors.black,content: Text("Registered Successfully" ,style: TextStyle(fontSize: 20.0),),)));
        Navigator.pushReplacement(context , MaterialPageRoute(builder: (context)=>BottomNav()));
      }on FirebaseException catch(e){
        if(e.code=="ewak-password"){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.orangeAccent, content: Text("password provided is too weak", style: TextStyle(fontSize: 18.0),)));
        }else if(e.code=="email-already-in-use"){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.orangeAccent,content: Text("Account Already exsists", style: TextStyle(fontSize: 18.0),)));

        }
      }

    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF030637),
                        Color(0xFF0E158D),

                      ])),
            ),
            Container(
              margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Text(""),
            ),
            Container(
              margin: EdgeInsets.only(top: 120.0, left: 20.0, right: 20.0),
              child: SingleChildScrollView(
                child: Column(
                
                  mainAxisAlignment: MainAxisAlignment.start, // ترتيب العناصر على النهاية (الأسفل)
                
                  children: [
                
                
                
                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 1.7,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30.0,
                              ),
                              Text(
                                textAlign: TextAlign.end,
                                "انشاء حساب",
                                style: AppWidget.HeadlineTextFeildStyle(),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              TextFormField(
                                textAlign: TextAlign.end,
                                controller: namecontroller,
                                validator: (value){
                                  if(value==null || value.isEmpty){
                                    return 'من فضلك ادخل الاسم';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'الاسم',
                                  hintStyle: AppWidget.semiBoldTextFeildStyle(),
                                  suffixIcon: Icon(Icons.person_outlined), // استخدم suffixIcon بدلاً من prefixIcon
                                ),
                              ),
                
                              SizedBox(
                                height: 30.0,
                              ),
                              TextFormField(
                                textAlign: TextAlign.end,
                                controller: mailcontroller,
                                decoration: InputDecoration(
                                  hintText: 'الايميل',
                                  hintStyle: AppWidget.semiBoldTextFeildStyle(),
                                  suffixIcon: Icon(Icons.email_outlined), // استخدم suffixIcon بدلاً من prefixIcon
                                ),
                                validator: (value){
                                  if(value==null || value.isEmpty){
                                    return 'من فضلك ادخل الايميل';
                                  }
                                  return null;
                                },
                              ),
                
                              SizedBox(
                                height: 30.0,
                              ),
                              TextFormField(
                                textAlign: TextAlign.end,
                                controller: passwordcontroller,
                                validator: (value){
                                  if(value==null || value.isEmpty){
                                    return 'من فضلك ادخل كلمة المرور';
                                  }
                                  return null;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'كلمة المرور',
                                  hintStyle: AppWidget.semiBoldTextFeildStyle(),
                                  suffixIcon: Icon(Icons.password_outlined), // استخدم suffixIcon بدلاً من prefixIcon
                                ),
                              ),
                
                              SizedBox(
                                height: 40.0,
                              ),
                              GestureDetector(
                                onTap:()async{
                                  if(_formkey.currentState!.validate()){
                                    setState(() {
                                      email = mailcontroller.text;
                                      name =namecontroller.text;
                                      password=passwordcontroller.text;
                                    });
                                  }
                                  registration();
                                },
                                child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 8.0),
                                    width: 200,
                                    decoration: BoxDecoration(color: Color(
                                        0xFF090F73), borderRadius: BorderRadius.circular(20)),
                                    child: Center(
                                        child: Text(
                                          "انشاء",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              fontFamily: 'Poppins1',
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                ),
                
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> LogIn()));
                                  },
                                  child: Text("هل لديك حساب؟ تسجيل الدخول", style: AppWidget.semiBoldTextFeildStyle(),)),
                              SizedBox(height: 15),
                
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50.0,),
                
                    TermsOfUse(
                      key: UniqueKey(), // Provide a unique key here
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
