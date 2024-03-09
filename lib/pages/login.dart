import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdelivery1/pages/signup.dart';

import '../admin/admin_login.dart';
import '../widget/widget_support.dart';
import 'home.dart';


class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();

}

class _LogInState extends State<LogIn> {

  String email="" , password="" ;
  final _formkey= GlobalKey<FormState>();


  TextEditingController userpasswordcontroller=new TextEditingController();
  TextEditingController usermailcontroller=new TextEditingController();

  userLogin()async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home())
      );
    } on FirebaseException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text("No user Founf", style: TextStyle(fontSize: 18.0),)));
      } else if (e.code == "worng-password") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "worng password ", style: TextStyle(fontSize: 18.0),)));
      }
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
                child: Form(
                      key: _formkey,
                  child: Column(
                    children: [
        
                      SizedBox(
                        height: 110.0,
                      ),
                      Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.only(left: 20.0, right: 20.0),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30.0,
                              ),
        
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center, // هذا يضمن تمركز العناصر داخل الصف
        
                                children: [
        
                                  Text(
                                    "دخول",
                                    style: AppWidget.HeadlineTextFeildStyle(),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // هنا تضع كود التوجيه إلى الصفحة المستهدفة
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => AdminLogin()), // استبدل YourTargetPage بالصفحة المستهدفة
                                      );
                                    },
                                    child: Text(
                                      " تسجيل",
                                      style: AppWidget.HeadlineTextFeildStyle(),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              TextFormField(
                                textAlign: TextAlign.end,
                                controller: usermailcontroller,
                                validator: (value){
                                  if(value==null || value.isEmpty){
                                    return 'من فضلك ادخل البريد الالكتروني';
                                  }
                                  return null;
                                },
        
                                decoration: InputDecoration(
                                    hintText: 'الايميل',
                                    hintStyle: AppWidget.semiBoldTextFeildStyle(),
                                    suffixIcon: Icon(Icons.email_outlined)),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              TextFormField(
                                textAlign: TextAlign.end,
                                controller: userpasswordcontroller,
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
                                    suffixIcon: Icon(Icons.password_outlined)),
                              ),
                              SizedBox(
                                height: 40.0,
                              ),
        
        
                              GestureDetector(
                                onTap: (){
                                  if(_formkey.currentState!.validate()){
                                    setState(() {
                                      email=usermailcontroller.text;
                                      password=userpasswordcontroller.text;
                                    });
                                  }
                                  userLogin();
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
                                      "دخول",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontFamily: 'Poppins1',
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                              ),
        
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 70.0,),
                       GestureDetector(
                        onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp()));
                        },
                        child: Text("ليس لديك حساب؟ سجل الآن", style: AppWidget.semiBoldTextFeildStyle(),))
                    ],
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
