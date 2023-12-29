import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/social_shared/cubit_social.dart';
import '../../shared/social_shared/state_social.dart';
class SocialLoginScreen extends StatelessWidget {

  var formKey=GlobalKey<FormState>();
  var username = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isVisible=true;
  bool isClicked=false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create:(context)=>ShopLoginCubit(),
        child:BlocConsumer<ShopLoginCubit,SocialloginState>(
          listener: (context,state){},
          builder: (context,state){
            return Scaffold(
              appBar: AppBar(title: Text("Sign up"),),
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child:Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Register",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          SizedBox(height: 10,),
                          TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return"must not empty";
                              }else {return null;}
                            },
                            controller: username,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person_outline),
                                hintText: "User Name",
                                isDense: false,
                                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return"must not empty";
                              }else {return null;}
                            },
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                hintText: "email",
                                isDense: false,
                                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                          SizedBox(height: 20,),

                          TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return"password must not empty";
                              }else {return null;}
                            },
                            controller: passwordController,
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: (){


                                    },
                                    icon: Icon(
                                        Icons.visibility
                                      //  isVisiable?Icons.visibility:Icons.visibility_off,
                                    )
                                ),
                                prefixIcon: Icon(Icons.lock),
                                hintText: "password",
                                isDense: false,
                                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            height: 43,
                            width: double.infinity,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: MaterialButton(onPressed: (){},
                              child: Text("login"),
                            ),
                          ),
                          SizedBox(height: 10,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have Account"),
                              TextButton(onPressed: (){}, child: Text("register"))

                            ],
                          )


                        ],
                      ),
                    ) ,
                  ),
                ),
              ),

            );
          },
        )
    );
  }
}
