import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Object jet;
  late Object shark;
  double scale = 1.0;
  bool isDrawingMode = false;

  @override
  void initState() {
    jet = Object(fileName: "assets/jet/Jet.obj");
    shark = Object(fileName: "assets/shark/shark.obj");
    shark.rotation.setValues(0, 90, 0);
    shark.updateTransform();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("MODELLER"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Cube(
                onSceneCreated: (Scene scene) {
                  scene.world.add(shark);
                  scene.camera.zoom = 10;
                },
              ),
            ),
            Expanded(
              child: Cube(
                onSceneCreated: (Scene scene) {
                  scene.world.add(jet);
                  scene.camera.zoom = 10;
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "zoomIn", // Farklı bir değer kullan
            onPressed: () {
              print("Button Pressed: Zoom In");
              if (scale < 2.0) {
                setState(() {
                  scale += 0.1;
                });
              }
            },
            child: Icon(Icons.zoom_in),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "zoomOut", // Farklı bir değer kullan
            onPressed: () {
              print("Button Pressed: Zoom Out");
              if (scale > 0.1) {
                setState(() {
                  scale -= 0.1;
                });
              }
            },
            child: Icon(Icons.zoom_out),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "edit", // Farklı bir değer kullan
            onPressed: () {
              print("Button Pressed: Edit");
              setState(() {
                isDrawingMode = !isDrawingMode;
              });
            },
            child: Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
    ),
  );
}
