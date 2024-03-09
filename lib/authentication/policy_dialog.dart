import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/material.dart';


class PolicyDialog extends StatelessWidget {
  var style = MarkdownStyleSheet(
    textAlign: WrapAlignment.end, // تحديد اتجاه النص إلى اليمين
    h1Align: WrapAlignment.end, // تحديد اتجاه عناوين الأقسام إلى اليمين
    unorderedListAlign: WrapAlignment.end, // تحديد اتجاه القوائم غير المرتبة إلى اليمين
    orderedListAlign: WrapAlignment.end, // تحديد اتجاه القوائم المرتبة إلى اليمين
  );
  PolicyDialog({
    Key? key, // Make key parameter optional
    required this.mdFileName,
    this.radius = 8,
  })  : assert(mdFileName.contains('.md'), 'The file must contain the .md extension'),
        super(key: key);

  final double radius;
  final String mdFileName;



  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: FutureBuilder(
              future: Future.delayed(Duration(milliseconds: 150)).then((value) {
                return rootBundle.loadString('assets/$mdFileName');
              }),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Markdown(
                    styleSheet: style,

                    data: snapshot.data!,
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(radius),
                bottomRight: Radius.circular(radius),
              ),
            ),
            alignment: Alignment.center,
            height: 50,
            width: double.infinity,
            child:TextButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(radius),
                      bottomRight: Radius.circular(radius),
                    ),
                  ),
                ),

              ),
              child: Text(
                "اغلاق",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.button?.color,
                ),
              ),
            ),

          ),
        ],
      ),
    );
  }
}

