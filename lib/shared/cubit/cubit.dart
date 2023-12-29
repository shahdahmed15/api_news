import 'package:api_news/shared/cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/business.dart';
import '../../modules/science.dart';
import '../../modules/settind.dart';
import '../../modules/sport.dart';
import '../network/local/cache_helper.dart';
import '../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialStates());

  static NewsCubit get(context) => BlocProvider.of(context);


  int currentIndex = 0;
  List<Widget> screens = [
    BusinessScreen(),
    ScienceScreen(),
    SportsScreen(),
    SettingScreen()
  ];
  List<String>titles = ['BusinessScreen', 'ScienceScreen', 'SportsScreen', 'SettingScreen'];
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sports"),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
  ];
  void changeBottomNavBar (int index){
    currentIndex = index ;
    if(index==1)
      getBusiness();
    if(index==2)
      getScience();
    if(index==3)
      getSports();
    emit(NewsBottomNavStates());
  }


  List<dynamic>business=[];
  void getBusiness(){
    emit(NewGetBusinessLoadingStates());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'business',
          'apiKey' : '58f0d88b8b814cd496cc102f8c89e622',
        }
    ).then((value) {
       business=value.data['articles'];
      emit(NewGetBusinessSuccessStates());
      print(business);
      //print(value.data.toString());
    }).catchError((error){
      emit(NewGetBusinessErrorStates(error.toString()));
      print(error.toString());
    });
  }

  List<dynamic>sports=[];
  void getSports(){
    emit(NewGetSportLoadingStates());
    if(sports.length==0){
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'us',
            'category':'sports',
            'apiKey' : '58f0d88b8b814cd496cc102f8c89e622',
          }
      ).then((value) {
        sports=value.data['articles'];
        emit(NewGetSportSuccessStates());
        print(sports[0]['title']);
        //print(value.data.toString());
      }).catchError((error){
        emit(NewGetSportErrorStates(error.toString()));
        print(error.toString());
      });
    }else{
      emit(NewGetSportSuccessStates());
    }
  }

  List<dynamic>science=[];
  void getScience(){
    emit(NewGetScienceLoadingStates());
   if(science.length==0){
     DioHelper.getData(
         url: 'v2/top-headlines',
         query: {
           'country':'us',
           'category':'science',
           'apiKey' : '58f0d88b8b814cd496cc102f8c89e622',
         }
     ).then((value) {
       science=value.data['articles'];
       emit(NewGetScienceSuccessStates());
       print(science[0]['title']);
       //print(value.data.toString());
     }).catchError((error){
       emit(NewGetScienceErrorStates(error.toString()));
       print(error.toString());
     });
   }else{
     emit(NewGetScienceSuccessStates());
   }
  }

  bool isDark=false;
  void changeMode({bool? fromShared}) {
    if(fromShared != null) {
      isDark = fromShared;
      emit(ChangeModeThemeApp());
    } else {
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark' , value: isDark ).then((value) {
        emit(ChangeModeThemeApp());

      });
    }
  }

  List <dynamic> search = [];
  void getSearch(String value) {
    emit(NewsLoadingSearchState());

    DioHelper.getData(
      url: 'v2/everything',
      query:
      {
        'q':'$value',
       // 'country':'us',
        'apiKey':'58f0d88b8b814cd496cc102f8c89e622',
      },

    ).then((value) {
      search = value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErrorState(error));
    });

  }




}