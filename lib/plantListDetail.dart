import 'package:flutter/material.dart';
import 'package:trees_info/models/plant.dart';
import 'package:trees_info/plantList.dart';
import 'package:palette_generator/palette_generator.dart';

class PlantDetails extends StatefulWidget {
  int sendIndex;
  PlantDetails(this.sendIndex);

  @override
  PlantDetailsState createState() {
    return new PlantDetailsState();
  }
}

class PlantDetailsState extends State<PlantDetails> {
  Plant selectedPlant;
  Color vibrateColor;
  PaletteGenerator paletteGenerator;

  @override
  void initState() {
    super.initState();
    selectedPlant = PlantList.allPlant[widget.sendIndex];

    vibrateColorFind();
  }

  void vibrateColorFind() {
    Future<PaletteGenerator> futureGener = PaletteGenerator.fromImageProvider(
      AssetImage(
        "images/" + selectedPlant.picture.toLowerCase(),
      ),
    );

    futureGener.then((value) {
      paletteGenerator = value;
      // debugPrint(
      //     "Seçilen vibra" + paletteGenerator.darkVibrantColor.toString());

      setState(() {
        vibrateColor = paletteGenerator.vibrantColor.color;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor:
                vibrateColor != null ? vibrateColor : Colors.green.shade600,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "images/" + selectedPlant.picture.toLowerCase(),
                fit: BoxFit.cover,
              ),
              centerTitle: true,
              title: Text(
                selectedPlant.plantLatinceName,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: SingleChildScrollView(
                child: Text(
                  selectedPlant.description,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
