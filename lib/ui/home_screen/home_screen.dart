import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:weater_apk_2/model/model.dart';
import 'package:weater_apk_2/network/apiprovayder.dart';
import 'package:weater_apk_2/ui/home_screen/widget/data_day.dart';
import 'package:weater_apk_2/ui/home_screen/widget/search_Citiy.dart';
import 'package:weater_apk_2/ui/home_screen/widget/weather_1.dart';
import 'package:weater_apk_2/ui/next_7_days/next_7days.dart';
import 'package:weater_apk_2/ui/utils/app_color.dart';
import 'package:weater_apk_2/ui/utils/app_icon.dart';
import '../../model/detail/hourly_model.dart';
import '../utils/constanta.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
TextEditingController datecontroler=TextEditingController();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE, MMMM d').format(now);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.c_fFEE3BC,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchViewDelegate());
            },
            icon: SvgPicture.asset(
              AppIcon.search,
              color: AppColors.black,
              height: 24.h,
              width: 24.w,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return Next_7_days();
                }));
              },
              icon: SvgPicture.asset(
                AppIcon.deggre_holder,
                color: AppColors.black,
                height: 24.h,
                width: 24.w,
              ),
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xffFEE3BC).withOpacity(1),
                  const Color(0xffF39876).withOpacity(0.9)
                ]),
          ),
          child: FutureBuilder<WaeterModel>(
            future: ApiProvider.fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data!;
                String time = DateTime.fromMillisecondsSinceEpoch(data.dt * 1000)
                    .toString();
                print(time);
                return Container(
                    width: double.infinity,
                    child: Container(
                      margin: EdgeInsets.only(left: 24.w, right: 24.w),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 89.h,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                data.name,
                                style: const TextStyle(
                                    color: AppColors.c_313341,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              )),
                          SizedBox(
                            height: 10.h,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              formattedDate,
                              style: const TextStyle(
                                  color: Color(0xff9A938C),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const DayWather_infor(),
                          const DayWather(),
                          const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                              TextButton(onPressed: (){}, child: const Text("Today",style: TextStyle(fontSize: 19,color: AppColors.black,fontWeight: FontWeight.w600),)),
                              TextButton(onPressed: (){}, child: const Text("Tomorrow",style: TextStyle(fontSize: 19,color: AppColors.black,fontWeight: FontWeight.w600),)),
                            ],),
                            TextButton(onPressed: (){}, child: const Text("Next 7 days>",style: TextStyle(fontSize: 19,color: AppColors.black,fontWeight: FontWeight.w600),)),
                          ],
                        ),
                          FutureBuilder(
                            future: ApiProvider()
                                .fetchWeatherDataByHour(lat:64.4286, long: 39.7747),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error: ${snapshot.error}'));
                              } else {
                                WeatherbyHourModel data = snapshot.data;
                                List<Hourly> hours = data.hourly;

                                return Container(
                                  height: 130.h,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: hours.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      Hourly hour = hours[index];
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                         // height: 120.h,
                                          width: 80.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: const Color(0xffFEE3BC),
                                          ),
                                          child: Column(
                                            children: [
                                              Text(parseUnixTimestamp(hour.dt)
                                                  .toString()
                                                  .substring(11, 17)),
                                              Image.network("https://openweathermap.org/img/wn/${hour.weather[0].icon}@2x.png"),
                                              Text(hour.temp.toString()),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ));
              } else if (snapshot.hasError) {
                // Error occurred, handle it
                return Text('Error: ${snapshot.error}');
              } else {
                // Data is still loading
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }
}
