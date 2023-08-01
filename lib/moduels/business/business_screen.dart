import 'package:My_News/shared/component/components.dart';
import 'package:My_News/shared/cubit/cubit.dart';
import 'package:My_News/shared/cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit= NewsCubit.get(context);
         dynamic list= NewsCubit.get(context).business;
          return ConditionalBuilder(
          condition: cubit.curentindex==0,
          builder:(context)=>ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder:(context,index){
                return buildItem(list[index],context);},
              separatorBuilder:(context,index) {
                return myDivider();} ,
              itemCount: list.length),
          fallback:(context)=>Center(child: CircularProgressIndicator(backgroundColor: Colors.deepOrange,)),
            );
        },
      ),
    );
  }
}
