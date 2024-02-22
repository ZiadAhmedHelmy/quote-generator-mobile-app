import 'package:flutter/material.dart';
import 'package:qoute_app/view/FavoritesPage.dart';
import '../../utils/AppColors.dart';
import '../Components/CustomText.dart';
class FavoriteBtnNav extends StatelessWidget {
  const FavoriteBtnNav({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritePage(),));
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 20,
        height: MediaQuery.of(context).size.height/14,
        decoration: BoxDecoration(
            color:AppColor.purple3,
            borderRadius:const BorderRadius.vertical(top: Radius.circular(6))
        ),
        child:  const Center(child: CustomText(text:"Click Here To View Favorite Quotes" , fontSize: 26,)),
      ),
    );
  }
}
