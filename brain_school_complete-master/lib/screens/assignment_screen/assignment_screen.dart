import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AssignmentScreen extends StatelessWidget {
  const AssignmentScreen({Key? key}) : super(key: key);
  static String routeName = 'AssignmentScreen';

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> assignment = [
      {
        'subjectName': 'ÜNİTE 1: VÜCUDUN TEMEL YAPISI',
        'topicName': 'ANATOMİ VE FİZYOLOJİ İLE İLGİLİ TEMEL KAVRAMLAR',
        'assignDate': 'Assign Date 1',
        'lastDate': 'Last Date 1',
        'status': 'Pending',
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('KONU BAŞLIKLARI'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: ListView.builder(
                padding: EdgeInsets.all(10.0),
                itemCount: assignment.length,
                itemBuilder: (context, int index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[300],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 100.w,
                                padding: EdgeInsets.symmetric(vertical: 1.0.h),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                  child: Text(
                                    assignment[index]['subjectName'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                assignment[index]['topicName'],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              if (assignment[index]['status'] == 'Pending')
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SubtopicScreen(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 5.0.w),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  child: Text(
                                    'ALT BAŞLIKLAR',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SubtopicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ALT BAŞLIKLAR',
          style: TextStyle(color: Colors.white), // Başlık metin rengi
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(3.0.h),
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () {
                // Handle button press for 1.1.1.Tanımlar
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 5.0.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '1.1.1.Tanımlar',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 3.0.h),
            ElevatedButton(
              onPressed: () {
                // Handle button press for 1.1.2.Anatominin Bölümleri
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 5.0.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '1.1.2.Anatominin Bölümleri',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 3.0.h),
            ElevatedButton(
              onPressed: () {
                // Handle button press for 1.1.3.Anatomi ve Fizyolojinin Önemi
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 5.0.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '1.1.3.Anatomi ve Fizyolojinin Önemi',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
