
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SettingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
return Container();
     /*return BlocConsumer<NewsCubit,NewsStates>(
         listener: (context,state){},
         builder: (context,state){
           var cubit=NewsCubit.get(context);
           return Center(
             child: SwitchListTile(
               title: Text("gg"),
               value: cubit.isDarkTheme,
               onChanged: (bool value){
                 cubit.changeTheme(value);
               },
             ),
           );
         },

     );*/
  }
}

