import 'package:flutter/material.dart';

class GaleriPage extends StatefulWidget {
  @override
  _GaleriPageState createState() => _GaleriPageState();
}

class _GaleriPageState extends State<GaleriPage> {
  int _selectedImageIndex = 0;
  List<String> _imageList = [
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galeri'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  // Resmin üzerine tıklandığında büyütme ekranını aç
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailScreen(
                        imageList: _imageList,
                        initialIndex: _selectedImageIndex,
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(_imageList[_selectedImageIndex]),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            SizedBox(
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _imageList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedImageIndex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10.0),
                      width: 100.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _selectedImageIndex == index
                              ? Colors.blue
                              : Colors.transparent,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage(_imageList[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final List<String> imageList;
  final int initialIndex;

  DetailScreen({required this.imageList, required this.initialIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: PageView.builder(
            itemCount: imageList.length,
            controller: PageController(initialPage: initialIndex),
            itemBuilder: (context, index) {
              return Image.asset(
                imageList[index],
                fit: BoxFit.fitWidth,
              );
            },
          ),
        ),
      ),
    );
  }
}
