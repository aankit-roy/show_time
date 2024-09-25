import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:show_time/res/constants/app_color.dart';
import 'package:show_time/res/widgets/app_text.dart';
import 'package:show_time/res/widgets/background_card.dart';
import 'package:show_time/res/widgets/movie_container_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundBlack,
        leading: Icon(Icons.menu,color: AppColors.lightGray,),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             AppText(text: "TV Show", size: 14.sp,),
            AppText(text: "Movies", size: 14.sp,),
            AppText(text: "Categories", size: 14.sp,),
          ],
        ),
        actions: [
          Icon(Icons.cast,color: AppColors.lightGray,),
          SizedBox(width: 10),
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(

        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [

            const BackgroundCard(),

           SizedBox(height: 10.h,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Top Collections',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white
                ),
              ),
            ),

         const MovieContainerCard(),



          ],
        ),
      ),
    );
  }
}


