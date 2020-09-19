import 'package:flutter/material.dart';
import 'package:trees_info/plantList.dart';
import 'package:trees_info/plantListDetail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Plant Information",
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
//      home: PlantList(),
      initialRoute: "/plantList",
      routes: {
        "/": (context) => PlantList(),
        "/plantList": (context) => PlantList(),
      },

      onGenerateRoute: (settings) {
        List<String> pathElement = settings.name.split("/");
        if (pathElement[1] == "plantListDetails") {
          return MaterialPageRoute(
              builder: (context) => PlantDetails(int.parse(pathElement[2])));
        }
        return null;
      },
    );
  }
}
