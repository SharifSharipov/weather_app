import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weater_apk_2/network/apiprovayder.dart';
class DayWather_infor extends StatefulWidget {
  const DayWather_infor({Key? key}) : super(key: key);

  @override
  State<DayWather_infor> createState() => _DayWather_inforState();
}

class _DayWather_inforState extends State<DayWather_infor> {
  @override
  Widget build(BuildContext context) {
    return  Row(children: [
      FutureBuilder(
          future: ApiProvider.fetchData(),
          builder:(context ,snapshot){
            if(snapshot.hasData){
              var data = snapshot.data!;
              String time = DateTime.fromMillisecondsSinceEpoch(data.dt * 1000)
                  .toString();
              print(time);
              return Column(
                children: [
                  ...List.generate(
                      data.weather.length,
                          (index) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                           Align(
                               alignment: Alignment.centerLeft,
                               child: Image.network(
                                 'https://openweathermap.org/img/wn/${data.weather[0].icon}@2x.png',
                                 height: 100,
                                 width: 100,
                               )),
                             SizedBox(
                               width: 140.w,
                             ),
                           Column(
                             children: [
                               Stack(
                                 children: [
                                   const Positioned(
                                     top: 0,
                                     right: 0,
                                     child: Text('°C',style:  TextStyle(
                                       fontSize: 18,
                                       fontWeight: FontWeight.w400,
                                       color: Colors.white,
                                     ),),),
                                   Text(
                                     '${(data.main.temp ?? 0).toInt() - 273}',
                                     style: const TextStyle(
                                       fontSize: 56,
                                       fontWeight: FontWeight.w400,
                                       color: Colors.white,
                                     ),
                                   ),
                                   // Text('°C',style: TextStyle(color: Colors.black),),
                                 ],
                               ),
                               ...List.generate(
                                 data.weather.length,
                                     (index) => Row(
                                   children: [
                                     Text('${(data.weather[index].desckription)}',
                                       style: const TextStyle(
                                         fontSize: 20,
                                         fontWeight: FontWeight.w400,
                                         color: Colors.white,
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                             ],
                           ),
                         ],)
                        ],
                      )),
                ],
              );
            } else if (snapshot.hasError) {
              // Error occurred, handle it
              return Text('Error: ${snapshot.error}');
            } else {
              // Data is still loading
              return const Center(child: CircularProgressIndicator());
            }
          } ),
    ],);
  }
}
