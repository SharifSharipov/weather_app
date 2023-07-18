import 'package:flutter/material.dart';
import 'package:weater_apk_2/model/model.dart';
import 'package:weater_apk_2/network/apiprovayder.dart';
class Query extends StatefulWidget {
  const Query({Key? key}) : super(key: key);

  @override
  State<Query> createState() => _QueryState();
}

class _QueryState extends State<Query> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiProvider.getMainWeatherDataByQuery(query: 'Tashkent'),
        builder:(BuildContext context ,AsyncSnapshot snapshot){
          WaeterModel info1=snapshot.data;
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          else if(snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }
          else  return Container(
              child: Text(info1.name),
            );
        });
  }
}
