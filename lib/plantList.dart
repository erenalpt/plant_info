import 'package:flutter/material.dart';
import 'package:trees_info/utils/string.dart';
import 'package:trees_info/models/plant.dart';

class PlantList extends StatelessWidget {
  static List<Plant> allPlant;
  @override
  Widget build(BuildContext context) {
    allPlant = dataBaseRunner();
    return Scaffold(
      appBar: AppBar(
        title: Text("Plant List"),
        automaticallyImplyLeading: false,
      ),
      body: plantListWidget(),
    );
  }

  List<Plant> dataBaseRunner() {
    List<Plant> plants = [];

    for (var i = 0; i < 3; i++) {
      String pict = Strings.PlantName[i].toLowerCase() + ".jpg";
      String plntName = Strings.PlantName[i];
      String plntLatin = Strings.LatinceAd[i];
      String plntFeatures = Strings.PlantFeatures[i];

      Plant addPlant = Plant(plntName, plntLatin, plntFeatures, pict);
      plants.add(addPlant);
    }
    return plants;
  }

  Widget plantListWidget() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return singlePlant(context, index);
      },
      itemCount: allPlant.length,
    );
  }

  singlePlant(BuildContext context, int index) {
    Plant addingPlant = allPlant[index];
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListTile(
          onTap: () => Navigator.pushNamed(context, "/plantListDetails/$index"),
          leading: CircleAvatar(
            backgroundImage: AssetImage(
              "images/${addingPlant.picture.toLowerCase()}",
            ),
          ),
          title: Text(
            addingPlant.plantName,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.green.shade500),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Text(
              addingPlant.plantLatinceName,
              style: TextStyle(
                fontSize: 13,
                color: Colors.green.shade300,
              ),
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.orange,
          ),
        ),
      ),
    );
  }
}
