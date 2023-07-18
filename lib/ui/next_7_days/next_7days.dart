import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weater_apk_2/network/apiprovayder.dart';
import 'package:weater_apk_2/ui/home_screen/home_screen.dart';

import '../../model/detail/hourly_model.dart';
import '../utils/app_color.dart';
import '../utils/app_icon.dart';
import '../utils/constanta.dart';

class Next_7_days extends StatefulWidget {
  const Next_7_days({Key? key}) : super(key: key);

  @override
  State<Next_7_days> createState() => _Next_7_daysState();
}

class _Next_7_daysState extends State<Next_7_days> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.c_fFEE3BC,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return HomeScreen();
            }));
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Next 7 days ',
          style: TextStyle(color: AppColors.black),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xffFEE3BC).withOpacity(1),
                const Color(0xffF39876).withOpacity(0.9)
              ]),
        ),
        child: FutureBuilder(
          future:
              ApiProvider().fetchWeatherDataByHour(lat: 64.4286, long: 39.7747),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              WeatherbyHourModel data = snapshot.data;
              List<Hourly> hours = data.hourly;
              return Column(
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    height: 200.h,
                    width: 370.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color(0xffF39876).withOpacity(0.1),
                            const Color(0xffFEE3BC).withOpacity(0.7),
                          ]),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 11.w, right: 11.w, bottom: 11.h, top: 11.h),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Tomorow",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: AppColors.black),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(hours[0].temp.toString()),
                                  ...List.generate(1, (index) {
                                    Hourly h = hours[index];
                                    return Image.network(
                                      "https://openweathermap.org/img/wn/${h.weather[0].icon}@2x.png",
                                      height: 70,
                                      width: 70,
                                    );
                                  }),
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
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
                                    height: 10,
                                  ),
                                  Text("${hours[0].rain.toString()}\tcm")
                                ],
                              ),
                              Column(
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
                                    height: 10,
                                  ),
                                  Text("${hours[0].windSpeed.toString()}\tkm/h")
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                      height: 45.h,
                                      width: 45.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.sp),
                                          color: AppColors.white),
                                      child:
                                          SvgPicture.asset(AppIcon.humidity)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("${hours[0].humidity.toString()}\t%")
                                ],
                              ),
                            ],
                          ),
                          //     Hourly hour = hours[index]
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        ...List.generate(7, (index) {
                          Hourly hour = hours[index];
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 26.w, right: 26.w, top: 5.h, bottom: 5.h),
                            child: Container(
                              height: 80.h,
                              width: 370.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.c_fFEE3BC,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 11.w,
                                    right: 11.w,
                                    top: 8.h,
                                    bottom: 8.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(week[index]),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "${hours[index].temp.toString()}°C",
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.black,
                                          ),
                                        ),
                                        ...List.generate(1, (index) {
                                          Hourly h = hours[index];
                                          return Image.network(
                                            "https://openweathermap.org/img/wn/${h.weather[index].icon}@2x.png",
                                            height: 70,
                                            width: 70,
                                          );
                                        }),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

List<String> week = [
  "Thursday",
  "Friday",
  "Saturday",
  "Sunday",
  "Monday",
  "Tuesday",
  "wednesday"
];
