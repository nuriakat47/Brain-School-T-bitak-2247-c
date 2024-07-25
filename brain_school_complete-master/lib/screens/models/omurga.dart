import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

void main() {
  runApp(Omurga());
}

class Omurga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Omurga',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Omurga'),
        ),
        body: OmurgaModel(),
      ),
    );
  }
}

class OmurgaModel extends StatefulWidget {
  @override
  _OmurgaModelState createState() => _OmurgaModelState();
}

class _OmurgaModelState extends State<OmurgaModel> {
  Offset? _tapPosition;

  // Dokunma olayını dinleyen işlev
  void _onTapDown(BuildContext context, TapDownDetails details) {
    // Dokunulan noktanın konumunu alın
    setState(() {
      _tapPosition = details.localPosition;
    });

    // Dokunulan noktaya göre açılacak bilgi kutusunu gösteren işlevi çağırın
    _showInfoDialog(details.localPosition);
  }

  // Dokunulan noktaya göre açılacak bilgi kutusunu gösteren işlev
  void _showInfoDialog(Offset? tapPosition) {
    if (tapPosition != null) {
      // Açılacak bilgi kutusunu gösterin
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Bilgi Kutusu'),
            content: Text('Dokunulan nokta: $tapPosition'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Kapat'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) => _onTapDown(context, details), // Dokunma olayını dinlemek için onTapDown olayını kullanın
      child: Center(
        child: ModelViewer(
          src: 'images/Vertebra1.glb',
          backgroundColor: Colors.blueGrey,
          autoPlay: true,
          autoRotate: true,
          ar: true,
        ),
      ),
    );
  }
}
