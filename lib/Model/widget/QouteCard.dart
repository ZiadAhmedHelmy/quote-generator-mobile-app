import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:qoute_app/Model/models/QuoteModel.dart';
import 'package:qoute_app/Model/widget/FavoriteQuoteWidget.dart';
import 'package:qoute_app/ViewModel/Bloc/FavoriteCubit/favorite_cubit.dart';
import 'package:qoute_app/ViewModel/Bloc/QuoteCubit/quote_cubit.dart';

import '../../utils/AppColors.dart';
import '../Components/CustomBtn.dart';
import '../Components/CustomText.dart';
class QuoteCard extends StatelessWidget {
 final QuoteModel quote;
  const QuoteCard({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    var quoteCubit = QuoteCubit.get(context);
    var favCubit = FavoriteCubit.get(context);
    return  Container(
      width: MediaQuery.of(context).size.width - 20,
      decoration:const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(6))
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          CustomText(text: '"'"${quote.content }"'"' ?? "No Code , No Pain",fontSize: 26),
          const SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomText(text: quote.author ?? "Ziad Ahmed" , fontSize: 22,color:AppColor.purple2 ,),
            ],),
          const SizedBox(height: 15,),
          Row(children: [
            Expanded(
                flex:2,
                child: CustomButton(text: "Generate Another Quote",fontSize:22,textColor: Colors.white,borderRadius:const BorderRadius.only(bottomLeft: Radius.circular(8)),color: AppColor.purple2, onTap: (){
                  quoteCubit.getRandomQuote();
                })),
            const SizedBox(width: 10,),
            Expanded(child: CustomButton(text: "",icon:FluentIcons.heart_32_filled,textColor: Colors.white,borderRadius:const BorderRadius.only(bottomRight: Radius.circular(8)),color: Colors.white,borderWidth: 2,borderColor:AppColor.purple2 , onTap: (){
              favCubit.addToFavorites(quote: quote);
            })),
          ],)
        ],
      ),
    );
  }
}
