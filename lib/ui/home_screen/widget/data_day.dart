import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weater_apk_2/network/apiprovayder.dart';

import '../../utils/app_color.dart';
import '../../utils/app_icon.dart';

class DayWather extends StatefulWidget {
  const DayWather({Key? key}) : super(key: key);

  @override
  State<DayWather> createState() => _DayWatherState();
}

class _DayWatherState extends State<DayWather> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FutureBuilder(
            future: ApiProvider.fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data!;
                return Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      height: 70.h,
                      width: 375.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.c_fFEE3BC),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 11, right: 11, top: 8, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                    height: 45.h,
                                    width: 45.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.sp),
                                        color: AppColors.white),
                                    child: SvgPicture.asset(AppIcon.zont)),
                                SizedBox(
                                  width: 20.w,
                                ),
                                const Text(
                                  'RainFall',
                                  style: TextStyle(
                                      color: Color(0xff303345),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            Text('${(data.wind.deg / 100).toString()}\t\t\tcm'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      height: 70.h,
                      width: 375.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.c_fFEE3BC),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 11, right: 11, top: 8, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                    height: 45.h,
                                    width: 45.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.sp),
                                        color: AppColors.white),
                                    child: SvgPicture.asset(AppIcon.wind)),
                                SizedBox(
                                  width: 20.w,
                                ),
                                const Text(
                                  'Wind',
                                  style: TextStyle(
                                      color: Color(0xff303345),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            Text('${(data.wind.speed).toString()}\t\t\tkm/h'),
                            //..Text(data)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      height: 70.h,
                      width: 375.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.c_fFEE3BC),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 11, right: 11, top: 8, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [      Container(
                               height: 45.h,
                               width: 45.w,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(12.sp),
                                   color: AppColors.white),
                               child: SvgPicture.asset(AppIcon.humidity)),
                             SizedBox(
                               width: 20.w,
                             ),
                             const Text(
                               'Humidity',
                               style: TextStyle(
                                   color: Color(0xff303345),
                                   fontWeight: FontWeight.w400,
                                   fontSize: 20),
                             ),],
                         ),
                            Text('${(data.main.humidity).toString()}\t\t%'),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                // Error occurred, handle it
                return Text('Error: ${snapshot.error}');
              } else {
                // Data is still loading
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ],
    );
  }
}
