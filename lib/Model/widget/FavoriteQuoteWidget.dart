import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:qoute_app/Model/models/QuoteModel.dart';
import 'package:qoute_app/ViewModel/Bloc/FavoriteCubit/favorite_cubit.dart';

import '../../utils/AppColors.dart';
import '../Components/CustomBtn.dart';
import '../Components/CustomText.dart';
class FavoriteQuote extends StatelessWidget {
  int Index;
  final QuoteModel quote;
   FavoriteQuote({super.key, required this.quote , required this.Index});
  @override
  Widget build(BuildContext context) {
    var favCubit = FavoriteCubit.get(context);
    return Container(
      width: MediaQuery.of(context).size.width -30,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          CustomText(text: '"'"${quote.content}"'"',fontSize: 26),
          const SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomText(text:  quote.author ??"Ziad AHemd" , fontSize: 22,color:AppColor.purple2 ,),
            ],),
          const SizedBox(height: 15,),
          Row(children: [
            Expanded(
                flex:2,
                child: CustomButton(text: "Remove From Favorite",fontSize:22,icon:FluentIcons.heart_24_regular,textColor: AppColor.purple2,borderRadius:const BorderRadius.vertical(bottom: Radius.circular(6)),color: AppColor.white,borderWidth: 2,borderColor: AppColor.purple2, onTap: (){
                  favCubit.removeFromFavorites(index: Index);
                })),
            const SizedBox(width: 10,),
          ],)
        ],
      ),
    );
  }
}
