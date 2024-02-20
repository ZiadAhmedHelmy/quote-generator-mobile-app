import 'package:flutter/material.dart';
import 'package:qoute_app/Model/Components/CustomBtn.dart';
import 'package:qoute_app/Model/Components/CustomText.dart';
import 'package:qoute_app/Model/widget/QouteCard.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

       body: Container(
         width: double.infinity,
         height: double.infinity,
         decoration: BoxDecoration(
         gradient: LinearGradient(
           begin: Alignment.topCenter,
           end: Alignment.bottomCenter,
           colors: [
             Color.fromRGBO(93, 19, 231, 1),
             Color.fromRGBO(130, 73, 181, 1)
           ]
         ),
         ),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
             children: [

              QuoteCard()
           ],

         ),
       ),

    );
  }
}
