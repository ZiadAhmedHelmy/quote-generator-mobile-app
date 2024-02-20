import 'package:flutter/material.dart';
import 'package:qoute_app/Model/models/QuoteModel.dart';

import '../../utils/AppColors.dart';
import '../Components/CustomBtn.dart';
import '../Components/CustomText.dart';
class QuoteCard extends StatelessWidget {
 final QuoteModel quote;
  const QuoteCard({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width - 20,
      decoration:const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(8))
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          CustomText(text: quote.content!,fontSize: 24),
          const SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomText(text: quote.author! , fontSize: 18,color:AppColor.purple2 ,),
            ],),
          const SizedBox(height: 15,),
          Row(children: [
            Expanded(
                flex:2,
                child: CustomButton(text: "Generate Another Quote",textColor: Colors.white,borderRadius:const BorderRadius.only(bottomLeft: Radius.circular(8)),color: AppColor.purple2, onTap: (){})),
            const SizedBox(width: 10,),
            Expanded(child: CustomButton(text: "",icon:Icons.heart_broken,textColor: Colors.white,borderRadius:const BorderRadius.only(bottomRight: Radius.circular(8)),color: Colors.white,borderWidth: 2,borderColor:AppColor.purple2 , onTap: (){})),
          ],)
        ],
      ),
    );
  }
}
