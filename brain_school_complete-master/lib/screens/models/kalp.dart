import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

void main() {
  runApp(Kalp());
}

class Kalp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalp Modeli',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Kalp Modeli'),
        ),
        body: Center(
          child: GestureDetector(
            onTapDown: (TapDownDetails details) {
              // Dokunulan noktaya göre şekil çizme işlevini çağırın
              _drawShape(details.localPosition, context);
            },
            child: ModelViewer(
              src: 'images/Kalp_animasyonlu.glb',
              backgroundColor: Colors.blueGrey,
              autoPlay: true,
              autoRotate: true,
              ar: true,
            ),
          ),
        ),
      ),
    );
  }

  // Dokunulan noktaya göre şekil çizen işlev
  void _drawShape(Offset? tapPosition, BuildContext context) {
    if (tapPosition != null) {
      // Dokunulan noktanın rengini almak için RenderBox kullanın
      final RenderBox box = context.findRenderObject() as RenderBox;
      final Offset localPosition = box.globalToLocal(tapPosition);

      // Dokunulan noktaya bir daire veya kare çizin
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Şekil Çiz'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Daireyi çizmek için işlevi çağırın
                    _drawCircle(localPosition);
                    Navigator.of(context).pop();
                  },
                  child: Text('Daire Çiz'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Kareyi çizmek için işlevi çağırın
                    _drawSquare(localPosition);
                    Navigator.of(context).pop();
                  },
                  child: Text('Kare Çiz'),
                ),
              ],
            ),
          );
        },
      );
    }
  }

  // Dokunulan noktaya daire çizen işlev
  void _drawCircle(Offset position) {
    // Daireyi çizmek için gerekli işlemleri gerçekleştirin
    print('Daire çizildi: $position');
  }

  // Dokunulan noktaya kare çizen işlev
  void _drawSquare(Offset position) {
    // Kareyi çizmek için gerekli işlemleri gerçekleştirin
    print('Kare çizildi: $position');
  }
}
