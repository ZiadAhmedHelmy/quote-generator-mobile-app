import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qoute_app/Model/Components/CustonTextFeild.dart';
import 'package:qoute_app/Model/models/QuoteModel.dart';
import 'package:qoute_app/Model/models/favModel.dart';
import 'package:qoute_app/Model/widget/FavoriteQuoteWidget.dart';
import 'package:qoute_app/Model/widget/navigateBackBtn.dart';
import 'package:qoute_app/ViewModel/Bloc/FavoriteCubit/favorite_cubit.dart';
import 'package:qoute_app/ViewModel/Data/Local/LocalData.dart';

import '../utils/AppColors.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  TextEditingController searchedItem = TextEditingController();
  List<FavModel> favQuotes = [];

  @override
  void initState() {
    super.initState();
    favQuotes = FavoriteCubit.get(context).test;
  }

  void searchQuote(String enteredKeyword) {
    List<FavModel> results = [];

    if (enteredKeyword.isEmpty) {
      results = FavoriteCubit.get(context).test;
    } else {
      results = FavoriteCubit.get(context)
          .test
          .where((item) => item.description!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      favQuotes = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: FavoriteCubit.get(context)..getAllFavLocal(),
      child: Scaffold(
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
                SizedBox(
                  height: 50.h,
                ),
                const NavigateBackBtn(),
                SizedBox(
                  height: 10.h,
                ),
                //search Fav
                CustomTextField(
                  hintText: "",
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(FluentIcons.add_circle_16_regular),
                  ),
                  widthBtn: MediaQuery.of(context).size.width - 20,
                  heightBtn: MediaQuery.of(context).size.height / 45,
                  controller: searchedItem,
                  onChanged: (value) => searchQuote(searchedItem.text),
                ), // fav Quotes
                Expanded(
                    child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.all(10.h),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10.h,
                  ),
                  itemCount: FavoriteCubit.get(context).test.length,
                  itemBuilder: (context, index) => FavoriteQuote(
                      quote: FavoriteCubit.get(context).test[index],
                      Index: index),
                )),
              ],
            );
          },
        ),
      )),
    );
  }
}
