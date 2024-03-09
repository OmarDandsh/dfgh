  import 'package:flutter/material.dart';

  import '../admin/add_food.dart';
import '../widget/color_extension.dart';
  import '../widget/round_textfield.dart';
import '../widget/widget_support.dart';
import 'Contracthours.dart';
import 'Flter.dart';



  class MenuView extends StatefulWidget {
    const MenuView({super.key});

    @override
    State<MenuView> createState() => _MenuViewState();
  }

  class _MenuViewState extends State<MenuView> {
    List menuArr = [
      {
        "name": "خدمات بالساعة",
        "image": "images/vfdvfd.png",
        "items_count": "بنظام الزيارات المحددة, تبدأ من الزيارة الى الزارات المتعددة ",
      },
      {
        "name": "خدمات مقيمة",
        "image": "images/vfdvfd1.png",
        "items_count": "بنظام عقود إعارة وقابلة للتجديد, تبدأ \n من شهر الى سنين وبنظام دفعات شهرية",
      },
      {
        "name": "خدمات التوسط",
        "image": "images/c1.png",
        "items_count": "بنظام الاستقدام على تاشيرتك الخاصة",
      },
    ];
    TextEditingController txtSearch = TextEditingController();

    @override
    Widget build(BuildContext context) {
      var media = MediaQuery.of(context).size;
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Stack(
            alignment: Alignment.centerRight,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 170),
                width: media.width * 0.27,
                height: media.height * 0.55,
                decoration: BoxDecoration(
                  color: Color(0xFF030637),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(35),
                      bottomLeft: Radius.circular(35)),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "إختر الخدمة التي تناسبك",
                                  style: AppWidget.TitlePap1()
                              ),


                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: RoundTextfield(
                            hintText: "البحث",
                            controller: txtSearch,
                            left: Container(
                              alignment: Alignment.center,
                              width: 40,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Image.asset(
                                  "assets/img/search.png",
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ListView.builder(
                            padding: const EdgeInsets.symmetric(
                                vertical: 30, horizontal: 20),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: menuArr.length,
                            itemBuilder: ((context, index) {
                              var mObj = menuArr[index] as Map? ?? {};
                              return GestureDetector(
                                onTap: () {
                                  if (index == 0) {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddressPage()));
                                  } else if (index == 1) {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => RemoveItem()));
                                  } else if (index == 2) {
                                  }
                                },
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 26, bottom: 8, left: 20),
                                      width: media.width - 100,
                                      height: 90,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              bottomLeft: Radius.circular(8),
                                              topRight: Radius.circular(25),
                                              bottomRight: Radius.circular(25)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black12,
                                                blurRadius: 7,
                                                offset: Offset(0, 4))
                                          ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 14.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(40),
                                            child: Image.asset(
                                              mObj["image"].toString(),
                                              width: 70,
                                              height: 70,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  mObj["name"].toString(),
                                                  style: AppWidget.semiBoldTextFeildStyle()
                                                ),
                                                const SizedBox(
                                                  height: 4,
                                                ),
                                                Text(
                                                  "${mObj["items_count"].toString()} ",
                                                  style: TextStyle(
                                                      color: TColor.secondaryText,
                                                      fontSize: 13,
                                                      fontFamily: 'Tajawal'
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 35,
                                            height: 35,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                BorderRadius.circular(17.5),
                                                boxShadow: const [
                                                  BoxShadow(
                                                      color: Colors.black12,
                                                      blurRadius: 4,
                                                      offset: Offset(0, 2))
                                                ]),
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              "assets/img/btn_back.png",
                                              width: 15,
                                              height: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }))
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
