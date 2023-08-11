import 'package:enat_guada/home/food_page_body.dart';
import 'package:enat_guada/util/app_colors.dart';
import 'package:enat_guada/widgets/big_text.dart';
import 'package:enat_guada/widgets/small_text.dart';
import 'package:flutter/material.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              child: Container(
                margin: EdgeInsets.only(top: 45, bottom: 15),
                padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Column(
                  children: [
                  BigText(text: 'Ethiopia', color: AppColors.mainColor,),
                  Row(
                    children: [
                      SmallText(text: 'Addis Ababa', color: Colors.black54),
                      Icon(Icons.arrow_drop_down_rounded)
                    ],
                  )
                ],),
                Center(
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.mainColor
                    ),
                    child: Icon(Icons.search, color: Colors.white),
                  ),
                )
              ]),
            ),
          ),
          FoodPageBody(),
        ],
      ),
    );
  }
}