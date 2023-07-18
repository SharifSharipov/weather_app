import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weater_apk_2/ui/utils/app_color.dart';
import '../../../network/apiprovayder.dart';

class HorizontalData extends StatefulWidget {
  const HorizontalData({Key? key}) : super(key: key);

  @override
  _HorizontalDataState createState() => _HorizontalDataState();
}

class _HorizontalDataState extends State<HorizontalData> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FutureBuilder(
          future: ApiProvider.fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data!;
              return Expanded(child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    height: 70.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:Colors.black
                    ),
                  ),
                  Container(
                    height: 70.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:Colors.black
                    ),
                  ),
                  Container(
                    height: 70.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:Colors.black
                    ),
                  )
                ],
              ));

            } else if (snapshot.hasError) {
              // Произошла ошибка, обработайте ее
              return Text('Ошибка: ${snapshot.error}');
            } else {
              // Данные все еще загружаются
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }
}