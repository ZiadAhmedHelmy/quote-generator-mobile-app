import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qoute_app/Model/Components/CustonTextFeild.dart';
import 'package:qoute_app/Model/widget/FavoriteQuoteWidget.dart';
import 'package:qoute_app/Model/widget/navigateBackBtn.dart';
import 'package:qoute_app/ViewModel/Bloc/FavoriteCubit/favorite_cubit.dart';

import '../utils/AppColors.dart';
class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    var favoriteQuote = FavoriteCubit.get(context);
    return Scaffold(


      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
        gradient: AppColor.purple,
    ),

        child: BlocConsumer<FavoriteCubit, FavoriteState>(
              listener: (context, state) {
                 // TODO: implement listener
                   },
               builder: (context, state) {
                return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             SizedBox(height: 50.h,),
            const NavigateBackBtn(),
            SizedBox(height: 10.h,),
            CustomTextField(hintText: "",suffixIcon: IconButton(onPressed: (){}, icon:const Icon(Icons.cancel_outlined )), widthBtn: MediaQuery.of(context).size.width - 20,heightBtn: MediaQuery.of(context).size.height/45,controller:favoriteQuote.searchFavoriteQuote),
            Expanded(child: ListView.separated(physics:const BouncingScrollPhysics(), padding: EdgeInsets.all(10.h),separatorBuilder: (context, index) => SizedBox(height: 10.h,), itemCount: favoriteQuote.favoriteList.length,itemBuilder: (context, index) => FavoriteQuote(quote: favoriteQuote.favoriteList[index],Index: index),)),
          ],
        );
  },
),

    )
    );
  }
}
