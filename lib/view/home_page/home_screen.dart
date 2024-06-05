import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trogontask/controller/api_service_provider.dart';
import 'package:trogontask/helpers/app_colors.dart';
import 'package:trogontask/model/course_model.dart';
import 'package:trogontask/services/api_service.dart';
import 'package:trogontask/view/home_page/widgets/coin_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ApiServiceProvider>(context, listen: false).fetchData();
  }

  List<String> images=[
    'assets/Group 36440.png',
    'assets/animated_pic.png',
    'assets/Group 36440.png'
  ];
      List<List<Color>> colorCombos = [
      [
        Colors.white,
        Colors.pink,
      ],
      [
        Colors.white,
        Colors.orange,
      ],
      [
        Colors.white,
        Color.fromARGB(255, 255, 60, 0),
      ],
    ];

  List<String>iconImages=[
    'assets/9913468.png',
    'assets/download.png',
    'assets/images (4) 1.png'
  ];
  List<String>texts = ['Exam','Practice','Materials'];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<ApiServiceProvider>(
        builder: (context, provider, child) {
          List<Course> courses = provider.coursesList;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: size.height * 0.3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                    gradient: LinearGradient(
                      colors: [AppColors.primaryColor, AppColors.gradientLight],
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Hi Good Morning !',
                                  style: TextStyle(
                                    color: AppColors.mainTextColor,
                                    fontSize: 18,
                                  ),
                                ),
                                Row(
                                  children: [
                                    CoinContainer(provider: provider),
                                    SizedBox(width: 10),
                                    CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      backgroundImage: provider.user != null &&
                                              provider.user!.image.isNotEmpty
                                          ? NetworkImage(provider.user!.image)
                                          : AssetImage(''),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              provider.user?.firstName ?? '',
                              style: TextStyle(
                                color: AppColors.mainTextColor,
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                          ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 3,left: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Select the Subject'),
                                  Text('Montessori',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Container(
                                height: 30,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    10
                                  ),
                                  color: AppColors.primaryColor,
                                ),
                                child: Center(child: Text('Change',style: TextStyle(color: Colors.white),)),
                              ),
                            ),
                          ],
                        ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 30,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: colorCombos[index],
                            ),
                            image: DecorationImage(
                              image: AssetImage(iconImages[index]),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              texts[index],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: 3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: Text(
                    provider.user?.courseName ?? '',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: courses.length,
                    itemBuilder: (context, index) {
                      Course course = courses[index];
                      return Container(
                        height: 100,
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(images[index], height: 80),
                            Text(course.name ?? '', style: TextStyle(fontSize: 15)),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/Ads.png')),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
