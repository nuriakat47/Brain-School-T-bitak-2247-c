import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

void main() => runApp(const HumanPage());

class HumanPage extends StatefulWidget {
  const HumanPage({Key? key}) : super(key: key);

  @override
  State<HumanPage> createState() => _HumanPageState();
}

class _HumanPageState extends State<HumanPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modeller',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Model'),
        ),
        body: const Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 100, // ModelViewer'ın genişliği
        height: 100, // ModelViewer'ın yüksekliği
        child: ModelViewer(
          src: 'images/pp.glb',
          backgroundColor: Colors.blue,
          autoPlay: true,
          autoRotate: true,
          ar: true,
        ),
      ),
    );
  }
}
