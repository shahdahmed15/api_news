
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../modules/webview.dart';
import 'cubit/states.dart';

Widget buildArticleItem(article, context)=>InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(article['url']));
    },
  child:   Padding(

  padding: const EdgeInsets.all(8.0),

          child: Row(

            children: [

               Container(

                 width: 120,

                  height:120,

                decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(20),



             image: DecorationImage(

                 image:article['urlToImage']!=null?NetworkImage('${article['urlToImage']}'):NetworkImage('https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg'),

                 fit: BoxFit.cover

             )

                ),

                ),

              SizedBox(width: 20,),

              Expanded(

               child:  Container(

                height: 120,

                child: Column(

                  mainAxisAlignment: MainAxisAlignment.start,

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                 Text('${article['title']}',

                   style: Theme.of(context).textTheme.bodyText1,maxLines: 3,overflow: TextOverflow.ellipsis,),

                 Text('${article['publishedAt']}',style: Theme.of(context).textTheme.bodyText2,)

  ],

  ),

  )

  )



  ],

  ),

  ),
);
Widget articleBuilder(list,context,{isSearch = false})=> ConditionalBuilder(
  condition:list.length>0,
  builder:(context) =>ListView.separated(
      itemBuilder: (context,index)=>buildArticleItem(list[index],context),
      separatorBuilder: (context,index)=>divieder(),
      itemCount: list.length
  ),
  fallback:(context)=>isSearch ? Container() :Center(child: CircularProgressIndicator()) ,
);

Widget divieder() => Padding(padding: EdgeInsetsDirectional.all(8)) ;

ThemeData buildDarktheme({required cubit})=>ThemeData(
  scaffoldBackgroundColor: Colors.grey
);

void navigateTo(context , widget)=> Navigator.push(context, MaterialPageRoute(builder: (context)=> widget));

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required IconData prefix,
  String hintText="search",
  Function? onSubmit,
  Function? onChange,
  Function? validate,
  Function? onTap,
  Function? suffixPressed,
  bool isPassword=false,
  IconData? suffix,
})=>TextFormField(
  controller: controller,
  keyboardType: type,
  onFieldSubmitted: (value){
    onSubmit!(value);
  },
  onChanged: (value){
    onChange!(value);
  },
  validator:(value){
    validate!(value);
  },
  decoration: InputDecoration(
    hintText: hintText,
    labelText: label,
    prefixIcon: Icon(prefix,),
    suffixIcon: IconButton(
      onPressed: (){
        suffixPressed!();
      },
      icon: Icon(suffix),
    ),
    border: OutlineInputBorder(),
  ),
  onTap: (){
    onTap!();
  },

);

/*Widget buildTaskItem(Map model , context) => Dismissible(
    key: key,
    child: child
);
Widget tasksBuilder({
  required List<Map> tasks ,
}) => ConditionalBuilder(
    condition: tasks.length > 0 ,
    builder: (context) => ListView.separated(
       itemBuilder: (context,index){

       },
    ) ,
    fallback: (context) => Center(child: CircularProgressIndicator()) ,
);*/