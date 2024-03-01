import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qoute_app/ViewModel/Bloc/FavoriteCubit/favorite_cubit.dart';
import 'package:qoute_app/ViewModel/Bloc/QuoteCubit/quote_cubit.dart';
import 'package:qoute_app/ViewModel/Data/Local/LocalData.dart';
import 'package:qoute_app/ViewModel/Data/Network/DioHelper.dart';
import 'package:qoute_app/view/HomePage.dart';

import 'ViewModel/Bloc/BlocObserver.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  LocalData.initDb();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => QuoteCubit(),),
          BlocProvider(create: (context) => FavoriteCubit(),),
        ],
        child: MaterialApp(
          theme: ThemeData(fontFamily: 'Gemunu Libre'),
          home: const HomePage(),
        ),
      ),
    );
  }
}
