
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qoute_app/Model/widget/QouteCard.dart';
import 'package:qoute_app/ViewModel/Bloc/QuoteCubit/quote_cubit.dart';
import 'package:qoute_app/utils/AppColors.dart';
import '../Model/widget/FavoriteButtonNav.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var quote = QuoteCubit.get(context);
    return BlocProvider.value(
      value: quote..getRandomQuote(),
      child: Scaffold(

        body: BlocConsumer<QuoteCubit, QuoteState>(
          listener: (context, state) {},
          builder: (context, state) {

            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: AppColor.purple,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const FavoriteBtnNav(),
                  SizedBox(height: 15.h,),
                  QuoteCard(quote: quote.randQuote),
                ],
              ),
            );
          },
        ),

      ),
    );
  }
}
