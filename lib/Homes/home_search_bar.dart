import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color:  Color(0xFF030637),
          width: 1.0,
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 1,
      ),
      child: Row(
        textDirection: TextDirection.rtl, // تغيير اتجاه النص والعناصر
        children: [
          const Icon(Iconsax.search_normal,color: Color(0xFF600247),
          ), // الأيقونة على اليمين
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              textAlign: TextAlign.right, // جعل النص يظهر على اليمين
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "ابحثي عن عاملات منزلية", // تغيير النص إلى العربية
                hintStyle: TextStyle(
                  color: Color(0xFF600247),

                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
