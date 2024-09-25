import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:show_time/main.dart';
import 'package:show_time/res/constants/app_color.dart';
import 'package:show_time/res/widgets/app_text.dart';
import 'package:show_time/res/widgets/custome_button.dart';

class BackgroundCard extends StatelessWidget {
  const  BackgroundCard({super.key,});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 400.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/main.jpg"),
              fit: BoxFit.cover,  // Fits the image into the container
            ),
          ),
          foregroundDecoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0, 0.2, 0.8, 1])),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Game of Thrones",style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.sp,
                ),
                  maxLines: 2,  // Limit the text to two lines
                  overflow: TextOverflow.ellipsis,  // Adds ellipsis if text exceeds two lines
                  textAlign: TextAlign.center,  // Optionally center-align the text
                ),
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CustomButtonWidget(
                      icon: Icons.add,
                      title: "My List",
                    ),
                    _PlayButton(),
                    const CustomButtonWidget(
                      icon: Icons.info,
                      title: "More",
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),


      ],
    );
  }

  TextButton _PlayButton() {
    return TextButton.icon(
      onPressed: () {},


      icon: const Icon(
        Icons.play_arrow,
        size: 25,
        color: AppColors.white,
      ),
      label:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: AppText(text: "Play",size: 28.sp,)
      ),
    );
  }
}
