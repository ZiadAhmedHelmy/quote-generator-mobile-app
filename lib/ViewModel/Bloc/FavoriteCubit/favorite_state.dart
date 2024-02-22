part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}


class AddQuoteToFavoritesState extends FavoriteState {}
class RemoveQuoteFromFavoritesState extends FavoriteState {}
