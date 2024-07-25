import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

void main() => runApp(const Vertebra());

class Vertebra extends StatefulWidget {
  const Vertebra({Key? key}) : super(key: key);

  @override
  State<Vertebra> createState() => _MyAppState();
}

class _MyAppState extends State<Vertebra> {
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
  Offset? _tapPosition;

  // Dokunma olayını dinleyen işlev
  void _onTapDown(BuildContext context, TapDownDetails details) {
    // Dokunulan noktanın konumunu alın
    _tapPosition = details.localPosition;

    // Dokunulan noktaya göre modeli parçalayacak işlevi çağırın
    _breakModel();
  }

  // Modeli dokunulan noktaya göre parçalayan işlev
  void _breakModel() {
    // Burada modeli parçalayacak işlemi gerçekleştirin
    // Örneğin, dokunulan noktanın koordinatlarını kullanarak modeli belirli bir şekilde parçalayabilirsiniz
    // Bu işlem için ModelViewer widget'ının API'sini kullanabilirsiniz
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTapDown: (TapDownDetails details) => _onTapDown(context, details), // Dokunma olayını dinlemek için onTapDown olayını kullanın
        child: ModelViewer(
          src: 'images/pp.glb',
          backgroundColor: Colors.blueGrey,
          autoPlay: true,
          autoRotate: true,
          ar: true,
        ),
      ),
    );
  }
}