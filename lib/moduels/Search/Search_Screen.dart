import 'package:My_News/shared/component/components.dart';
import 'package:My_News/shared/cubit/cubit.dart';
import 'package:My_News/shared/cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
var searchcontroller =TextEditingController();
class SearchScreen extends StatelessWidget {
      SearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context,state){} ,
      builder:(context,state){
        dynamic list= NewsCubit.get(context).Search;

        return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: default_Form(
                      control: searchcontroller,
                      keyboard: TextInputType.text,
                      validate: (String? value){
                        if(value!.isEmpty ){
                          return 'value isEmpty';
                        }
                      },

                      change:(String value){
                        NewsCubit.get(context).getSearch(value);
                      },

                      label: 'Search', icon: Icon(Icons.search)),
                ),

                Expanded(child:
                ConditionalBuilder(
                condition: true,
                builder:(context)=>ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder:(context,index){
                return buildItem(list[index],context);},
                separatorBuilder:(context,index) {
                return myDivider();} ,
                itemCount: list.length),
                fallback:(context)=>Center(child: CircularProgressIndicator()),
                ),)
              ],
            ),

          );},
    );
  }
}
