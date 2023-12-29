import 'package:api_news/shared/social_shared/state_social.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLoginCubit extends Cubit<SocialloginState>{
  ShopLoginCubit():super(SocialloginInitalState());
  static ShopLoginCubit get(context)=>BlocProvider.of(context);
  IconData suffix=Icons.visibility_outlined;
  bool isPassword=true;
  void ChangePassword(){
    isPassword=!isPassword;
    suffix=isPassword?Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(SocialChangePassword());
  }

}