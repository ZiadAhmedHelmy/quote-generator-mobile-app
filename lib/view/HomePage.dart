import 'package:flutter/material.dart';

import 'package:qoute_app/Model/widget/QouteCard.dart';
import 'package:qoute_app/utils/AppColors.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

       body: Container(
         width: double.infinity,
         height: double.infinity,
         decoration: BoxDecoration(
         gradient: AppColor.purple,
         ),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
             children: [

              QuoteCard(quote: ,),
           ],

         ),
       ),

    );
  }
}
