import 'package:api_news/modules/social_login_screen/login.dart';
import 'package:api_news/shared/cubit/bloc_observer.dart';
import 'package:api_news/shared/cubit/cubit.dart';
import 'package:api_news/shared/cubit/states.dart';
import 'package:api_news/shared/network/local/cache_helper.dart';
import 'package:api_news/shared/network/remote/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'layout/new_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main () async {

 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();

 // Bloc.observer = MyBlocObserver();
 // DioHelper.init();
  //await CacheHelper.init();

  //bool? isDark = CacheHelper.getData(key: "isDark") == null ? false : CacheHelper.getData(key: "isDark");

 // runApp(MyApp(isDark));
runApp(MyApp());
}

class MyApp extends StatelessWidget {

//final bool isDark;
//MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext)=>NewsCubit()..getBusiness()..getSports()..getScience()..changeMode(fromShared: true),
    child: BlocConsumer<NewsCubit , NewsStates>(
        listener: (context,state){},
        builder: (context,state){
        return MaterialApp(
          theme: ThemeData(
            //  primarySwatch: Colors.cyan,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                  backgroundColor: Colors.pink[100],
                  titleTextStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.blueGrey[500]
                  ),
                  iconTheme: IconThemeData(color: Colors.white)

              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedItemColor: Colors.blueGrey,
                  type:BottomNavigationBarType.fixed,
                  backgroundColor: Colors.pink[100]
              ),
              textTheme: TextTheme(
                  bodyText1: TextStyle(fontSize: 19,fontWeight: FontWeight.w600,color: Colors.black),
                  bodyText2: TextStyle(color: Colors.blueGrey)

              )
          ),
          darkTheme: ThemeData(
            primaryColor: Colors.pink,
            scaffoldBackgroundColor: HexColor("#022C44"),
            appBarTheme: AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: HexColor("#022C44"),
                  statusBarIconBrightness: Brightness.light
              ),
                backgroundColor: HexColor("#D97762"),
                titleTextStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.blueGrey[500]
                ),
                iconTheme: IconThemeData(color: Colors.white)

            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.red
            ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.grey[500],
                  type:BottomNavigationBarType.fixed,
                  elevation: 20,
                  backgroundColor: HexColor("#D97762"),
              ),
            textTheme: TextTheme(
              bodyText1: TextStyle(fontSize: 19,fontWeight: FontWeight.w600,color: Colors.white),
                bodyText2: TextStyle(color: Colors.white54)

            )


          ),
          themeMode: NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: SocialLoginScreen()
        );

        },
      ),
    );
  }
}

