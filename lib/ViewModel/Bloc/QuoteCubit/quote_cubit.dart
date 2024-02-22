
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:qoute_app/Model/models/QuoteModel.dart';
import 'package:qoute_app/ViewModel/Data/Network/DioHelper.dart';
import 'package:qoute_app/ViewModel/Data/Network/EndPoints.dart';

part 'quote_state.dart';

class QuoteCubit extends Cubit<QuoteState> {
  QuoteCubit() : super(QuoteInitial());

  static QuoteCubit get(context) => BlocProvider.of(context);

  QuoteModel randQuote  = QuoteModel();

  Future<void>getRandomQuote()async{
     print("svsv");
     DioHelper.get(endPoint:EndPoints.randomQuote).then((value){
       print(value);
       randQuote = QuoteModel.fromJson(value.data);
       print(randQuote.author);
       emit(SuccessRandomQuote());
     }).catchError((error){
       emit(ErrorRandomQuote());
     });
  }
}
