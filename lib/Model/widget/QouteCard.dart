import 'package:flutter/material.dart';

import '../Components/CustomBtn.dart';
import '../Components/CustomText.dart';
class QuoteCard extends StatelessWidget {
  const QuoteCard({super.key});

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
          CustomText(text: "“All I required to be happy was friendship and people I could admire.”",fontSize: 24),
          const SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomText(text: "Christian Dior" , fontSize: 18,color:Color.fromRGBO(50, 50, 50, 0.7) ,),
            ],),
          const SizedBox(height: 15,),
          Row(children: [
            Expanded(
                flex:2,
                child: CustomButton(text: "Generate Another Quote",textColor: Colors.white,borderRadius:const BorderRadius.only(bottomLeft: Radius.circular(8)),color: Color.fromRGBO(130, 73, 181, 1), onTap: (){})),
            const SizedBox(width: 10,),
            Expanded(child: CustomButton(text: "",icon:Icons.heart_broken,textColor: Colors.white,borderRadius:const BorderRadius.only(bottomRight: Radius.circular(8)),color: Colors.white,borderWidth: 2,borderColor:Color.fromRGBO(130, 73, 181, 1) , onTap: (){})),
          ],)
        ],
      ),
    );
  }
}
