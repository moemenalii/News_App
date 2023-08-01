import 'package:My_News/network/remote/dio_helpers.dart';
import 'package:My_News/shared/Style/Themes.dart';
import 'package:My_News/shared/cubit/cubit.dart';
import 'package:My_News/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'home_layout/home_layout.dart';
import 'moduels/SplashScreen/SplashScreen.dart';
import 'network/local/Cache_Helper.dart';
void main()async {

  WidgetsFlutterBinding.ensureInitialized();// when fun main is async..
  DioHelper.init();
  await CacheHelper.init();
  bool isdark=CacheHelper.GetData(Key: "isdark")??false;
  runApp( MyApp(isdark));
}

class MyApp extends StatelessWidget {
  final bool isdark;
  MyApp(this.isdark);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(BuildContext context)=>NewsCubit()..getbusiness()..getSports()..getScience()..Changemode(fromshared: isdark),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme ,
            themeMode:NewsCubit.get(context).isdark? ThemeMode.dark:ThemeMode.light,
            darkTheme: darkTheme,
            home: SplashPage(),
          );
        },
      ),
    );


  }
}