import 'package:brain_school/constants.dart';
import 'package:brain_school/screens/assignment_screen/assignment_screen.dart';
import 'package:brain_school/screens/galeri/galeri.dart';
import 'package:brain_school/screens/models/human_page.dart';
import 'package:brain_school/screens/my_profile/my_profile.dart';
import 'package:brain_school/screens/plan/plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../models/home_page.dart';
import 'widgets/student_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 100.w,
            height: 40.h,
            padding: EdgeInsets.all(kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StudentName(
                          studentName: 'NURİ',
                        ),
                        kHalfSizedBox,
                      ],
                    ),
                    kHalfSizedBox,
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, MyProfileScreen.routeName);
                      },
                      child: Container(
                        width: 31.w,
                        height: 27.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/images/logo_white.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: 100.w,
              decoration: BoxDecoration(
                color: kOtherColor,
                borderRadius: kTopBorderRadius,
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          },
                          icon: 'assets/icons/result.svg',
                          title: 'MODELLER',
                        ),
                        HomeCard(
                          onPress: () {
                            Navigator.pushNamed(
                                context, AssignmentScreen.routeName);
                          },
                          icon: 'assets/icons/assignment.svg',
                          title: 'KONULAR',
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [],
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GaleriPage(),
                              ),
                            );
                          },
                          icon: 'assets/icons/gallery.svg',
                          title: 'GALERİ',
                        ),
                        HomeCard(
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HumanPage(),
                              ),
                            );
                          },
                          icon: 'assets/icons/lock.svg',
                          title: 'GÜVENLİK',
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [],
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PlanPage(),
                              ),
                            );
                          },
                          icon: 'assets/icons/event.svg',
                          title: 'PLAN',
                        ),
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/logout.svg',
                          title: 'ÇIKIŞ',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard(
      {Key? key,
        required this.onPress,
        required this.icon,
        required this.title})
      : super(key: key);
  final VoidCallback onPress;
  final String icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(top: 1.h),
        width: 40.w,
        height: 20.h,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(kDefaultPadding / 2),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              height: 20.sp,
              width: 20.sp,
              color: kOtherColor,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      ),
    );
  }
}
