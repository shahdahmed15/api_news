abstract class NewsStates{}
class NewsInitialStates extends NewsStates{}
class NewsBottomNavStates extends NewsStates{}
class NewGetBusinessLoadingStates extends NewsStates{}
class NewGetBusinessSuccessStates extends NewsStates{}
class NewGetBusinessErrorStates extends NewsStates{
  final String error;
  NewGetBusinessErrorStates(this.error);
}
class NewGetScienceLoadingStates extends NewsStates{}
class NewGetScienceSuccessStates extends NewsStates{}
class NewGetScienceErrorStates extends NewsStates{
  final String error;
  NewGetScienceErrorStates(this.error);
}
class NewGetSportLoadingStates extends NewsStates{}
class NewGetSportSuccessStates extends NewsStates{}
class NewGetSportErrorStates extends NewsStates{
  final String error;
  NewGetSportErrorStates(this.error);
}

class ChangeModeThemeApp extends NewsStates{}

class NewsGetSearchSuccessState extends NewsStates {}

class NewsLoadingSearchState extends NewsStates {}

class NewsGetSearchErrorState extends NewsStates {
  final String error ;
  NewsGetSearchErrorState(this.error);}