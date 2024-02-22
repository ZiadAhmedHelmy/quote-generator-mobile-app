import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:qoute_app/Model/models/QuoteModel.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());


  static FavoriteCubit get(context) => BlocProvider.of(context);

  TextEditingController searchFavoriteQuote =TextEditingController();

  List<QuoteModel> favoriteList = [];

  void addToFavorites({ required QuoteModel quote}){
      favoriteList.add(quote);
      emit(AddQuoteToFavoritesState());
  }

  void removeFromFavorites({required int index}){
    favoriteList.removeAt(index);
    emit(RemoveQuoteFromFavoritesState());
  }



}
